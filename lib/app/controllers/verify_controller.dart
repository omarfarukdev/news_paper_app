import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:news_paper_app/app/views/account_screen.dart';
import 'package:news_paper_app/app/views/home/home_screen.dart';
import 'package:news_paper_app/app/views/news/bookmark_screen.dart';
import 'package:news_paper_app/app/widgets/loader.dart';

class VerifyController extends GetxController{
  late String phone,otp,verifyId;
  late TextEditingController usernameController,
      mobileNumberController,
      emailController,
      companyNameController,
      addressController,
      passwordController,
      confirmPasswordController,
      oneOtpController,
      twoOtpController,
      threeOtpController,
      fourOtpController,
      fiveOtpController,sixOtpController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    oneOtpController = TextEditingController();
    twoOtpController = TextEditingController();
    threeOtpController = TextEditingController();
    fourOtpController = TextEditingController();
    fiveOtpController = TextEditingController();
    sixOtpController = TextEditingController();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    oneOtpController.dispose();
    twoOtpController.dispose();
    threeOtpController.dispose();
    fourOtpController.dispose();
    fiveOtpController.dispose();
    sixOtpController.dispose();
  }
  checkVerify(String id){

    otp=oneOtpController.text.toString()+twoOtpController.text.toString()+threeOtpController.text.toString()+fourOtpController.text.toString()+fiveOtpController.text.toString()+sixOtpController.text.toString();
    if(oneOtpController.text.isEmpty||twoOtpController.text.isEmpty||threeOtpController.text.isEmpty||fourOtpController.text.isEmpty||fiveOtpController.text.isEmpty||sixOtpController.text.isEmpty){
      CustomSnackbar("Error", "Invalid OTP", "error");
    }
    else{
      Get.showOverlay(asyncFunction: ()=>VerifyOTP(id),loadingWidget: Loader());
    }
  }

  VerifyOTP(String id) async{

    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: id, smsCode: otp);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      CustomSnackbar("Success", "message", "success");

    }catch(e){
      CustomSnackbar("Error", "${e.toString()}", "error");
    }

  }

}