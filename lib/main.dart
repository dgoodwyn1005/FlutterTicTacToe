import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/tictactoe_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MainApp())
  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.deepPurple,
        brightness: Brightness.dark,),
      ),
      builder: EasyLoading.init(),
      home: const TicTacToePage(),
    );
  }
}