import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
                Text("data")
              ],
            ),
          ),
        ),
    );
  }
}
