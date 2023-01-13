
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  CustomPasswordField({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);
  final String hint;
  late bool obscureText;
  final TextEditingController? controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 12,
            ),
          ]
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xff949494),
          ),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                widget.obscureText =!widget.obscureText;
              });
            },
            color: Colors.grey.withOpacity(0.9),
            icon: Icon(
              widget.obscureText?Icons.visibility_off:Icons.visibility
            ),
          )
        ),

      ),
    );
  }
}
