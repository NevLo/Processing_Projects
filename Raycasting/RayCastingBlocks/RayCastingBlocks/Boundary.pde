class wall{
  PVector a,b;
  color col;
//////////////////////////////////////////////////////////////////////////////////
//  Method:      wall(float, float, float, float)                               //
//  Description: Constructor for wall object                                    //
//////////////////////////////////////////////////////////////////////////////////
  wall(float x1, float y1, float x2, float y2){
    a = new PVector(x1,y1);                                                     // Set position of corner 1
    b = new PVector(x2,y2);                                                     // Set position of corner 2
    col = color(random(256), random(256),random(256));
  } // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      void show()                                                    //
//  Description: Shows the wall                                                 //
//////////////////////////////////////////////////////////////////////////////////
  void show(){
    stroke(col);                                                                // Set color to white
    strokeWeight(2);                                                            // Set StrokeWeight to 2
    line(a.x,a.y,b.x,b.y);                                                      // draw a line from pt a to pt b
  } // End method
} // End class
