import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:karteikartenapp/Speicherung/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Themengebiet.dart';
import 'package:karteikartenapp/Speicherung/GlobalLib.dart';


import 'Produkt.dart';
import 'Stapel.dart';
import 'Studiengang.dart';
import 'FileManager.dart';

class Karteikarte extends Produkt {

//____________________________________Variables_________________________________


  var erstellungsDatum;

//Todo Jan Themengebiet / Studiengang / Kurs von KK in Stapel verschieben

  Kurs kurs;

  Studiengang sg;

  String vorderSeite;
  String rueckSeite;

  bool keyKarte = false;
  var schwierigkeit = 0;

  var haufigkeitsFaktor = 1;

  List<String> multipleChoice;

  var id;

  List<File> bilder = new List();

//____________________________________Constructor_______________________________
  Karteikarte() {
    var gl = new GlobalLib();
    this.id = gl.call();
  }


//____________________________________Builder-Chain_____________________________


  Karteikarte mitID(var id) {
    this.id = id;
    return this;
  }
  



  Karteikarte mitVorderSeite(String vorderSeite) {
    this.vorderSeite = vorderSeite;
    return this;
  }

  Karteikarte mitRueckSeite(String rueckSeite) {
    this.rueckSeite = rueckSeite;
    return this;
  }
  
  
  Karteikarte mitFile(File bild) {
     bilder.add(bild);
     FileManager.writeFile(id, bild,bilder.length -1); // -1 -> dateisystem startet bei 0
    return this;
  }

  Karteikarte mitKeyStatus() {
    this.keyKarte = true;
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



//____________________________________Methods___________________________________

  static Karteikarte KKfromMapObject(Map<String, dynamic> map) {
    Karteikarte s = new Karteikarte()
    .mitID(map['_id'])
    .mitVorderSeite(map['stringvorderseite'])
    .mitRueckSeite(map['stringrueckseite'])
    ;
    return s;
  }

}