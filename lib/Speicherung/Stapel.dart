import 'package:karteikartenapp/Speicherung/Karteikarte.dart';

import 'Produkt.dart';

class Stapel extends Produkt {
//____________________________________Variables_______________________________
 List<Karteikarte> stapelKarten;
 String name;

//____________________________________Constructor_____________________________
 Stapel();

 //____________________________________Builder-Chain___________________________
 Stapel mitName(String name){
  this.name = name;
  return this;
 }

//____________________________________Methods_________________________________
 add(Karteikarte k){stapelKarten.add(k);} // convienice
}