import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Ejemplo de un Widget que controla su estado y también lo controla su widget padre.
 */
class TapBoxC extends StatefulWidget{
  TapBoxC({Key key, this.active: false, @required this.onChanged})
    :super(key:key) {

  }

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

//Este widget controla su estado mostrando un 'borde' cada vez que se hace tap (se presiona y se suelta)
//sobre él. El 'Widget' padre controla su estado cambiando el texto que se muestra.
class _TapBoxCState extends State<TapBoxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState((){
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    //'widget' es el objecto de tipo 'Widget' (TapBoxC) al que pertenece esta clase 'State'.
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: Container(
          child: Center(
            child: Text(widget.active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight ?
            Border.all(color: Colors.teal[700], width: 10.0) : null,
          ),
        )
    );
  }

}