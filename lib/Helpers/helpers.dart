import 'package:flutter/material.dart';

void navigatePush(BuildContext context, Widget myScreen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => myScreen));
}

///
///
///

/// 1- use the suitble navigators in thr right places
/// 2- add list for the other categories
