library s1_basics.badge_controller;

import 'package:angular/angular.dart';
import 'dart:math' show Random;
import 'package:s1_basics/model.dart';


@NgController(
  selector: '[badge-controller]',
  publishAs: 'ctrl')
class BadgeController {
  //static const DEFAULT_NAME = 'Anne Bonney';
    static const LABEL1 = 'Arrr! Write yer name!';
    static const LABEL2 = 'Aye! Gimme a name!';
    
    static const List names = const [
       'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
       'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];

     static const List appellations = const [
       'Jackal', 'King', 'Red', 'Stalwart', 'Axe',
       'Young', 'Brave', 'Eager', 'Wily', 'Zesty'];
    
     String _name = '';

     get name => _name;

     set name(newName) {
       _name = newName;
       pn..firstName = newName
         ..appellation = _oneRandom(appellations);
     }
  
  bool get inputIsNotEmpty => name.trim().isNotEmpty;
    String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

    generateName() {
      name = _oneRandom(names);
    }
    
    String _oneRandom(List<String> list) =>
          list[new Random().nextInt(list.length)];
    
    PirateName pn = new PirateName();
    
    String get pirateName => pn.firstName.isEmpty ? '' :
          '${pn.firstName} the ${pn.appellation}';
}