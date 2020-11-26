import 'package:clean_architecture/presentation/presenter/user_viewmodel.dart';
import 'package:clean_architecture/presentation/widget/custom_button.dart';
import 'package:clean_architecture/presentation/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserViewModel _userViewModel;
  @override
  void initState() {
    _userViewModel = context.read<UserViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    _userViewModel.dispose();
    super.dispose();
  }

  _retrieveUser() {
    _userViewModel.retrieveUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Consumer<UserViewModel>(
              builder: (context, userViewModel, child) {
                if (userViewModel.getUser == null) {
                  return CustomTextWidget(text: 'Push the button');
                } else {
                  return CustomTextWidget(
                      text: 'User name: ${userViewModel.getUser.name}');
                }
              },
            ),
            CustomButton(
              onPressed: _retrieveUser,
              text: 'Retrieve user',
            ),
          ],
        ),
      ),
    );
  }
}
