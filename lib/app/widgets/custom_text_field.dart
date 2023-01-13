import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  CustomInputTextField({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*height:60,
      width: 150,*/
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width:1,color: Colors.black,
              ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width:1,color: Colors.black,
            ),
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Color(0xff949494),
          ),
        ),
      ),
    );
  }
}
