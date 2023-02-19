import 'package:flutter/material.dart';

enum ButtonType { small, large }

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonType buttonType;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.buttonType,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.small:
        return ElevatedButton(
          style: ButtonStyle(
            foregroundColor:
                Theme.of(context).elevatedButtonTheme.style?.foregroundColor,
            backgroundColor:
                Theme.of(context).elevatedButtonTheme.style?.backgroundColor,
            shape: Theme.of(context).elevatedButtonTheme.style?.shape,
            textStyle: Theme.of(context).elevatedButtonTheme.style?.textStyle,
          ),
          onPressed: onPressed,
          child: Text(text),
        );
      case ButtonType.large:
        return Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: SizedBox(
            height: 56.0,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.foregroundColor,
                backgroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor,
                shape: Theme.of(context).elevatedButtonTheme.style?.shape,
                textStyle:
                    Theme.of(context).elevatedButtonTheme.style?.textStyle,
              ),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        );
    }
  }
}
