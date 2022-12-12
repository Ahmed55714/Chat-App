// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String Error;
  const ErrorScreen({
    Key? key,
    required this.Error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Error),
    );
  }
}
