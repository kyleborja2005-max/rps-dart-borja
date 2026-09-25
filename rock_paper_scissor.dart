import 'dart:io';

List<String> baiMoves = ['rock', 'paper', 'scissors'];

/// Gets the name of a player.
String getBaiName(String defaultBaiName) {
  stdout.write('Enter $defaultBaiName name: ');
  String? baiInput = stdin.readLineSync();

  if (baiInput == null || baiInput.trim().isEmpty) {
    return defaultBaiName;
  }

  return baiInput.trim();
}

/// Gets a player's move.
String getBaiMove(String baiName) {
  stdout.write('$baiName, enter your move: ');
  String? baiInput = stdin.readLineSync();

  return baiInput ?? '';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String playerBaiOne = getBaiName('Player 1');
  String playerBaiTwo = getBaiName('Player 2');

  print('\n--- Round 1 ---');

  String baiMoveOne = getBaiMove(playerBaiOne);

  // Hide Player 1's move.
  for (int i = 0; i < 30; i++) {
    print('');
  }

  String baiMoveTwo = getBaiMove(playerBaiTwo);

  print('$playerBaiOne chose $baiMoveOne.');
  print('$playerBaiTwo chose $baiMoveTwo.');
}
