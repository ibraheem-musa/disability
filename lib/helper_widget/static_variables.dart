
import 'package:disability/helper_widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;


class StaticVariables {
  static final BorderRadius borderRadius = BorderRadius.circular(8);
  static final InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: DisabilityColors.borderColor),
  );
  double height (BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  double width (BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  String lang (BuildContext context){
    return Localizations.localeOf(context).languageCode;
  }

  static final intl.DateFormat unifiedDateFormat =
  intl.DateFormat("yyyy-MM-dd");


  String formattedDate (date) {
   return intl.DateFormat('yyyy-MM-dd').format(date.toLocal());
  }


}