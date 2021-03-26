import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String statusDescription;
  final String statusValue;

  const StatusWidget(
      {Key key, @required this.statusDescription, @required this.statusValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).textTheme.bodyText1.color,
            width: 0.1,
          ),
        ),
      ),
      child: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$statusDescription : ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                statusValue,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
