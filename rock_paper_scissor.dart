import 'dart:io';

List<String> baiMoves = ['rock', 'paper', 'scissors'];

/// Get Bai names.
String getBaiName(String defaultBaiName) {
  stdout.write('Enter $defaultBaiName name: ');
  String? baiInput = stdin.readLineSync();

  if (baiInput == null || baiInput.trim().isEmpty) {
    return defaultBaiName;
  }

  return baiInput.trim();
}

/// Checks Bai's move if valid.
String? checkBaiMove(String? baiInput) {
  if (baiInput == null) {
    return null;
  }

  String baiMove = baiInput.trim().toLowerCase();

  if (baiMoves.contains(baiMove)) {
    return baiMove;
  }

  return null;
}

/// Bai must valid move.
String getBaiMove(String baiName) {
  while (true) {
    stdout.write('$baiName, enter your move: ');
    String? baiInput = stdin.readLineSync();

    String? baiMove = checkBaiMove(baiInput);

    if (baiMove != null) {
      return baiMove;
    }

    print('Bai your move is Invalid. Please enter rock, paper, or scissors.');
  }
}

/// Decides win and returns to Bai name winning player.
String? theBaiWinner(
  String baiName1,
  String baiMove1,
  String baiName2,
  String baiMove2,
) {
  if (baiMove1 == baiMove2) {
    return null;
  }

  if ((baiMove1 == 'rock' && baiMove2 == 'scissors') ||
      (baiMove1 == 'paper' && baiMove2 == 'rock') ||
      (baiMove1 == 'scissors' && baiMove2 == 'paper')) {
    return baiName1;
  }

  return baiName2;
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  //Call getBaiName instead of getBaiMove
  String playerBaiOne = getBaiName('Player 1');
  String playerBaiTwo = getBaiName('Player 2');

  int baiScoreOne = 0;
  int baiScoreTwo = 0;
  int roundBai = 1;

  String playAgainBai;

  do {
    print('\n--- Round $roundBai ---');

    String baiMoveOne = getBaiMove(playerBaiOne);

    // Hide bai's move
    for (int i = 0; i < 30; i++) {
      print('');
    }

    // Call getBaiMove with playerBaiTwo
    String baiMoveTwo = getBaiMove(playerBaiTwo);

    print('\n$playerBaiOne chose $baiMoveOne.');
    print('$playerBaiTwo chose $baiMoveTwo.');

    //Pass player names into winner calculator
    String? theWinnerBai = theBaiWinner(
      playerBaiOne,
      baiMoveOne,
      playerBaiTwo,
      baiMoveTwo,
    );

    if (theWinnerBai == playerBaiOne) {
      baiScoreOne++;
      print('Result: $playerBaiOne wins the round!');
    } else if (theWinnerBai == playerBaiTwo) {
      baiScoreTwo++;
      print('Result: $playerBaiTwo wins the round!');
    } else {
      print('Result: It\'s a draw!');
    }

    print('Score -> $playerBaiOne: $baiScoreOne | $playerBaiTwo: $baiScoreTwo');

    stdout.write('Play again? (y/n): ');
    String? baiAnswer = stdin.readLineSync();
    playAgainBai = (baiAnswer ?? 'n').trim().toLowerCase();

    roundBai++;
  } while (playAgainBai == 'y');

  print('\n===== FINAL SCORE =====');
  print('$playerBaiOne: $baiScoreOne | $playerBaiTwo: $baiScoreTwo');

  if (baiScoreOne > baiScoreTwo) {
    print('Overall winner: $playerBaiOne');
  } else if (baiScoreTwo > baiScoreOne) {
    print('Overall winner: $playerBaiTwo');
  } else {
    print('Overall winner: It\'s a draw!');
  }
}
