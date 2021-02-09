import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Themes.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  var currentDate = DateTime.now();
  DateTime selectedDate;
  final Widget AddWidget;

  Header({Key key, this.AddWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    void _datePicker() {
      showDatePicker(
        context: context,
        initialDate: currentDate,
        lastDate: DateTime(2030),
        firstDate: DateTime(1999),
      ).then((value) {
        if (value == null) return;
      });
    }

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: height * 0.1,
              padding: EdgeInsets.all(height * 0.035),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AddWidget,
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.calendar_today,
                  //   ),
                  //   onPressed: _datePicker,
                  // ),
                  IconButton(
                    icon: Icon(themeNotifier.iconTheme),
                    onPressed: () {
                      themeNotifier.darkorlight = !(themeNotifier.darkorlight);
                      themeNotifier.setTheme(themeNotifier.darkorlight);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
