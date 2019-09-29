import 'package:flutter/material.dart';

import 'TapBoxC.dart';

/**
 * Ejemplo de widget que controla es estado de su widget hijo que a su vez también controla
 * su propio estado.
 */
class ParentWidget extends StatefulWidget{

  ParentWidget parentWidget(){

  }

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapboxChanged
      )
    );
  }
}