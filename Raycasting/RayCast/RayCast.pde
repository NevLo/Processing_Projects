
ArrayList<wall> walls;
particle pt;

void setup(){
  size(1000,1000); 
  walls = new ArrayList<wall>();
  walls.add(new wall(0,0,0,height));
  walls.add(new wall(width,0,width,height));
  walls.add(new wall(0,0,width,0));
  walls.add(new wall(0,height,width,height));
  for(int i = 0; i < 5; i++){
   float x1 = random(width); 
   float x2 = random(width);
   float y1 = random(height);
   float y2 = random(height);
   walls.add(new wall(x1,y1,x2,y2)); 
  }
  pt = new particle();
  
  
}

void draw(){
  background(0);
 for(int i = 0; i < walls.size(); i++){
   walls.get(i).show();
 }
 pt.update(mouseX,mouseY);
 pt.show();
 pt.look(walls);
}
