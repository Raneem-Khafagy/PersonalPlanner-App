import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({
    Key key,
    @required this.height,
    @required this.width,
    @required this.title,
    @required this.description,
    this.noteId,
  }) : super(key: key);

  final double height;
  final double width;
  final String title;
  final String description;
  final noteId;

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
          ),
          Text(
            "date created in",
          ),
        ],
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            description,
          ),
        )
      ],
    );
  }
}
