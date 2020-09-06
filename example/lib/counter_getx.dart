import 'package:get/get.dart';

class CounterGetx extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
