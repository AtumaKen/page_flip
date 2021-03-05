import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final VoidCallback? onFlip;

  const SignIn({Key? key, required this.onFlip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        textFields("email")!,
        textFields("password")!,
        BottomFlipIconButton(onFlip: onFlip,),

      ],),
    );
  }
  Widget? textFields(String text){
    return TextField(
      decoration: InputDecoration(hintText: text),
    );
  }
}

class BottomFlipIconButton extends StatelessWidget {
  const BottomFlipIconButton({Key? key, this.onFlip}) : super(key: key);
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFlip,
          icon: const Icon(Icons.flip),
        )
      ],
    );
  }
}
