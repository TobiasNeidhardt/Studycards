import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Themengebiet.dart';
import 'package:karteikartenapp/Speicherung/GlobalLib.dart';


import '../Produkt.dart';
import 'Stapel.dart';
import 'Studiengang.dart';
import '../../FileManager.dart';

class Karteikarte extends Produkt {

//____________________________________Variables_________________________________


  var erstellungsDatum;

//Todo Jan Themengebiet / Studiengang / Kurs von KK in Stapel verschieben

  Kurs kurs;

  Studiengang sg;

  String _vorderSeite;
  String _rueckSeite;

  bool answeredTrue = false;
  var schwierigkeit = 0;

  var haufigkeitsFaktor = 1;

  List<String> multipleChoice;

  var id;

  List<File> bilder = new List();

//____________________________________Constructor_______________________________
  Karteikarte();

//____________________________________Builder-Chain_____________________________


  Karteikarte mitID(var id) {
    this.id = id;
    return this;
  }
  



  Karteikarte mitVorderSeite(String vorderSeite) {
    this._vorderSeite = vorderSeite;
    return this;
  }
  Karteikarte mitAnswer(int  a) {
    (a == 0)? this.answeredTrue = false: this.answeredTrue = true;
    return this;
  }

  Karteikarte mitRueckSeite(String rueckSeite) {
    this._rueckSeite = rueckSeite;
    return this;
  }

  Karteikarte mitFileSpeichern(File bild) {
    bilder.add(bild);
    FileManager.writeFile(id, bild,bilder.length -1); // -1 -> dateisystem startet bei 0
    return this;
  }

  Karteikarte mitFile(File bild) {
    bilder.add(bild);
    return this;
  }

  Karteikarte mitKeyStatus() {
    this.answeredTrue = true;
    return this;
  }

  Karteikarte mitSchwierigkeit(int schwere) {
    this.schwierigkeit = schwere;
    return this;
  }

  Karteikarte mitMultipleChoice(List<String> choice) {
    this.multipleChoice = choice;
    return this;
  }

//____________________________________Get/Set___________________________________
  void setID(var x) {
    this.id = x;
  }

  Stapel getStapel() {
    return Stapel();
  }

  Kurs getKurs() {
    return kurs;
  }
  String getRueckSeite(){
  if (_rueckSeite != null)
    return _rueckSeite;
   return '';
  }
  String getVorderSeite(){
    if (_vorderSeite != null)
      return _vorderSeite;
    return '';
  }
  int getAnswer() {
    if (answeredTrue==true) return 1;
    return 0;
  }
  //____________________________________Methods___________________________________

  static Future<Karteikarte> KKfromMapObject(Map<String, dynamic> map) async {
    var id = map['_id'];
    Karteikarte s = new Karteikarte()
    .mitID(id)
    .mitVorderSeite(map['stringvorderseite'])
    .mitRueckSeite(map['stringrueckseite'])
    .mitAnswer(map['answer'])
    ;
    var bilderzahl = map['bilderanzahl'];
    if (bilderzahl > 0 ){
      for (int i = 0 ; i < bilderzahl; i++)
        print('getting file $id, $bilderzahl');
      s.mitFile(await FileManager.getFile(id, bilderzahl));
    }
    return s;
  }




}