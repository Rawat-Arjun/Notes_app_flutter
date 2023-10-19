import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_app/Utils/dialogBoxes/generic_dialog.dart';

Future<void>showErrorDialog(
  BuildContext context,
  String text ) {
  return genericDialog(
    context: context,
    title: 'An Error Occured',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
