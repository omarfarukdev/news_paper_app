
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';

class LoginController extends GetxController{
  late TextEditingController phoneController,passwordController;

  final devicedata = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }
  /*checkUser()async{
    var user = SharedPrefs().getUser();
    if(user!=null){
      Get.offAllNamed(GetRoutes.home);
    }
  }*/
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneController.dispose();
    passwordController.dispose();
  }
  CheckLogin(){
    if(phoneController.text.toString().isEmpty){
      CustomSnackbar("Error", "phone number is required", "error");
    }
    else if(phoneController.text.length!=11){
      CustomSnackbar("Error", "Invalid phone number", "error");
    }
    else if(passwordController.text.isEmpty){
      CustomSnackbar("Error", "Password is required", "error");
    }
    else{

    }
  }
}