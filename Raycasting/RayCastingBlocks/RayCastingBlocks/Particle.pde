class particle{
  PVector pos; 
  ArrayList<ray> rays; 
//////////////////////////////////////////////////////////////////////////////////
//  Method:      particle()                                                     //
//  Description: Constructor for particle object                                //
//////////////////////////////////////////////////////////////////////////////////
  particle(){
    pos = new PVector(mouseX, mouseY);                                          // Sets the position of the particle to be the current mouse x and mouse y
    rays = new ArrayList<ray>();                                                // Creates the arraylist of rays
    for(float i = -30; i < 30; i+=.25){                                         // For loop to create a new ray every radian 
      rays.add(new ray(pos,radians(i)));                                        // Create a new ray
    } // End for
  } // End Method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void show()                                                    //
//  Description: Shows the particle and all the rays                            //
//////////////////////////////////////////////////////////////////////////////////
  void show(){
    stroke(255);                                                                // Sets the stroke color to be white
    point(pos.x,pos.y);                                                         // draws a point at the particle position
  } // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void update(float, float)                                      //
//  Description: updates the location of the particle                           //
//////////////////////////////////////////////////////////////////////////////////
  void update(float x,float y){
    pos.set(x,y);                                                               // Set the position of the particle
  } // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void look(ArrayList<wall>)                                     //
//  Description: looks at the direction of all the rays and the closest         //
//               wall to them.                                                  //
//////////////////////////////////////////////////////////////////////////////////
  void look(ArrayList<wall> walls) {
    for (int i = 0; i < this.rays.size(); i++) {                                // For loop over all the rays
      ray r = rays.get(i);                                                      // Get the current ray in a temperary object
      PVector closest = null;                                                   // PVector for pt on the closest wall to particle
      float record = 500000000;                                                 // Set the record to be a super large number so
      color col = color(255,255,255);
      for (wall w : walls) {                                                    // Loop through all the walls in the wall array
        PVector pt = r.cast(w);                                                 // Get the point of where the ray hits the current wall
        if (pt != null) {                                                       // make sure the pt exists
          float d = PVector.dist(this.pos, pt);                                 // get the distance from the point to particle
          if (d < record) {                                                     // sees if the distance is less than the record
            record = d;                                                         // sets a new record
            closest = pt;                                                       // sets the closest pt to the current point
            col = w.col;
          } // End if                                  
        } // End if
      } // End for
      if (closest != null && pos.x < width/2) {                                 // As long as a closest pt exists and the position isnt outside the bounds.
        stroke(255, 50);                                                        // set the color to white with aplha
        line(this.pos.x, this.pos.y, closest.x, closest.y);                     // draws a line from the particle to the closest pt
        float heading = rays.get(rays.size()/2 -1).dir.heading();
        float a = r.dir.heading() - heading;
        dists.add(record * cos(a));
        //dists.add(record);
        colors.add(col);
      } // End if
    } // End for
  } // End method
} // End class
