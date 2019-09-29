import 'package:flutter/material.dart';

/**
 * Ejemplo de un Widget que administra su propio estado.
 */
class TapBoxA extends StatefulWidget{
  TapBoxA({Key key}) : super(key: key){
    print("Contructor TapBoxA");
  }

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;

  void _handleTap(){
    setState(() { //Se vuelve a ejecutar el método 'build()' volviendo a crear un nuevo 'Widget' con otro estado.
      _active = !_active;
    });
  }

  //Se ejecuta este método cada vez que se llama al método 'setState()' de la clase base.
  //Se vuelve a dibujar el 'Widget' con el nuevo valor para el campo '_active'.
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white)
          )
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.red[600]
        )
      )
    );
  }

}