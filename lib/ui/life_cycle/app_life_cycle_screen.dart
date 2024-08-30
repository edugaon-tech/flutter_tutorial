import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/basics/buttons_view.dart';

class AppLifeCycleScreen extends StatefulWidget {
  const AppLifeCycleScreen({super.key});

  @override
  State<AppLifeCycleScreen> createState() => _AppLifeCycleScreenState();
}

class _AppLifeCycleScreenState extends State<AppLifeCycleScreen> with WidgetsBindingObserver {

  AppLifecycleState ? appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ButtonsViews()));
        }, child: Text("$appLifecycleState")),
      ),
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appLifecycleState = state;
    setState(() {
      print("this is current state $state");
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
