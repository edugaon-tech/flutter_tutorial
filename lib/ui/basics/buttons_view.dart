import 'package:flutter/material.dart';

class ButtonsViews extends StatefulWidget {
  const ButtonsViews({super.key});

  @override
  State<ButtonsViews> createState() => _ButtonsViewState();
}

class _ButtonsViewState extends State<ButtonsViews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton( // simple a button view
              onPressed: () {},
              // this is to show view on the button
              style: ElevatedButton.styleFrom(),
              // your code into this braces on pressed
              child: Text("Button name"), // styling the button, size, color, etc
            ),
            // there are a lot buttons here
            TextButton( // show simple button with text only
              onPressed: () {},
              child: Text("your text button name"),
            ),
            IconButton(// show simple button with icon only
              onPressed: () {},
                icon: const Icon(Icons.add),
            ),
            ToggleButtons(isSelected: [true,false], children: [
              Text("sadns"),
              Text("sadns"),
            ])
          ],
        ),
      ),
    );
  }
}
