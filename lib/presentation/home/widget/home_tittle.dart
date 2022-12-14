import 'package:flutter/material.dart';

class HomeTittle extends StatelessWidget {
  const HomeTittle({
    Key? key,
    required this.tittle,
  }): super(key: key);
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style:const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
