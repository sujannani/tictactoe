import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/pages/tictactoe.dart';
import 'package:tictactoe/pages/tttProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TTTProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TicTacToe(),
      ),
    );
  }
}
