import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.text = "primary",
    this.color = const Color(0xff0887FC),
    this.onTap,
    this.padding = 60,
    @required this.alt,
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onTap;
  final double padding;
  final bool alt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
        ),
        side: MaterialStateProperty.all(
            BorderSide(color: Theme.of(context).primaryColor)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(alt ? Colors.transparent : color),
      ),
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: alt ? Theme.of(context).primaryColor : Colors.white,
                fontSize: 16,
                letterSpacing: 0.32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
