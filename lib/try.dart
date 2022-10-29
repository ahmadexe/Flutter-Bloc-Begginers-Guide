import 'package:flutter/material.dart';

Nav(BuildContext context, Widget Screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Screen));
}
