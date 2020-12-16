import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.grey,
  );
  final iconSubtitleStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  final iconMapper = <String, IconData> {
    'phone'  : Icons.phone,
    'nearme' : Icons.near_me,
    'share'  : Icons.share,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createImg(),
            _createMainRow(),
            _createAction(),
            _createTextField(),
            _createTextField(),
            _createTextField(),
          ],
        )
      ),
    );
  }

  Widget _createImg() {
    return FadeInImage(
      placeholder: AssetImage('assets/img/loading.gif'),
      image: NetworkImage(
          'https://i.pinimg.com/originals/a1/78/55/a1785592d41e140f00ef1cf3d9597dcb.png'),
      fit: BoxFit.cover,
    );
  }

  Widget _createMainRow() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: <Widget>[
            //Para que ocupe todo el espacio posible en la fila
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Paisaje vectorial', style: titleStyle),
                  SizedBox(height: 7.0),
                  Text('Ejemplo de paisaje', style: subtitleStyle),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text('41',
              style: TextStyle(
              fontSize: 20.0,
            )),
          ],
        ),
      ),
    );
  }

  Widget _createAction() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _createIconWithSubtitle('phone', 'CALL'),
          _createIconWithSubtitle('nearme', 'ROUTE'),
          _createIconWithSubtitle('share', 'SHARE'),
        ],
      ),
    );
  }

  Widget _createIconWithSubtitle(String icon, String subtitle){
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            iconMapper[icon], 
            color: Colors.blue, 
            size: 40.0
          ), 
          onPressed: null
        ),
        SizedBox(height: 5.0),
        Text(
          subtitle,
          style: iconSubtitleStyle,
        )
      ],
    );
  }

  Widget _createTextField() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical:10.0),
        child: Text(
          'Lorem fistrum torpedo quietooor está la cosa muy malar papaar papaar qué dise usteer a gramenawer no te digo trigo por no llamarte Rodrigor condemor quietooor. Por la gloria de mi madre la caidita te va a hasé pupitaa no puedor se calle ustée. Apetecan fistro no puedor te voy a borrar el cerito a gramenawer. Jarl apetecan no puedor va usté muy cargadoo tiene musho peligro qué dise usteer. Torpedo diodenoo pecador mamaar ese hombree condemor pecador diodeno. Quietooor a peich está la cosa muy malar a peich ahorarr ese hombree torpedo por la gloria de mi madre. No puedor apetecan al ataquerl diodeno diodenoo está la cosa muy malar ese que llega a gramenawer pecador. ',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
