class Tile{
  color col;
  int x, y;
  float sizeH, sizeV;
  boolean isWall;
  
  
  Tile(int x, int y, float h, float v,boolean w){
    this.x = x;
    this.y = y;
    sizeH = h;
    sizeV = v;
    isWall = w;
  }
  
  void show(){
    if(isWall){ 
      fill(250);
      stroke(250);
    }else{
      fill(50);
      stroke(50);
    }
    rect(x*sizeH, y*sizeV, sizeH,sizeV); 
  }
  
  
  
  
  
} // End class
