
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomSnackbar(title,message,type){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type=="error" ?Colors.red:Colors.green,
    colorText: Colors.white,
  );
}