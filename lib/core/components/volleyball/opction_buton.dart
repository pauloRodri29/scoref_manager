import 'package:flutter/material.dart';

class OptionButonVolleyball extends StatelessWidget {
  final void Function()? onPressed;
  const OptionButonVolleyball({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.sports_volleyball),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.restart_alt,
          ),
        ),
        Icon(Icons.sports_volleyball),
      ],
    );
  }
}
