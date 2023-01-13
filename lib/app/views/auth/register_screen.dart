import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_paper_app/app/controllers/register_controller.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/widgets/custom_button.dart';
import 'package:news_paper_app/app/widgets/custom_password_field.dart';
import 'package:news_paper_app/app/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final registerController =Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2861E),
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GetBuilder<RegisterController>(
            builder: (controller){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 80,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 54,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  CustomTextField(
                    hint: 'Username',
                    controller: controller.usernameController,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'phone number',
                    controller: controller.mobileNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Email',
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    hint: 'Address',
                    controller: controller.addressController,
                  ),
                  SizedBox(height: 10,),
                  CustomPasswordField(
                    hint: 'Password',
                    obscureText: true,
                    controller: controller.passwordController,
                  ),
                  SizedBox(height: 10,),
                  CustomPasswordField(
                    hint: 'Confirm Password',
                    obscureText: true,
                    controller: controller.confirmPasswordController,
                  ),
                  SizedBox(height: 20,),
                  CustomButton(
                    label: "Sign up",
                    onPressed: (){
                      controller.checkSignup();
                      //controller.checkSignup(Get.arguments,devicedata.read("device_id"),devicedata.read("device_model"),devicedata.read("device_os"));
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
                          text: 'Already have an account?',
                        ),
                        TextSpan(
                          text: ' Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap=(){
                              Get.toNamed(GetRoutes.login);
                              //CustomSnackbar("Test", "${devicedata.read("device_id")}", "test");
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
