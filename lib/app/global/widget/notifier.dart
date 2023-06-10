import 'package:flutter/material.dart';

void notifyUser(BuildContext context, String title, String subtitle) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Sending Message"),
    duration: Duration(milliseconds: 500),
  ));
}
