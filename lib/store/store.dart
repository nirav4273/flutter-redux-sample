

// One simple action: Increment
import 'package:flutter/cupertino.dart';

enum ActionDisptach { Increment, RTL, LTR }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
String counterReducer(String state, dynamic action) {
    print(action);
    if(action == ActionDisptach.LTR){
      return "LTR";
    }
    if(action == ActionDisptach.RTL){
      return "RTL";
    }
    return state;
}

class UserRedcuer{
  String name;
  int id;
  String direction = 'LRT';

  UserRedcuer({this.id, this.name, this.direction = 'RTL'});

  UserRedcuer copyWith({
    String name,
    int id,
    String direction
  }){
    return UserRedcuer(
        name: name ?? this.name,
        id: id ?? this.id,
        direction: direction ?? this.direction
    );
  }

  factory UserRedcuer.initial(){
    return new UserRedcuer(
        id: 1,
        name: "USer NAME"
    );
  }
}

class ClassRedcuer{
  String name;
  int classId;

  ClassRedcuer({this.classId, this.name});

  ClassRedcuer copyWith({
    String name,
    int classId
  }){
    return ClassRedcuer(
      name: name ?? this.name,
      classId: classId ?? this.classId
    );
  }

  factory ClassRedcuer.initial(){
    return new ClassRedcuer(
      classId: 101,
      name: "CLASS NAME"
    );
  }
}

class MainReducer{
  UserRedcuer userRedcuer;
  ClassRedcuer classRedcuer;
  MainReducer({
    @required this.userRedcuer,
    @required this.classRedcuer
  });

  factory  MainReducer.initial(){
    return MainReducer(
      classRedcuer: ClassRedcuer.initial(),
      userRedcuer: UserRedcuer.initial()
    );
  }

  MainReducer copyWith({
    UserRedcuer userRedcuer,
    ClassRedcuer classRedcuer,
  }){
    return MainReducer(
        userRedcuer: userRedcuer ?? this.userRedcuer,
        classRedcuer: classRedcuer ?? this.classRedcuer
    );
  }
}


enum StoreAction  { CHANGE_DIRECTOIN }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
MainReducer mainReducer(MainReducer state, dynamic action) {
  if(action.action == StoreAction.CHANGE_DIRECTOIN){
    return state.copyWith(
      userRedcuer: state.userRedcuer.copyWith(direction: action.data)
    );
  }
  return state;
}

class ActionType{
  StoreAction action;
  dynamic data;
  ActionType({this.action, this.data});
}