import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 1;
  List<Widget> cards = List.generate(
    10,
    (index) => Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(fontSize: 60, color: Colors.white),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TopQuestion(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff8b8ba1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      elevation: 2,
                      icon: Icon(Feather.chevron_down),
                      value: _value,
                      items: [
                        DropdownMenuItem(child: Text("Developer"), value: 1),
                        DropdownMenuItem(child: Text("Designer"), value: 2),
                      ],
                      onChanged: (int value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              // tinder card here
              TCard(
                cards: cards,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopQuestion extends StatelessWidget {
  const TopQuestion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Who do you want to match up with?",
      style: TextStyle(
        color: Colors.black,
        fontSize: 38,
        fontFamily: "Proxima Nova",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
