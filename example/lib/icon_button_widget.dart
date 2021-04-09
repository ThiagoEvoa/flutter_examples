import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Slidable.of(context).open(actionType: SlideActionType.secondary);
      },
      icon: Icon(Icons.more_vert_rounded),
    );
  }
}
