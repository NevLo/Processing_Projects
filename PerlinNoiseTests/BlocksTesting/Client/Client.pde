int w = 600;
int h = 600;
int scl = 40;
Block b1;
Block b2;
Block b3;
Block b4;
Block b5;
Block b6;
Block[] b;
Chunk c1;
boolean rightPressed, leftPressed;
boolean upPressed, downPressed;
boolean f3Pressed;

void setup() {
  size(600, 600, P3D); 
  b1 = new Block((byte) 0, new PVector(0, 0, 0));
  b2 = new Block((byte) 1, new PVector(1, 0, 0));
  b3 = new Block((byte) 2, new PVector(0, 1, 0));
  b4 = new Block((byte) 3, new PVector(0, 0, 1));
  b5 = new Block((byte) 4, new PVector(1, 1, 0));
  b6 = new Block((byte) 5, new PVector(1, 0, 1));
  b = drawTree(new PVector(0, 2, 0));
  c1 = new Chunk(0, 0, 0);
  //c1.generateRandomChunk();
  println(b1.getName());
  println(b2.getName());
  println(b3.getName());
  println(b4.getName());
  println(b5.getName());
  println(b6.getName());
}
float angle = 0;
void keyPressed() {
  if (keyCode == RIGHT) {
    upPressed = false; 
    downPressed = false;
    leftPressed = false;
    rightPressed = true;
    return;
  }
  if (keyCode == LEFT) {
    upPressed = false; 
    downPressed = false;
    rightPressed = false;
    leftPressed = true;
    return;
  }
  if (keyCode == UP) {
    leftPressed = false;
    rightPressed = false;
    upPressed = true; 
    downPressed = false;
    return;
  }
  if (keyCode == DOWN) {
    leftPressed = false;
    rightPressed = false;
    upPressed = false; 
    downPressed = true;
    return;
  }
  if (keyCode == ENTER) {
    f3Pressed = !f3Pressed;
    return;
  }

  leftPressed = false;
  rightPressed = false;
  upPressed = false; 
  downPressed = false;
}
float y = h/2;
void draw() {
  directionalLight(255, 255, 255, -1, 1, -1);


  translate(w/2, y);
  rotateX(PI/3);
  rotateZ(angle);

  background(150, 200, 255);
  if (keyPressed && leftPressed) {
    angle += .05;
  }
  if (keyPressed && rightPressed) {
    angle -=.05;
  }
  if (keyPressed && upPressed) {

    y = y + 1;
  }
  if (keyPressed && downPressed) {

    y -= 1;
  }
  if (f3Pressed) {
    drawAxes();
  }
  //c1.drawChunk();
  b1.drawBlock();
  b2.drawBlock();
  b3.drawBlock();
  b4.drawBlock();
  b5.drawBlock();
  b6.drawBlock();

  if (b != null) {
    for (Block b0 : b) {
      if (b0 != null) {
      b0.drawBlock();
      }
    }
  } else {
  print("EMPTY");
  }
}
void drawAxes() {
  stroke(0);

  line(0, 0, 0, 0, 0, 20000);
  line(0, 0, 0, 0, 20000, 0);
  line(0, 0, 0, 20000, 0, 0);
}
void setUpFun() {
}

Block[] drawTree(PVector pos) {
  Block[] blocks;
  int i = 0;
  int h = (int) random(4, 8);

  blocks = new Block[h+48+8];

  for (; i < h; i++) {
    blocks[i] = new Block((byte) 3, new PVector(pos.x, pos.y, pos.z+i));
    if(i == h - 1){
      
    }
  }



  return blocks;
}
