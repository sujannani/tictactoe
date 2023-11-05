import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/pages/tttProvider.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TTTProvider>(builder: (context, ttt, child) {
      return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  const Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Player X",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ttt.playerXscore.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Player O",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ttt.playerOscore.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    (ttt.isPlaying)
                        ? (ttt.chance)
                            ? "Player O's turn"
                            : "Player X's turn"
                        : "",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      for (int row = 0; row < 3; row++)
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int col = 0; col < 3; col++)
                                InkWell(
                                  onTap: () {
                                    if (ttt.isPlaying) {
                                      if (!ttt.tttbool[row][col]) {
                                        ttt.fillbool(row, col);
                                        ttt.fillPiece(row, col);
                                        ttt.checkWinner();
                                        ttt.changeChance();
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: (!ttt.isPlaying)
                                          ? Colors.red.withOpacity(0.5)
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: (ttt.tttbool[row][col])
                                          ? Text(
                                              (ttt.board[row][col] == 0)
                                                  ? ""
                                                  : ttt.board[row][col],
                                              style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    ttt.winner,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  (ttt.isPlaying)
                      ? Container(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                              onPressed: () {
                                ttt.whilePlaying();
                                ttt.reset();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                "Restart",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        )
                      : Container(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                              onPressed: () {
                                ttt.whilePlaying();
                                // ttt.reset();
                                ttt.winner = "";
                                ttt.board =
                                    List.generate(3, (_) => List.filled(3, 0));
                                ttt.tttbool = List.generate(
                                    3, (_) => List.filled(3, false));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                "Play",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        )
                ],
              ),
            ),
          ),
        )),
      );
    });
  }
}
