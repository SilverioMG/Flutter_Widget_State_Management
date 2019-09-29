import 'package:flutter/material.dart';

import 'TapBoxB.dart';

/**
 * Ejemplo de un 'Widget padre' que controla el comportamiento de un 'Widget hijo'.
 */
class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxchanged(bool newValue){
    //Al ejecutar el método 'setState()' se vuelve a ejecutar el método 'build()' y se dibuja
    //otra vez este 'Widget' incluyendo a su 'Hijo' (con el nuevo estado enviado en el constructor).
    setState(() {
      this._active = newValue;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapboxchanged,
      ),
    );
  }
}
