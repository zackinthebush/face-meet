import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.onPress,@required this.icon});
  final IconData? icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Center(child: Icon(icon, color: Colors.white,size: 22.0,)),
      padding: const EdgeInsets.all(5.0),
      elevation: 5.0,
      constraints: const BoxConstraints.tightFor(
        width: 55.0,
        height: 40.0,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.deepOrange,
      onPressed: onPress,

    );
  }
}
