
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label,required this.onPressed})
      : super(key: key);

  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
        decoration: BoxDecoration(
            color: Color(0xffF2861E),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 12,
              ),
            ]
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
