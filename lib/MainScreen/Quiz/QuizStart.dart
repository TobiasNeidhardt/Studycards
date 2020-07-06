
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';


class QuizStart extends StatefulWidget{
  QuizNeu quiz;

  QuizStart({@required this.quiz});
  @override
  _QuizStartState createState()=>_QuizStartState();
}

class _QuizStartState extends State<QuizStart>{


  //Todo Backend: anazhl der Karten die Im Quiz sind ändern

  int auswahl=0;


  @override
  Widget build(BuildContext context) {
    int anzahlFragenImQuiz= widget.quiz.fragenliste.length;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stapelname,Thema',)),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(

          children: <Widget>[
            //TODO Backend: Anzahl der Karten einfügen
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text('Wie viele Fragen willst du lernen?',style: MenuButtonTextStyle,),
                ),
              ),
            ),

            Text(auswahl.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black)),

            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.red,
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 20.0),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                ),
                child: Slider(
                  value: auswahl.toDouble(),
                  min: 0,
                  max: anzahlFragenImQuiz.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      auswahl = newValue.round();
                    });
                  },
                ),
              ),
            ),


            Expanded(
              child: WeiterButton(
                color: Colors.green,
                style: WeisserTextStyle,
                text: 'Quiz starten!',
                onPress: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Quiz(quiz: widget.quiz,anzahlFragen: auswahl, )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}