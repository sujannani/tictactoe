import 'package:flutter/material.dart';

class TTTProvider extends ChangeNotifier {
  List<List<bool>> tttbool = [
    [false, false, false],
    [false, false, false],
    [false, false, false]
  ];

  List<List<dynamic>> board = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  int playerOscore = 0;
  int playerXscore = 0;

  bool isPlaying = false;
  void whilePlaying() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void fillbool(int i, int j) {
    tttbool[i][j] = true;
    notifyListeners();
  }

  void fillPiece(int i, int j) {
    board[i][j] = (chance == false) ? "X" : "O";
    notifyListeners();
  }

  bool chance = false;
  void changeChance() {
    chance = !chance;
    notifyListeners();
  }

  String winner = "";

  void checkWinner() {
    if ((board[0][0] == "X" && board[0][1] == "X" && board[0][2] == "X") ||
        (board[1][0] == "X" && board[1][1] == "X" && board[1][2] == "X") ||
        (board[2][0] == "X" && board[2][1] == "X" && board[2][2] == "X") ||
        (board[0][0] == "X" && board[1][0] == "X" && board[2][0] == "X") ||
        (board[0][1] == "X" && board[1][1] == "X" && board[2][1] == "X") ||
        (board[0][2] == "X" && board[1][2] == "X" && board[2][2] == "X") ||
        (board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X") ||
        (board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X")) {
      winner = "Player X Wins!!";
      playerXscore++;
      isPlaying = false;
    } else if ((board[0][0] == "O" &&
            board[0][1] == "O" &&
            board[0][2] == "O") ||
        (board[1][0] == "O" && board[1][1] == "O" && board[1][2] == "O") ||
        (board[2][0] == "O" && board[2][1] == "O" && board[2][2] == "O") ||
        (board[0][0] == "O" && board[1][0] == "O" && board[2][0] == "O") ||
        (board[0][1] == "O" && board[1][1] == "O" && board[2][1] == "O") ||
        (board[0][2] == "O" && board[1][2] == "O" && board[2][2] == "O") ||
        (board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O") ||
        (board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O")) {
      winner = "Player O Wins!!";
      playerOscore++;
      isPlaying = false;
    } else if(tttbool.every((row) => row.every((value) => value == true))){
      winner = "Draw";
      isPlaying = false;
    }
    notifyListeners();
  }

  void reset() {
    tttbool = List.generate(3, (_) => List.filled(3, true));
    board = List.generate(3, (_) => List.filled(3, 0));
    notifyListeners();
  }
}
