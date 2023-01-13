import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/controllers/login_controller.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/utils/custom_snackbar.dart';
import 'package:news_paper_app/app/widgets/custom_button.dart';
import 'package:news_paper_app/app/widgets/custom_password_field.dart';
import 'package:news_paper_app/app/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   final loginController = Get.put(LoginController());
   final devicedata = GetStorage();
   final dararef = FirebaseDatabase.instance.ref("post");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2861E),
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GetBuilder<LoginController>(
            builder: (controller){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 54,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  CustomTextField(
                    hint: 'phone number',
                    keyboardType:  TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                  /* SizedBox(height: 10,),
                CustomTextField(
                  hint: 'Password',
                  obscureText: true,
                ),*/
                  SizedBox(height: 10,),
                  CustomPasswordField(
                    hint: "Password",
                    obscureText: true,
                    controller: controller.passwordController,
                  ),
                  /*SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff949494),
                            fontWeight: FontWeight.w500
                        ),
                        text: 'Forgot Password',
                        recognizer: TapGestureRecognizer()
                          ..onTap=(){
                            devicedata.write("type", "forgot");
                            Get.toNamed(GetRoutes.phone);
                          },
                      ),
                    ),
                  ),*/
                  SizedBox(height: 20,),
                  CustomButton(
                    label: "Login",
                    onPressed: (){
                      //controller.CheckLogin();
                      Get.offNamed(GetRoutes.signup);
                    },
                  ),
                  SizedBox(height: 20,),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Color(0xff949494),
                      ),
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account?',
                        ),
                        TextSpan(
                          text: ' Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap=(){
                              devicedata.write("type", "new");
                              Get.toNamed(GetRoutes.signup);

                            },
                          style: TextStyle(
                            color: Color(0xff6b7afc),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false) ,
                    softWrap: false,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
