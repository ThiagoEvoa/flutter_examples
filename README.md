# Pincode Fields
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/pincode.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  pin_code_fields: ^6.1.0
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  StreamController<ErrorAnimationType> errorController;
  final TextEditingController textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final String pin = '123456';
  bool hasError = false;
  String currentValue;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: PinCodeTextField(
              validator: (value) {
                if (value == pin) {
                  hasError = false;
                  return null;
                } else {
                  hasError = true;
                  return 'Wrong pin';
                }
              },
              onCompleted: (value) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                activeColor: hasError ? Colors.red : Colors.white,
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: Colors.white,
                disabledColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
