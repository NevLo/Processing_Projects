class Block{
  ArrayList<wall> walls; 
  
  
  Block(PVector _pos,float _size){ 
    float posX = _pos.x;
    float posY = _pos.y;
    walls = new ArrayList<wall>();
    walls.add(new wall(posX,posY,posX,posY+_size));
    walls.add(new wall(posX,posY,posX+_size,posY));
    walls.add(new wall(posX,posY+_size,posX+_size,posY+_size));
    walls.add(new wall(posX+_size,posY,posX+_size,posY+_size));
  }
  
  
  void show(){
    for(wall w: walls){
      w.show();
    }
  }
}
