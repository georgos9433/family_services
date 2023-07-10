import 'package:family_services/Widgets/bottomSheet.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  CustomChip({super.key, required this.textLable});

  var textLable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textLable,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  // fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              // SizedBox(width: 10,),
              // InkWell(
              //   onTap: (){
              //     filters[textLable]=false;
              //   },
              //   child: Icon(
              //         Icons.cancel_outlined,
              //
              //       ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
