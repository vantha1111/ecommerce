
import 'package:flutter/material.dart';

class UCheckBoxtheme {
  UCheckBoxtheme._();

   static CheckboxThemeData lightcheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor:  MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    }),
   );

   static CheckboxThemeData darkcheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor:  MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    }),
   );
}