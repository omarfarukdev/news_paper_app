
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:news_paper_app/app/widgets/loader.dart';

class RegisterController extends GetxController{
  final devicedata = GetStorage();
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

    usernameController =TextEditingController();
    mobileNumberController =TextEditingController();
    emailController =TextEditingController();
    companyNameController = TextEditingController();
    addressController =TextEditingController();
    passwordController =TextEditingController();
    confirmPasswordController =TextEditingController();
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
    usernameController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    companyNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    oneOtpController.dispose();
    twoOtpController.dispose();
    threeOtpController.dispose();
    fourOtpController.dispose();
    fiveOtpController.dispose();
    sixOtpController.dispose();
  }
  checkSignup(){
    if(usernameController.text.isEmpty){
      CustomSnackbar("Error", "Username is required", "error");
      return;
    }
    else if(mobileNumberController.text.isEmpty){
      CustomSnackbar("Error", "Mobile Number is required", "error");
    }
    else if(mobileNumberController.text.length!=11){
      CustomSnackbar("Error", "Invalid Mobile Number", "error");
    }
    else if(emailController.text.isEmpty||GetUtils.isEmail(emailController.text.toString())==false){
      CustomSnackbar("Error", "A Valid email is required", "error");
    }

    else if(addressController.text.isEmpty){
      CustomSnackbar("Error", "Address is required", "error");
    }
    else if(passwordController.text.isEmpty){
      CustomSnackbar("Error", "Password is required", "error");
    }
    else if(passwordController.text != confirmPasswordController.text){
      CustomSnackbar("Error", "Password dosenot match!", "error");
    }
    else{
      Get.showOverlay(asyncFunction: ()=>signup(),loadingWidget: Loader());
    }
  }
  signup() async {
    phone="+88"+mobileNumberController.text.toString();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verifyId=verificationId;
        Get.offNamed(GetRoutes.phone,arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  checkVerify(){
    otp=oneOtpController.text.toString()+twoOtpController.text.toString()+threeOtpController.text.toString()+fourOtpController.text.toString()+fiveOtpController.text.toString()+sixOtpController.text.toString();
    if(oneOtpController.text.isEmpty||twoOtpController.text.isEmpty||threeOtpController.text.isEmpty||fourOtpController.text.isEmpty||fiveOtpController.text.isEmpty||sixOtpController.text.isEmpty){
      CustomSnackbar("Error", "Invalid OTP", "error");
    }
    else{
      Get.showOverlay(asyncFunction: ()=>VerifyOTP(),loadingWidget: Loader());
    }
  }

  VerifyOTP() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
  }


}