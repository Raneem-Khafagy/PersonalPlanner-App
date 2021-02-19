import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myplanner/Controllers/TaskController.dart';
import 'package:myplanner/Models/TaskData.dart';
import 'package:provider/provider.dart';

class AddNewTaskButton extends StatelessWidget {
  AddNewTaskButton({Key key, this.typeofAdd, this.iconofAdd}) : super(key: key);
  final String typeofAdd;
  final iconofAdd;

  ////////
  final taskController = TextEditingController();

  String currTask = '';
  bool remindMe = false;
  DateTime reminderDate;
  TimeOfDay reminderTime;
  int id;

  ///////

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedButton(
      buttonTextStyle:
          TextStyle(color: Theme.of(context).accentColor, fontSize: 14),
      icon: Icons.add,
      // text: 'Add ' + typeofAdd,
      text: '',
      color: Theme.of(context).primaryColor,
      pressEvent: () {
        AwesomeDialog dialog;
        dialog = AwesomeDialog(
          context: context,
          customHeader: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: Offset(0, 1),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                iconofAdd,
                color: Theme.of(context).accentColor,
                size: 40,
              ),
            ),
          ),
          animType: AnimType.SCALE,
          keyboardAware: true,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .03, vertical: height * .007),
            child: Column(
              children: <Widget>[
                Text(
                  typeofAdd,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: taskController,
                    autofocus: true,
                    minLines: 1,
                    onChanged: (newVal) {
                      currTask = newVal;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Title',
                      prefixIcon: Icon(Icons.text_fields),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SwitchListTile(
                  value: remindMe,
                  // title: Text('Reminder'),
                  onChanged: (newValue) async {
                    if (newValue) {
                      reminderDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 2),
                      );

                      if (reminderDate == null) {
                        return;
                      }

                      reminderTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (reminderDate != null && reminderTime != null) {
                        remindMe = newValue;
                      }
                    } else {
                      reminderDate = null;
                      reminderTime = null;
                      remindMe = newValue;
                    }

                    print(reminderTime);
                    print(reminderDate);
                  },
                  subtitle: Text('Remind me of this task'),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                    child: remindMe
                        ? Text('Set the reminder at: ' +
                            DateTime(
                                    reminderDate.year,
                                    reminderDate.month,
                                    reminderDate.day,
                                    reminderTime.hour,
                                    reminderTime.minute)
                                .toString())
                        : null),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      dialog: dialog,
                      eventOnTap: () async {
                        if (remindMe) {
                          var scheduledNotificationDateTime = reminderDate
                              .add(Duration(
                                  hours: reminderTime.hour,
                                  minutes: reminderTime.minute))
                              .subtract(Duration(seconds: 5));
                          var androidPlatformChannelSpecifics =
                              AndroidNotificationDetails(
                            currTask,
                            'To Do Notification',
                            'Do the task',
                            priority: Priority.max,
                            importance: Importance.max,
                            playSound: true,
                          );
                          var iOSPlatformChannelSpecifics =
                              IOSNotificationDetails();
                          NotificationDetails platformChannelSpecifics =
                              NotificationDetails(
                                  android: androidPlatformChannelSpecifics,
                                  iOS: iOSPlatformChannelSpecifics);
                          id = Provider.of<TaskData>(context, listen: false)
                              .tasks
                              .length;
                          print(id);
                          await FlutterLocalNotificationsPlugin();
                        }

                        Provider.of<TaskData>(
                          context,
                          listen: false,
                        ).addTask(Task(
                          taskTitle: currTask,
                          taskIsChecked: false,
                          taskReminderDate: reminderDate == null
                              ? null
                              : reminderDate.add(Duration(
                                  hours: reminderTime.hour,
                                  minutes: reminderTime.minute,
                                )),
                          taskId: reminderDate != null ? id : null,
                        ));
                        // Navigator.pop(context);
                        dialog.dissmiss();
                      },
                      textShown: 'Add task',
                      width: width,
                      height: height,
                    ),
                    ActionButton(
                      dialog: dialog,
                      eventOnTap: () {
                        dialog.dissmiss();
                      },
                      textShown: 'Close',
                      width: width,
                      height: height,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )..show();
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.dialog,
    @required this.textShown,
    @required this.eventOnTap,
    @required this.width,
    @required this.height,
  }) : super(key: key);
  final AwesomeDialog dialog;
  final String textShown;
  final Function eventOnTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .02),
        padding: EdgeInsets.symmetric(
            horizontal: width * .05, vertical: height * .02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Theme.of(context).dividerColor),
        child: GestureDetector(
          onTap: eventOnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                textShown,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
