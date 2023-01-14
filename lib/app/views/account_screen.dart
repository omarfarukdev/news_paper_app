import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_paper_app/app/routes/routes.dart';
import 'package:news_paper_app/app/widgets/custom_button.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final checkdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          //decoration: BoxDecoration(color: Colors.deepPurple),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    label: "Logout",
                    onPressed: (){
                      //controller.ForgotPassword();
                      showDialog(
                        context: context,
                        builder: (context)=>AlertDialog(
                          title: Text("Logout?"),
                          content: Text("Are you aure you want to logout?"),
                          actions: [
                            ElevatedButton(
                                style:ElevatedButton
                                    .styleFrom(
                                    primary: Colors.red
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            ElevatedButton(
                                onPressed: (){
                                  //await SharedPrefs().removeUser();
                                  checkdata.write('isLogged', false);
                                  Navigator.pop(context);
                                  //Get.offAllNamed(GetRoutes.login);
                                },
                                child: Text("Confirm")),
                          ],
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
    );
  }
}
