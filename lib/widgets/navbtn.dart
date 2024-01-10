import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Navbtn extends StatefulWidget {
  final String label;
  final int current;
  late int btnIndex;
  final dynamic stateChange;
  Navbtn(
      {super.key,
      required this.label,
      required index,
      required this.current,
      required Function this.stateChange}) {
    btnIndex = index;
  }
  @override
  State<Navbtn> createState() => _NavbtnState();
}

class _NavbtnState extends State<Navbtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () {
          widget.stateChange(widget.btnIndex);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.current == widget.btnIndex
              ? Colors.white
              : Colors.blue[900],
          elevation: 0.0,
        ),
        child: Text(
          widget.label,
          style: TextStyle(
              color: widget.current == widget.btnIndex
                  ? Colors.blue[900]
                  : Colors.white),
        ),
      ),
    );
  }
}
