import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_paper_app/app/controllers/register_controller.dart';
import 'package:news_paper_app/app/controllers/verify_controller.dart';
import 'package:news_paper_app/app/widgets/custom_button.dart';

class PhoneVerifyScreen extends StatelessWidget {
   PhoneVerifyScreen({Key? key}) : super(key: key);
  final registerController =Get.put(VerifyController());
  var data=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2861E),
        title: Text("data"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: GetBuilder<VerifyController>(
              builder: (controller){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verification",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        "Please enter OTP sent",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical:2,horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "to ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              data[2],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OtpInput(controller.oneOtpController, true,context),
                          OtpInput(controller.twoOtpController, false,context),
                          OtpInput(controller.threeOtpController, false,context),
                          OtpInput(controller.fourOtpController, false,context),
                          OtpInput(controller.fiveOtpController, false,context),
                          OtpInput(controller.sixOtpController, false,context),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 10),
                      child: CustomButton(
                          label: "Send",
                          onPressed:(){
                            controller.checkVerify(data[0],data[1],data[2],data[3],data[4],data[5]);
                          }),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  Widget OtpInput(TextEditingController controller,bool autoFocus,BuildContext context){
    return SizedBox(
      height: 60,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 12,
              ),
            ]
        ),
        child: TextField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color(0xff949494),
            ),
            counterText: '',
          ),

          /* decoration: const InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.black ),
              ),
              border: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.black ),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.blue ),
              ),

              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),*/
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
