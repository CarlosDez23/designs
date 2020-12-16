import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget> [
            _createPageOne(),
            _createPageTwo(),
          ],
        ),
      )
    );
  }

  Widget _createPageOne() {
    //Colocamos los elementos uno encima de otro
    return Stack(
      children: [
        //Los primeros más al fondo y los últimos más arriba
        _createBackground(),
        _createBackgroundImage(),
        _createContent(),
      ],
    );
  }

  Widget _createPageTwo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108,192,218,1.0),
      child: Center(
        //Botón redondeado
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: (){} ,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical:20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize:20.0)),
          ),
        ),
      )
    );
  }

  Widget _createBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108,192,218,1.0),
    );
  }

  Widget _createBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/img/scrollbackground.jpeg'),
        fit: BoxFit.cover,
      ),

    );
  }

  Widget _createContent() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50.0,
    );
    return SafeArea(
      child: Column(
        children: <Widget> [ 
          SizedBox(height: 20.0),
          Text('11º', style: textStyle),
          Text('Miércoles', style: textStyle),
          //Que ocupe todo el espacio libre
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
        ],
      ),
    );
  }
}