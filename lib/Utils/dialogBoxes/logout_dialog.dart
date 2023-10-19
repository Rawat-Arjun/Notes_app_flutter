import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_app/Utils/dialogBoxes/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return genericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Are you sure, You want to log out ? ',
    optionsBuilder: () => {
      'Cancel': false,
      'Log Out': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
