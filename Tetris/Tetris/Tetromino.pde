class Tetromino {
  boolean[] piece;
  int posX;
  int posY;
  int vertLen;
  int horzLen;
  color col;
  boolean updateable;

  Tetromino(int x, int y) {
    piece = randomPiece();
    posX = size + x * squaresize;
    posY = y * squaresize;
    updateable = true;
  }
  void show() {
    strokeWeight(2);
    stroke(0);
    fill(col); 
    for (int i = 0; i < 16; i++) {
      if (piece[i]) {
        rect(posX + (i%4) * squaresize, posY + (i / 4) * squaresize, squaresize, squaresize);
      }
    }
  }
  
  void update() {
    if (!updateable) return;
    else {
      if(posY + (vertLen * squaresize) >= height) updateable = false;
      else posY += squaresize;
    }
  }
  
  void moveLeft(){
    if(posX != size && updateable) posX -= squaresize; 
  }
  void moveRight(){
    if(posX != size * 3 - horzLen * squaresize && updateable) posX += squaresize;
  }
  boolean checkCollision(Tetromino t){
    boolean collide = false;
      
    
    return collide;
  }
  
  
  boolean isUpdateable(){
    return updateable; 
  }

  boolean[] randomPiece() {
    boolean[] arr = new boolean[16];
    for (boolean a : arr) {
      a = false;
    }
    int piece = floor(random(0,7));
    //int piece = 4;
    switch(piece) {
    case 0:                // 4 long piece
      arr[0] = true;
      arr[4] = true;
      arr[8] = true;
      arr[12] = true;
      col = color(0,0,255);
      vertLen = 4;
      horzLen = 1;
      break;
    case 1:                // T piece
      arr[0] = true;
      arr[1] = true;
      arr[2] = true;
      arr[5] = true;
      vertLen = 2;
      horzLen = 3;
      col = color(255,165,51);
      break;
    case 2:                // 2x2 Square
      arr[0] = true;
      arr[1] = true;
      arr[4] = true;
      arr[5] = true;
      vertLen = 2;
      horzLen = 2;
      col = color(255, 255, 0);
      break;
    case 3:                // L piece
      arr[0] = true;
      arr[4] = true;
      arr[8] = true;
      arr[9] = true;
      vertLen = 3;
      horzLen = 2;
      col = color(0,0,255);
      break;
    case 4:                // J piece
      arr[1] = true;
      arr[5] = true;
      arr[8] = true;
      arr[9] = true;
      vertLen = 3;
      horzLen = 2;
      col = color(255,0,255);
      break;
    case 5:                // S piece
      arr[0] = true;
      arr[4] = true;
      arr[5] = true;
      arr[9] = true;
      vertLen = 3;
      horzLen = 2;
      col = color(51);
      break;
    case 6:                // Z piece
      arr[1] = true;
      arr[4] = true;
      arr[5] = true;
      arr[8] = true;
      horzLen = 2;
      vertLen = 3;
      col = color(255,0,0);
      break;
    }
    return arr;
  }
}
