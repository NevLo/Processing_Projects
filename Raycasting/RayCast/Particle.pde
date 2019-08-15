class particle{
 PVector pos; 
 ArrayList<ray> rays;
 
 particle(){
  pos = new PVector(mouseX, mouseY);
  rays = new ArrayList<ray>();
  for(int i = 0; i < 720; i+=1.5){
   rays.add(new ray(pos,radians(i))); 
  }
 }
 
 void show(){
  stroke(255);
  point(pos.x,pos.y);
  for(ray r : rays){
   r.show(); 
  }
  
  
 }
 void update(float x,float y){
   pos.set(x,y);
 }
void look(ArrayList<wall> walls) {
    for (int i = 0; i < this.rays.size(); i++) {
      ray ray = rays.get(i);
      PVector closest = null;
      float record = 500000000;
      for (wall wall : walls) {
        PVector pt = ray.cast(wall);
        if (pt != null) {
          float d = PVector.dist(this.pos, pt);
          if (d < record) {
            record = d;
            closest = pt;
          }
        }
      }
      if (closest != null) {
        // colorMode(HSB);
        // stroke((i + frameCount * 2) % 360, 255, 255, 50);
        stroke(255, 100);
        line(this.pos.x, this.pos.y, closest.x, closest.y);
      }
    }
  }

}
