
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:news_paper_app/app/widgets/loader.dart';

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
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneController.dispose();
    passwordController.dispose();
  }
  CheckLogin(BuildContext context){
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
      Get.showOverlay(asyncFunction: ()=> Login(context),loadingWidget: Loader());
    }
  }
  Login(BuildContext context)async{
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("users/+88${phoneController.text.toString()}").get();
    if (snapshot.exists) {
      if(snapshot.child("password").value==passwordController.text.toString()){
        CustomSnackbar("Success", "Login Successful", "success");
        //Navigator.pop(context);
      }
      print(snapshot.child("password").value);
    } else {
      print('No data available.');
    }
  }
}