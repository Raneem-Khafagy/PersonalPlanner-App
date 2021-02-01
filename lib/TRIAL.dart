import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewNoteTextField extends StatelessWidget {
  final headLineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 5.0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              //expands: true,
              //maxLines: 2,
              // showCursor: true,
              controller: headLineController,
              decoration: InputDecoration(
                hintText: 'your note',
                prefixIcon: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                ),
              ),

              autofocus: false,

              maxLines: null,

              //onSubmitted: () {},

              // scrollPadding: const EdgeInsets.all(8)
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return Center(
    child: Container(
      child: Column(
        children: [
          Icon(
            CupertinoIcons.delete,
          ),
          Icon(
            Icons.edit,
          )
        ],
      ),
    ),
  );
}
