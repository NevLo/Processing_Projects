class ray{
  PVector pos, dir;
//////////////////////////////////////////////////////////////////////////////////
//  Method:      particle(PVector, float)                                       //
//  Description: Constructor for particle object                                //
//////////////////////////////////////////////////////////////////////////////////
  ray(PVector pos_, float rad){
    pos = pos_;                                                                 // Sets the position of the ray
    dir = PVector.fromAngle(rad);                                               // Sets the direction it is pointing
  } // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      particle()                                                     //
//  Description: Constructor for particle object                                //
//////////////////////////////////////////////////////////////////////////////////
  PVector cast(wall wall) {
    float x1 = wall.a.x;                                                        // sets the x position of wall end a to a temperary variable
    float y1 = wall.a.y;                                                        // sets the y position of wall end a to a temperary variable
    float x2 = wall.b.x;                                                        // sets the x position of wall end b to a temperary variable
    float y2 = wall.b.y;                                                        // sets the y position of wall end b to a temperary variable

    float x3 = this.pos.x;                                                      // sets the x position of the ray to a temp variable
    float y3 = this.pos.y;                                                      // sets the y position of the ray to a temp variable
    float x4 = this.pos.x + this.dir.x;                                         // sets the x position of the end of the ray to a temp variable
    float y4 = this.pos.y + this.dir.y;                                         // sets the y position of the end of the ray to a temp variable

    float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);                  // finds the denominator of a casting algorithm
    if (den == 0) {                                                             // if the denominator is 0
      return null;                                                              // return null, this makes it so that we dont have any divide by zero errors
    } // End if

    float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;            // find the t value
    float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;           // find the u value
    if (t > 0 && t < 1 && u > 0) {                                              // if 0 < t < 1 and 0 < u
      PVector pt = new PVector();                                               // make a new pt
      pt.x = x1 + t * (x2 - x1);                                                // set x value of new pt
      pt.y = y1 + t * (y2 - y1);                                                // set y value of new pt
      return pt;                                                                // return pt
    } else {                                                                    // else
      return null;                                                              // return nothing
    } // End if else
  } // End method
} // End class
