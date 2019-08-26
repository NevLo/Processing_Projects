class particle{
  PVector pos; 
  ArrayList<ray> rays; 
//////////////////////////////////////////////////////////////////////////////////
//  Method:      particle()                                                     //
//  Description: Constructor for particle object                                //
//////////////////////////////////////////////////////////////////////////////////
  particle(){
    pos = new PVector(width/2, height/2);                                          
    rays = new ArrayList<ray>();                                               
    for(float i = -30; i < 30; i+=.25){                                        
      rays.add(new ray(pos,radians(i)));                                        
    } // End for
  } // End Method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void show()                                                    //
//  Description: Shows the particle and all the rays                            //
//////////////////////////////////////////////////////////////////////////////////
  void show(){
    stroke(255);                                                           
    point(pos.x,pos.y);                                                       
  } // End method
  
  void moveForward(){
    PVector p = PVector.fromAngle(rays.get(rays.size()/2 -1).dir.heading());
    p.setMag(5);
    pos.add(p);
  }
  void moveBackwards(){
    PVector p = PVector.fromAngle(rays.get(rays.size()/2 -1).dir.heading());
    p.setMag(-5);
    pos.add(p);
  }
  
  
  
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void update(float, float)                                      //
//  Description: updates the location of the particle                           //
//////////////////////////////////////////////////////////////////////////////////
  void update(float x,float y){
    pos.set(x,y);                                                               
  } // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void look(ArrayList<wall>)                                     //
//  Description: looks at the direction of all the rays and the closest         //
//               wall to them.                                                  //
//////////////////////////////////////////////////////////////////////////////////
  void look(ArrayList<Wall> walls) {
    for (int i = 0; i < this.rays.size(); i++) {                                
      ray r = rays.get(i);                                                     
      PVector closest = null;                                                  
      float record = 500000000;                                                
      color col = color(255,255,255);
      for (Wall w : walls) {                                                   
        PVector pt = r.cast(w);                                                 
        if (pt != null) {                                                      
          float d = PVector.dist(this.pos, pt);                                 
          if (d < record) {                                                    
            record = d;                                                        
            closest = pt;                                                       
            col = w.col;
          }                                   
        }
      }
      if (closest != null) {                                
        stroke(255, 50);                                                     
        //line(this.pos.x, this.pos.y, closest.x, closest.y);                    
        float heading = rays.get(rays.size()/2 -1).dir.heading();
        float a = r.dir.heading() - heading;
        dists.add(record * cos(a));
        //dists.add(record);
        colors.add(col);
      } 
    } 
  } 
}
