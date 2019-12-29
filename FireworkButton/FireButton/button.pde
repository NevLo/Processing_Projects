class Button{
  PVector pos; 
  int size;
  color col = #ff0000;
  firework f;
  
  Button(PVector pos, int size){
    this.pos = pos;
    this.size = size;
    f = new firework(pos.x, pos.y);
  }
  
  void show(){

    
    
    
    
    
   fill(#000000);
   ellipse((int)pos.x,(int)pos.y,size+10,size+10);
   fill(col);
   ellipse((int)pos.x,(int)pos.y,size,size);
  }
  
  void fire(){
    print("LAUNCH!!!\n");
  }
  
  
  
  
  boolean isIn(int x, int y){
    return sqrt(sq(abs(x - pos.x)) + sq(abs(y - pos.y)))<= size/2; 
  }
}
