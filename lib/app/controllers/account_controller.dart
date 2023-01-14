
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController{

  final checkdata = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkdata.writeIfNull('isLogged', false);
  }
  signOut(){

    checkdata.write("login","false");
  }
}