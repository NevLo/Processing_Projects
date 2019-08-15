
int rows, cols;
int scl = 20;
int w = 600;
int h = 600;
float[][] z;
float angle;
boolean leftPressed = false, rightPressed = false;
void setup() {
  size(1200, 1200, P3D);
  cols = w / scl;
  rows = h / scl;
  cols = 4;
  rows = 4;
  z = new float[cols][rows];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {

      z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 10);
      //if (x < 5 && y < 5) {
      //  z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 250);
      //} else if (x < 10 && y < 10) {
      //   z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 200);
      //} else if (x < 15 && y < 15) {
      //   z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 150);
      //}  else {
      //  z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 100);
      //}


      xoff += 0.1;
    }
    yoff += 0.1;
  }
}
void keyPressed() {
  if (keyCode == RIGHT) {
    leftPressed = false;
    rightPressed = true;
    return;
  }
  if (keyCode == LEFT) {
    rightPressed = false;
    leftPressed = true;
    return;
  }
  leftPressed = false;
  rightPressed = false;
}
int yh = -h/2;
void draw() {
  if (keyPressed && leftPressed) {
    angle += .005;
  }
  if (keyPressed && rightPressed) {
    angle -=.005;
  }
  if (keyPressed && keyCode == UP) {
    yh += 5;
    translate(-w/2, yh);
  }
  background(1);
  stroke(255);
  fill(0);
  translate(width/2, height/2);
  rotateX(PI/3);
  rotateZ(angle);

  translate(-w/2, -h, -1350);




  for (int y = 0; y < rows-1; y++) {
    beginShape();
    for (int x = 0; x < cols-1; x++) {
      drawBlock(x, y);
    }
    endShape();
  }
  //angle+=.005;
  //noLoop();
}
void drawBlock(int x, int y) {

  float x1, x2, y1, y2;
  x1 = z[x][y];
  x2 = z[x+1][y];
  y1 = z[x+1][y+1];
  y2 = z[x][y+1];
  int zed = (int)((x1+x2+y1+y2)/4)*scl;
  noStroke();
  stroke(255);
  //fill(100);
  /*
  vertex((x+1)*scl, y*scl, zed);
  vertex(x*scl, y*scl, zed);
  vertex(x*scl, (y+1)*scl, zed);
  vertex((x+1)*scl, (y+1)*scl, zed);
  vertex((x+1)*scl, y*scl, zed);
  vertex((x+1)*scl,y*scl,zed-scl);
  vertex((x)*scl,y*scl,zed-scl);
  vertex((x)*scl,(y+1)*scl,zed-scl);
  vertex((x+1)*scl,(y+1)*scl,zed-scl);
  */
  //print(zed + ":" + (zed-1) + "\n");

  //print("\nX: " + x+" Y: " + y+" Z: " + zed);
  //vertex((x+1)*scl, y*scl, z[x+1][y]);
  //vertex(x*scl, y*scl, z[x][y]);
  //vertex(x*scl, (y+1)*scl, z[x][y+1]);
  //vertex((x+1)*scl, (y+1)*scl, z[x+1][y+1]);
  //vertex((x+1)*scl, y*scl, z[x+1][y]);
}
