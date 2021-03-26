import 'package:flutter/material.dart';
import 'package:myapp/app/main_screen/widget/pokedex_widget.dart';
import 'package:myapp/app/settings_screen/screen/setting_screen.dart';
import 'package:myapp/core/util/navigation_util.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _openSettingsScreen() {
    push(context: context, screen: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: PokedexWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSettingsScreen,
        child: Icon(Icons.settings),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}
