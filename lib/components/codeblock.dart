import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Codeblock extends StatefulWidget {
  const Codeblock({super.key, required this.code, required this.name});

  final String code;
  final String name;

  @override
  State<Codeblock> createState() => _CodeblockState();
}

class _CodeblockState extends State<Codeblock> {
  var _copied = false;

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.code)).then((value) {
      setState(() {
        _copied = true;
      });
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _copied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Material(
        color: Color(0xff171717),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name and Copy Button
            Container(
              decoration: BoxDecoration(
                color: Color(0xff151515),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              padding: const EdgeInsets.only(
                left: 14.0,
                right: 10.0,
                top: 6.0,
                bottom: 6.0,
              ),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: copyToClipboard,
                    child: Icon(
                      (_copied) ? Icons.done : Icons.content_paste,
                      size: 15,
                      color: (_copied) ? Colors.greenAccent : Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[900]!,
            ),

            // Code
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.code,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
