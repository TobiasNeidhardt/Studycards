import 'package:flutter/material.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';


class AlleStapel extends StatefulWidget{

  @override
  _AlleStapel createState()=>_AlleStapel();

}


class _AlleStapel extends State<AlleStapel> {


  @override
  Widget build(BuildContext context) {

    //TODO Backend: Liste mit Stapeln anlegen, und so viele MenuButtons erzeugen wie es Stapel gibt
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('Meine angelegten Stapel',style: WeisserTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Center(
              child: MenuButton(
                text: 'Stapelname\nThemengebiet',
                onPress: (){
                  Navigator.pushNamed(context, 'EinzelnerStapelStatus');
                },
              ),
            ),









          ],
        ),
      ),
    );
  }

}