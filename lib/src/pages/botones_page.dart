import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          _createBackground(),
          SingleChildScrollView(
            child: Column(
              children: <Widget> [
                _createTitles(),
                _createRoundedButtons(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _createBackground() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0,0.6),
          end: FractionalOffset(0.0, 1.0),
          colors:[
            Color.fromRGBO(52,54,101,1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
        ),
      ),
    );

    final pinkBoxGradient = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ]
          ),
        ),
      )
    );

    return Stack(
      children: <Widget> [
        gradient,
        Positioned(
          top: -100.0,
          child: pinkBoxGradient,
        ),
      ],
    );
  }

  Widget _createTitles() {

    final titleStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );

    final subtitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text('Classify transaction', style: titleStyle),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category', style: subtitleStyle),
          ],
        )
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context){
    //Aplicamos un tema personalizado al widget
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:  Color.fromRGBO(55,57,84,1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme
          .copyWith(caption: TextStyle(color: Color.fromRGBO(116,117,152,1.0)))
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _createRoundedButtons() {
    return Table(
      children: <TableRow> [
        TableRow(
          children: <Widget> [
            _createButton(Colors.blue, Icons.border_all, 'General'),
            _createButton(Colors.purpleAccent, Icons.directions_bus, 'Bus'),
          ],
        ),
        TableRow(
          children: <Widget> [
            _createButton(Colors.pinkAccent, Icons.shop, 'Buy'),
            _createButton(Colors.orange, Icons.insert_drive_file, 'File'),
          ],
        ),
        TableRow(
          children: <Widget> [
            _createButton(Colors.blueAccent, Icons.movie_filter, 'Entertainment'),
            _createButton(Colors.green, Icons.cloud, 'Grocery'),
          ],
        ),
        TableRow(
          children: <Widget> [
            _createButton(Colors.red, Icons.collections, 'Photos'),
            _createButton(Colors.teal, Icons.help_outline, 'General'),
          ],
        )
      ],
    );
  }

  Widget _createButton(Color color, IconData icon, String title) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 30.0),
                radius: 35.0,
              ),
              Text(title, style: TextStyle(color: color)),
            ],
          )
        ),
      ),
    );
  }
}