import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@Deprecated("use flutter sdk -> CheckBox")
class CheckedBox extends StatelessWidget {
  final double size;
  final bool oval;
  final Color? borderColor;
  final Color? checkColor;
  final bool value;

  CheckedBox({this.value = false, this.size = 20, this.oval = false, this.borderColor, this.checkColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
            child: value ? Icon(Icons.done, color: Colors.white, size: size - 2) : SizedBox(),
            decoration: BoxDecoration(
              shape: oval ? BoxShape.circle : BoxShape.rectangle,
              color: value ? checkColor ?? Theme.of(context).primaryColor : Colors.transparent,
              border:
                  Border.all(color: value ? checkColor ?? Theme.of(context).primaryColor : borderColor ?? Theme.of(context).primaryColor),
            )));
  }
}

class IconCheckedBox extends StatelessWidget {
  final Widget checkedIcon;
  final Widget icon;
  final bool value;

  IconCheckedBox(
      {Key? key,
        this.value = false,
        this.checkedIcon = const Icon(Icons.check_circle_outline,size: 20),
        this.icon = const Icon(Icons.circle_outlined,size: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value ? checkedIcon : icon;
  }
}