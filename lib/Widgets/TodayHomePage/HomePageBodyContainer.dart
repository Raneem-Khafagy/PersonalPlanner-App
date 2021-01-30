import 'package:flutter/material.dart';

class HomePageBodyContainer extends StatelessWidget {
  final height, width;
  const HomePageBodyContainer({Key key, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(261, 51),
              topRight: Radius.elliptical(261, 51),
            ),
          ),
        ),
      ),
    );
  }
}
