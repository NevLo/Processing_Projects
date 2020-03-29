box b;
color[] colors = {color(255,255,255), color(255,165,0  ), color(255,255,0  ),   //white, orange, yellow
                  color(255,0  ,0  ), color(0  ,255,0  ), color(0  ,0  ,255),   //red  , blue  , green
                  color(51 ,51 ,51 ), color(210,105,30 ), color(255,0  ,255)};  //grey , brown , purple

void setup(){
  fullScreen();
  //size(800,600);
  b = new box(150,200);
}

void draw(){
  background(0);
  b.show();
  b.update();
}
