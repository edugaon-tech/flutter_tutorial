// import 'package:flutter/material.dart';
//
// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key});
//
//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }
//
// class _UserScreenState extends State<UserScreen> {
//
//   var name = "ALi";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: AppName(child: Column(
//           children: [
//             Text("Data"),
//             MyNameView(),
//             ElevatedButton(onPressed: onChangeName, child: Text("On Chnage"))
//           ],
//         ),
//       )),
//     );
//   }
//
//   onChangeName(){
//     setState(() {
//      name = "Ansar";
//     });
//
//   }
// }
//
// class AppName extends InheritedWidget{
//   final String? name;
//
//   AppName({super.key, this.name, required super.child, this.onNameChanged});
//
//   @override
//   bool updateShouldNotify(covariant AppName oldWidget) {
//     return name != oldWidget.name;
//   }
//
//   void Function()? onNameChanged;
//
//   static AppName? of(BuildContext context){
//     return context.dependOnInheritedWidgetOfExactType<AppName>();
//   }
//
// }
//
// class MyNameView extends StatelessWidget {
//   const MyNameView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var name = AppName.of(context)?.name;
//     return Text(name??"NA");
//   }
// }
//
//
//
//

import 'package:flutter/material.dart';

void main() {
  runApp(
    ThemeSwitcher(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemedWidget(),
    );
  }
}
class ThemedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeInheritedWidget.of(context)?.themeData ?? ThemeData.light();

    return Scaffold(
      appBar: AppBar(
        title: Text('Themed App'),
        backgroundColor: theme.primaryColor,
      ),
      body: Center(
        child: Text(
          'This is a themed widget!',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ThemeSwitcher.of(context)?.toggleTheme();
        },
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}

class ThemeSwitcher extends StatefulWidget {
  final Widget child;

  ThemeSwitcher({required this.child});

  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      themeData: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: widget.child,
    );
  }
}

class ThemeInheritedWidget extends InheritedWidget {
  final ThemeData themeData;
  final Widget child;

  ThemeInheritedWidget({required this.themeData, required this.child}) : super(child: child);



  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return oldWidget.themeData != themeData;
  }

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }
}

