
import 'package:flutter/material.dart';

class TapBoxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key:key){

  }

  void _handleTap(){
    //Se ejecuta el método asignado por el 'Widget Padre' cuando crea a este hijo.
    onChanged(!active);
  }

  Widget build(BuildContext){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: new Text(
            active ? 'Active From parent' : 'Desactive from Parent',
            style: TextStyle(fontSize: 32.0, color: Colors.white)
          )
        ),
        decoration: BoxDecoration(
        color: active ? Colors.lightGreen[700] : Colors.red[500]
        )
      )
    );
  }
}