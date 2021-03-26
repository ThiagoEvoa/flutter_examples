import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

push({@required BuildContext context, @required Widget screen}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

pushReplacement({@required BuildContext context, @required Widget screen}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

pop({@required BuildContext context}) {
  Navigator.of(context).pop();
}
