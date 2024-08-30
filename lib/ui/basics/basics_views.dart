import 'package:flutter/material.dart';

class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(// to create a vertical view use column
        children: [ // add multiple widget into the children
          Text("your text",// to show text on the screen
            style: TextStyle(), // text style class use to style the text like color, size,font style, alignment etc.
          ),

        ],
      ),
    );
  }
}
