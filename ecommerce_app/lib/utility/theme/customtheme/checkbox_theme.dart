import 'package:flutter/material.dart';

class TcheckboxTheme{
  TcheckboxTheme._();


  static CheckboxThemeData lightcheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){

          return Colors.white;
      }
      else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;


      }
      else{
        return Colors.transparent;
      }
    })
  );



    static CheckboxThemeData darkcheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){

          return Colors.white;
      }
      else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;


      }
      else{
        return Colors.transparent;
      }
    })
  );
}