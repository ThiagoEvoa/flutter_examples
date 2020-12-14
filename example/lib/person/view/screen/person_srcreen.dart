import 'package:example/core/util/riverpods.dart';
import 'package:example/core/view/widget/custom_button.dart';
import 'package:example/core/view/widget/custom_snackbar.dart';
import 'package:example/core/view/widget/custom_textform_field.dart';
import 'package:example/person/model/dto/person_dto.dart';
import 'package:example/person/viewmodel/person_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonScreen extends StatefulWidget {
  final PersonDTO person;

  const PersonScreen({Key key, this.person}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  PersonViewModel _personViewModel;

  String _validateForm(String value) {
    return value.isEmpty ? 'Required Field' : null;
  }

  @override
  void initState() {
    _personViewModel = context.read(personProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: widget?.person?.name);

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Person'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: CustomTextFormField(
                controller: _controller,
                validator: (value) => _validateForm(value),
                labelText: 'Name',
              ),
            ),
            CustomButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await _personViewModel.savePerson(
                    person: PersonDTO(
                      id: widget?.person?.id,
                      name: _controller.text,
                    ),
                  );
                  showSnackBar(
                    scaffolsKey: _globalKey,
                    content: _personViewModel.getMessage,
                  );
                }
              },
              label: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
