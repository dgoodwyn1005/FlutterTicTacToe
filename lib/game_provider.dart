import 'package:flutter/foundation.dart';

class GameProvider extends ChangeNotifier {
  bool player1Turn = true;
  bool gameOver = false;
  String winner = "";
  var tiles = [];

  void init() {
    tiles = ["-", "-", "-", "-", "-", "-", "-", "-", "-"];
  }

  void reset() {
    tiles = ["-", "-", "-", "-", "-", "-", "-", "-", "-"];
    player1Turn = true;
    gameOver = false;
    winner = "";
    notifyListeners();
  }
  
  void chooseTile(tile) {
    if (!gameOver && tiles[tile] == "-") {
      if (player1Turn) {
        tiles[tile] = "X";
      }else{
        tiles[tile] = "O";
      }

      checkWin();
      changeTurn();
    }
    notifyListeners();
  }

  void changeTurn() {
    player1Turn = !player1Turn;
    notifyListeners();
  }

  String bottomText() {
    if (!gameOver) {
      if (player1Turn) {
        return "Player 1's Turn";
      } else {
        return "Player 2's Turn";
      }
    } else {
      return winner;
    }
  }

  void checkWin() {
    //Check Rows

    //Row 1
    if (tiles[0] == tiles[1] && tiles[1] == tiles[2]) {
      if (tiles[0] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[0] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }
    //Row 2
    if (tiles[3] == tiles[4] && tiles[4] == tiles[5]) {
      if (tiles[3] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[3] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }
    //Row 3
    if (tiles[6] == tiles[7] && tiles[7] == tiles[8]) {
      if (tiles[6] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[6] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }

    //Check Columns

    //Column 1
    if (tiles[0] == tiles[3] && tiles[3] == tiles[6]) {
      if (tiles[0] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[0] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }
    //Column 2
    if (tiles[1] == tiles[4] && tiles[4] == tiles[7]) {
      if (tiles[1] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[1] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }
    //Column 3
    if (tiles[2] == tiles[5] && tiles[5] == tiles[8]) {
      if (tiles[2] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[2] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }

    //Check Diagonals
    if (tiles[0] == tiles[4] && tiles[4] == tiles[8]) {
      if (tiles[0] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[0] == "O") {
        gameOver = true;
        winner = "Player 2 Wins!";
      }
    }

    if (tiles[2] == tiles[4] && tiles[4] == tiles[6]) {
      if (tiles[2] == "X") {
        gameOver = true;
        winner = "Player 1 Wins!";
      } 
      if (tiles[2] == "O"){
          gameOver = true;
          winner = "Player 2 Wins!";
      }
    }
    notifyListeners();
  }
}