//ArrayList<wall> walls;
Player p;

Canvas g;
public ArrayList<Float> dists;
public ArrayList<Integer> colors;
//////////////////////////////////////////////////////////////////////////////////
//  Method:      setup()                                                        //
//  Description: setup function                                                 //
//////////////////////////////////////////////////////////////////////////////////
void setup(){
  //frameRate(1);
  size(1800,900);                                                             
  p = new Player();
  g = new Canvas(0,0,width/2,height);
  g.setCanvasSize(10);
} // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw()                                                         //
//  Description: draw loop                                                      //
//////////////////////////////////////////////////////////////////////////////////
void draw(){
  background(51);                                                                // Sets the background to black (overrights everything drawn in the last frame)
  //rectMode(CORNER);
  //fill(42, 82, 190);
  //rect(width/2,0,width,height/2);
  //fill(255,69,0);
  //rect(width/2,height/2,width,height);
  p.update(mouseX,mouseY);
  g.show();
  //p.look(walls);                                                              // looks at all the walls
  p.show();                                                                     // shows particles
  draw3d();                                                                     // Draws 3D representation
  //for(int i = 0; i < walls.size(); i++){                                        // for loop that iterates over the arraylist of walls
  //  walls.get(i).show();                                                        // shows the walls
  //} // End for
  //dists.clear();                                                                // Clears the distance arraylist
  //colors.clear();
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
    for(int i = 0; i < p.rays.size(); i++){
      p.rays.get(i).dir.rotate(radians(1));
      //pt.rays.get(i).dir.set
      
    }
  }
  if(key == 'a'){
    for(int i = 0; i < p.rays.size(); i++){
      p.rays.get(i).dir.rotate(radians(-1));
      //pt.rays.get(i).dir.set
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw3d()                                                       //
//  Description: subroutine for drawing the 3d representation                   //
//////////////////////////////////////////////////////////////////////////////////
void draw3d(){
  //if(dists.size() ==  0) {return;}
  //float drawWidth = (width/2)/ dists.size()+.75;
  pushMatrix();
  translate(width/2, 0);
  //for(int i = 0; i < dists.size(); i++){
    //float sq = dists.get(i) * dists.get(i);
    //float max = sqrt(sq(width/2)+sq(height));
    //float wSq = (width/2 * width/2);
    //float b = map(sq, 0, wSq, 255, 0);
    //float h = map(dists.get(i), 0, max, height, 0);
    //noStroke();
    //fill(b);
    //fill(colors.get(i));
    //rectMode(CENTER);
    //stroke(colors.get(i));
    //rect((i * (drawWidth))+drawWidth, height/2, drawWidth, (h/dists.get(i))*150);
  //}
  popMatrix();
}
