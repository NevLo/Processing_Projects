ArrayList<wall> walls;
particle pt;
public ArrayList<Float> dists;
public ArrayList<Integer> colors;
//////////////////////////////////////////////////////////////////////////////////
//  Method:      setup()                                                        //
//  Description: setup function                                                 //
//////////////////////////////////////////////////////////////////////////////////
void setup(){
  //frameRate(1);
  size(1800,900);                                                               // Set the size of the window
  walls = new ArrayList<wall>();                                                // Initialize arraylist of walls
  dists = new ArrayList<Float>();                                               // Initialize arraylist of floats
  colors = new ArrayList<Integer>();
  walls.add(new wall(0,0,0,height));                                            // Add Left edge to walls
  walls.add(new wall(width/2,0,width/2,height));                                // Add right edge to walls
  walls.add(new wall(0,0,width/2,0));                                           // Add top edge to walls
  walls.add(new wall(0,height,width/2,height));                                 // Add bottom edge to walls
  for(int i = 0; i < 5; i++){                                                   // for loop that runs 5 times
    float x1 = random(width/2);                                                 // create random x value
    float x2 = random(width/2);                                                 // create random x value
    float y1 = random(height);                                                  // create random y value
    float y2 = random(height);                                                  // create random y value
    walls.add(new wall(x1,y1,x2,y2));                                           // add a new random wall to walls
  } // End for
  pt = new particle();                                                          // create a new particle
} // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw()                                                         //
//  Description: draw loop                                                      //
//////////////////////////////////////////////////////////////////////////////////
void draw(){
  background(0);                                                                // Sets the background to black (overrights everything drawn in the last frame)

  pt.update(mouseX,mouseY);                                                     // updates particle position
  pt.look(walls);                                                               // looks at all the walls
  pt.show();                                                                    // shows particles
  draw3d();                                                                     // Draws 3D representation
  for(int i = 0; i < walls.size(); i++){                                        // for loop that iterates over the arraylist of walls
    walls.get(i).show();                                                        // shows the walls
  } // End for
  dists.clear();                                                                // Clears the distance arraylist
  colors.clear();
} // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      keyPressed()                                                   //
//  Description: detects different keys being pressed                           //
//////////////////////////////////////////////////////////////////////////////////
void keyPressed(){
  if(key == ' '){
    setup(); 
  }
  if(key == 'd'){
    for(int i = 0; i < pt.rays.size(); i++){
      pt.rays.get(i).dir.rotate(radians(5));
      //pt.rays.get(i).dir.set
      
    }
  }
  if(key == 'a'){
    for(int i = 0; i < pt.rays.size(); i++){
      pt.rays.get(i).dir.rotate(radians(-5));
      //pt.rays.get(i).dir.set
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw3d()                                                       //
//  Description: subroutine for drawing the 3d representation                   //
//////////////////////////////////////////////////////////////////////////////////
void draw3d(){
  if(dists.size() ==  0) {return;}
  float drawWidth = (width/2)/ pt.rays.size();
  pushMatrix();
  translate(width/2, 0);
  for(int i = 0; i < dists.size(); i++){
    float sq = dists.get(i) * dists.get(i);
    float max = sqrt(sq(width/2)+sq(height));
    float wSq = (width/2 * width/2);
    float b = map(sq, 0, wSq, 255, 0);
    float h = map(dists.get(i), 0, max, height, 0);
    noStroke();
    //fill(b);
    fill(colors.get(i));
    rectMode(CENTER);
    rect((i * (drawWidth + 1)) + drawWidth/2, height/2, drawWidth + 2, (h/dists.get(i))*200);
  }
  popMatrix();
}
