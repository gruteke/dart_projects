library s1_basics.badge_controller;

import 'package:angular/angular.dart';
//import 'dart:math' show Random;
import 'package:s1_basics/model.dart';
import 'package:s1_basics/services/names_service.dart';
import 'dart:async' show Future;


@NgController(
  selector: '[badge-controller]',
  publishAs: 'ctrl')
class BadgeController {
  NamesService ns;
  
  //bool dataLoaded = false;
  
  
  
  BadgeController(this.ns);
  
  //static const DEFAULT_NAME = 'Anne Bonney';
    static const LABEL1 = 'Arrr! Write yer name!';
    static const LABEL2 = 'Aye! Gimme a name!';
    
    //static const List names = const [
     //  'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
     //  'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];

    // static const List appellations = const [
     //  'Jackal', 'King', 'Red', 'Stalwart', 'Axe',
     //  'Young', 'Brave', 'Eager', 'Wily', 'Zesty'];
     
     static List<String> names = [];
     static List<String> appellations = [];
    
     String _name = '';

     get name => _name;

     set name(newName) {
         _name = newName;
         ns.randomAppellation().then((appellation) {
           pn..firstName = newName
             ..appellation = appellation;
         });
       }
  
  bool get inputIsNotEmpty => name.trim().isNotEmpty;
    String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

    
    
    Future generateName() => ns.randomName().then((aName) {
        name = aName;
      });
    
    
    
    PirateName pn = new PirateName();
    
    String get pirateName => pn.firstName.isEmpty ? '' :
          '${pn.firstName} the ${pn.appellation}';
}