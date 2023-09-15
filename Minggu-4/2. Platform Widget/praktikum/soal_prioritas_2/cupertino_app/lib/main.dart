import 'package:flutter/cupertino.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: CupertinoColors.black),
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Cupertino App'),
          ),
          child: Center(
            child: Text('This is Cupertino App'),
          )),
    );
  }
}
