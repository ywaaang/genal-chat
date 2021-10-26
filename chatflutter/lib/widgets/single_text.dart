import 'package:flutter/widgets.dart';

class SingleTextWeight extends StatelessWidget {
  final String text = "示例文字";
  final Color color = Color.fromARGB(0, 0, 0, 1);
  final double fontSize = 12.0;

  SingleTextWeight({Key? key, text, color, fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: this.color, fontSize: this.fontSize),
      overflow: TextOverflow.ellipsis,
    );
  }
}
