import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt counter1 = 0.obs, counter2 = 0.obs, sum = 0.obs;

  void increase1() {
    counter1++;
    update();
  }

  void increase2() {
    counter2++;
    update();
  }

  int sumsSum() {
    sum.value = counter1.value + counter2.value;
    return sum.value;
  }
}
