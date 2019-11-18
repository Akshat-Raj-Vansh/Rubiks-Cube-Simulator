import peasy.*;
PeasyCam cam;

float speed = 0.5;
int dim = 3;
int previousMoves = 12;
String movesString = "URBLDFF'D'L'B'R'U'";
Cubie[] cube = new Cubie[dim*dim*dim];
//creates an object array for storing cubes
//creates an object array for storing all possible moveset
Move[] allMoves = new Move[] {
  new Move(0, 1, 0, 1), //D
  new Move(0, 1, 0, -1), //D'
  new Move(0, -1, 0, 1), //U
  new Move(0, -1, 0, -1), //U'
  new Move(1, 0, 0, 1), //R
  new Move(1, 0, 0, -1), //R'
  new Move(-1, 0, 0, 1), //L'
  new Move(-1, 0, 0, -1), //L
  new Move(0, 0, 1, 1), //F
  new Move(0, 0, 1, -1), //F'
  new Move(0, 0, -1, 1), //B'
  new Move(0, 0, -1, -1) //B
};
//all the possible moveset including u, U, b,  B, l, L, r, R, f, f, d, and D

ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;
boolean started = false;
Move currentMove;
Move solveMove;
//creates small cubes and places(translates them to different locations)
void setup() {
  size(600, 600, P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 400);//for the change perspective using the mouse
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z); 
        cube[index] = new Cubie(matrix, x, y, z);//creates small unique cubes
        index++;
      }
    }
  }
  
  tryAllMoves();
  currentMove = sequence.get(counter);
  //additionally stores the reverse of the sequence in order to solve the random moves.
  for (int i = sequence.size()-1; i >= 0; i--) {
    Move nextMove = sequence.get(i).copy();
    nextMove.reverse();
    sequence.add(nextMove);
  }
  //currentMove.start();
}

void tryAllMoves() {
  sequence.add(allMoves[2]);//U
  sequence.add(allMoves[4]);//R
  sequence.add(allMoves[11]);//B
  sequence.add(allMoves[7]);//L
  sequence.add(allMoves[0]);//D
  sequence.add(allMoves[8]);//F
  sequence.add(allMoves[9]);//F'
  sequence.add(allMoves[1]);//D'
  sequence.add(allMoves[6]);//L'
  sequence.add(allMoves[10]);//B'
  sequence.add(allMoves[5]);//R'
  sequence.add(allMoves[3]);//U'
}

void draw() {
  background(40); 

  cam.beginHUD();
  fill(255);
  textSize(20);
  text("Rubiks Cube Simulator", 200, 550);
  textSize(15);
  text(movesString, 10, 20);
  cam.endHUD();
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);

  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }


  scale(50);
  for (int i = 0; i < cube.length; i++) {
    push();
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
      rotateY(-currentMove.angle);
    }   
    cube[i].show();
    pop();
  }
}
