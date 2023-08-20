import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:flutter/material.dart';


class CustomDesign {
  BoxDecoration costumeBoxDecoration({Color contenarColor=Colors.white,Color borderColor=Colors.white,double borderWidth=0,double circular=16}){

    return  BoxDecoration(
      borderRadius: BorderRadius.circular(circular),
      color: contenarColor ,
      border: Border.all(
        color:  borderColor,
        style: BorderStyle.solid,
        width: borderWidth,
      ),
    );
  }

  BoxDecoration costumeBoxDecorationWithOutBorder({Color contenarColor=Colors.white,double borderRadios=0, }){
    return  BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadios),
      color: contenarColor ,

    );
  }


}