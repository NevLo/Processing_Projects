ArrayList<rain> drops;
void setup(){
  size(1200,600);
  drops = new ArrayList<rain>();
  for(int i = 0; i < 10; i++){
    drops.add(new rain());
    
  }
}
void draw(){
  background(0);
  for(int i = 0; i < drops.size(); i++){
    drops.get(i).show();
    drops.get(i).update();
  }
  
}
