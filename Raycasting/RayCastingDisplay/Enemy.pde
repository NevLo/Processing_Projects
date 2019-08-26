class Enemy{
  PVector pos;
  color col;
  Enemy(float x, float y){
    pos = new PVector(x,y);
    col = color(55,55,random(255)); 
  }
  
  void show(){
    stroke(255,0,0);
    line(pos.x-10, pos.y+10, pos.x+10,pos.y-10);
    line(pos.x+10, pos.y+10, pos.x-10,pos.y-10);
  }
}
