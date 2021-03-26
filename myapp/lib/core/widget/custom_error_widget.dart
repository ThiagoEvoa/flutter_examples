import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomErrorWidget extends StatelessWidget {
  final void Function() onPressed;

  const CustomErrorWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          Text(
            '${AppLocalizations.of(context).error}',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.replay_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
