import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key key,
    @required this.noteTitle,
    @required this.noteDescription,
    this.noteId,
    this.noteDate,
  }) : super(key: key);

  final String noteTitle;
  final String noteDescription;
  final noteId;
  final String noteDate;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ExpansionCard(
      margin: EdgeInsets.only(bottom: height * 0.01),
      backgroundColor: Theme.of(context).dividerColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            noteTitle,
          ),
          Text(
            noteDate,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: width * .001, right: width * .001, bottom: height * 0.02),
          child: Text(
            noteDescription,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
