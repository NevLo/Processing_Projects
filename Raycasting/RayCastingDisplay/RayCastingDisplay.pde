ArrayList<Wall> walls;
particle pt;
public ArrayList<Float> dists;
public ArrayList<Integer> colors;
float miniMapSize = 200;
//////////////////////////////////////////////////////////////////////////////////
//  Method:      setup()                                                        //
//  Description: setup function                                                 //
//////////////////////////////////////////////////////////////////////////////////
void setup(){
  size(1800,900);                                                              
  walls = new ArrayList<Wall>();                                                
  dists = new ArrayList<Float>();                                               
  colors = new ArrayList<Integer>();
  walls.add(new Wall(0,0,0,height));                                           
  walls.add(new Wall(width,0,width,height));                               
  walls.add(new Wall(0,0,width,0));                                           
  walls.add(new Wall(0,height,width,height));                                
  for(int i = 0; i < 5; i++){                                                   
    float x1 = random(width);                                                 
    float x2 = random(width);                                                 
    float y1 = random(height);                                                  
    float y2 = random(height);                                                  
    walls.add(new Wall(x1,y1,x2,y2));                                           
  }
  pt = new particle();
} // End method
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw()                                                         //
//  Description: draw loop                                                      //
//////////////////////////////////////////////////////////////////////////////////
void draw(){
  background(51);                                                                                                                    
  pt.look(walls);                                                              
  //pt.show();     
  draw3d();
  drawMinimap();
  dists.clear();                                                               
  colors.clear();
}
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
  if(key == 'w'){
    pt.moveForward();
  }
  if(key == 's'){
   pt.moveBackwards(); 
    
  }
}
//////////////////////////////////////////////////////////////////////////////////
//  Method:      draw3d()                                                       //
//  Description: subroutine for drawing the 3d representation                   //
//////////////////////////////////////////////////////////////////////////////////
void draw3d(){
  if(dists.size() ==  0) {return;}
  float drawWidth = ((width)/ pt.rays.size())+.75;
  pushMatrix();
  for(int i = 0; i < dists.size(); i++){
    float sq = dists.get(i) * dists.get(i);
    float max = sqrt(sq(width)+sq(height));
    float wSq = (width * width);
    //float b = map(sq, 0, wSq, 255, 0);
    float h = map(dists.get(i), 0, max, height, 0);
    noStroke();
    //fill(b);
    fill(colors.get(i));
    stroke(colors.get(i));
    rectMode(CENTER);
    rect((i * (drawWidth)) + drawWidth/2, height/2, drawWidth, (h/dists.get(i))*150);
  }
  popMatrix();
}


void drawMinimap(){
  color g = color(51);  
  color border = color(250);
  strokeWeight(4);
  stroke(border);
  fill(0);
  rectMode(CORNER);
  rect(0,0,miniMapSize,miniMapSize);
  strokeWeight(1);
  for(Wall w : walls){
    float x1 = w.a.x * miniMapSize / width; 
    float x2 = w.b.x * miniMapSize / width;
    float y1 = w.a.y * miniMapSize / height; 
    float y2 = w.b.y * miniMapSize / height;
    stroke(255);
    fill(w.col);
    line(x1,y1,x2,y2);
  }
  strokeWeight(4);
  stroke(255);
  point(pt.pos.x * miniMapSize / width, pt.pos.y * miniMapSize / height);
  strokeWeight(1);
}
