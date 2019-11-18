void keyPressed() {
  if (key == ' ') {
    currentMove.start();
    movesString = "";
    counter = 0;
  }
  if (key == 'S') {
    getSolution();
    movesString = "";
    previousMoves = sequence.size();
    solveMove.start();
  }
  //applyMove(key);
  jumbleMove(key);
}

void getSolution() {
  for (int i=sequence.size()-1; i>=previousMoves; i--) {
    solveMove = sequence.get(i).copy();
    solveMove.reverse();
    sequence.add(solveMove);
  }
}

void jumbleMove(char mv) {
  Move m;
  switch(mv) {
  case 'u': 
    m = allMoves[2];
    sequence.add(m);
    movesString = movesString + "U";
    break;
  case 'U': 
    m = allMoves[3];
    sequence.add(m);
    movesString = movesString + "U'";
    break;
  case 'b': 
    m = allMoves[11];
    sequence.add(m);
    movesString = movesString + "B";
    break;
  case 'B': 
    m = allMoves[10];
    sequence.add(m);
    movesString = movesString + "B'";
    break;
  case 'l': 
    m = allMoves[7];
    sequence.add(m);
    movesString = movesString + "L";
    break;
  case 'L': 
    m = allMoves[6];
    sequence.add(m);
    movesString = movesString + "L'";
    break;
  case 'r': 
    m = allMoves[4];
    sequence.add(m);
    movesString = movesString + "R";
    break;
  case 'R': 
    m = allMoves[5];
    sequence.add(m);
    movesString = movesString + "R'";
    break;
  case 'f': 
    m = allMoves[8];
    sequence.add(m);
    movesString = movesString + "F";
    break;
  case 'F': 
    m = allMoves[9];
    sequence.add(m);
    movesString = movesString + "F'";
    break;
  case 'd': 
    m = allMoves[1];
    sequence.add(m);
    movesString = movesString + "D";
    break;
  case 'D': 
    m = allMoves[0];
    sequence.add(m);
    movesString = movesString + "D'";
    break;
  }
}

void applyMove(char move) {
  switch (move) {
  case 'f': 
    turnZ(1, 1);
    break;
  case 'F': 
    turnZ(1, -1);
    break;  
  case 'b': 
    turnZ(-1, 1);
    break;
  case 'B': 
    turnZ(-1, -1);
    break;
  case 'u': 
    turnY(1, 1);
    break;
  case 'U': 
    turnY(1, -1);
    break;
  case 'd': 
    turnY(-1, 1);
    break;
  case 'D': 
    turnY(-1, -1);
    break;
  case 'l': 
    turnX(-1, 1);
    break;
  case 'L': 
    turnX(-1, -1);
    break;
  case 'r': 
    turnX(1, 1);
    break;
  case 'R': 
    turnX(1, -1);
    break;
  }
}
