import 'package:flutter/material.dart';

class BottomTabItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onPressed;

  BottomTabItem({this.icon, this.title, this.onPressed});

  @override
  _BottomTabItemState createState() => _BottomTabItemState();
}

class _BottomTabItemState extends State<BottomTabItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Column(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
