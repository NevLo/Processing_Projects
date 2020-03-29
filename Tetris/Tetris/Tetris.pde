int squaresize;
int size; 
ArrayList<Tetromino> pieces;
void setup() {
  size(1000, 1000);
  squaresize = height / 20;
  size = width/4; 
  pieces = new ArrayList<Tetromino>();
  frameRate(30);
}
int count = 0;
void draw() {
  background(2);
  drawgrid();
  boolean updateFrame = false;
  for (int i = 0; i < pieces.size(); i++) {
    pieces.get(i).show();
    if (count >= 30) {
      updateFrame = true;
      pieces.get(i).update();
    }
  }
  if (pieces.size() == 0 || !pieces.get(pieces.size()-1).isUpdateable()) {
    pieces.add(new Tetromino(4, 0));
  }
  //print(count);
  if(!updateFrame){
    count++;
  }else{
    count = 0;
  }
  
  //println();
}

void drawgrid() {
  strokeWeight(1);
  stroke(51);
  for (int i = 0; i < height; i+= squaresize) {
    line(size, i, size*3, i);
  }
  for (int i = size + squaresize; i < size * 3; i+=squaresize) {
    line(i, 0, i, height);
  }
  strokeWeight(5);
  stroke(255, 0, 0);
  line(size, 0, size, height);
  line(size*3, 0, size*3, height);
}

void keyPressed() {
  if (keyCode == LEFT) {
    //print("PRESSING LEFT");
    if (pieces.size() != 0) {
      pieces.get(pieces.size()-1).moveLeft();
    }
  } else if (keyCode == RIGHT) {
    //print("PRESSING RIGHT");
    if (pieces.size() != 0) {
      pieces.get(pieces.size()-1).moveRight();
    }
  } else if (keyCode == DOWN) {
    if (pieces.size() != 0) {
      pieces.get(pieces.size()-1).update();
    }
  }
}
