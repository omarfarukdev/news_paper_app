import 'package:get/get.dart';

class NaviControllare extends GetxController{

  var selectedIndex = 0.obs;

  void changeIndex(int index){
    selectedIndex.value = index;
  }

}