import 'package:example/core/util/navigation.dart';
import 'package:example/core/util/riverpods.dart';
import 'package:example/core/view/widget/custom_snackbar.dart';
import 'package:example/person/model/dto/person_dto.dart';
import 'package:example/person/view/screen/person_srcreen.dart';
import 'package:example/person/viewmodel/person_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  PersonViewModel _personViewModel;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  _openPersonScreen({PersonDTO person}) {
    push(
      context: context,
      screen: PersonScreen(
        person: person,
      ),
    );
  }

  @override
  void initState() {
    _personViewModel = context.read(personProvider);
    _personViewModel.fetchPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('People'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          List<PersonDTO> people = watch(personProvider.state);
          if (people == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (people.length == 0) {
            return Center(child: Text('Nothing here :('));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                _personViewModel.fetchPeople();
              },
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => _openPersonScreen(
                        person: people[index],
                      ),
                      title: Text(people[index].name),
                      trailing: IconButton(
                        onPressed: () async {
                          await _personViewModel.deletePerson(
                            person: people[index],
                          );
                          showSnackBar(
                            scaffolsKey: _globalKey,
                            content: _personViewModel.getMessage,
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPersonScreen,
        child: Icon(Icons.person),
      ),
    );
  }
}
