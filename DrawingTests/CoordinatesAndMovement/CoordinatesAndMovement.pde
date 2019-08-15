void setup(){
  size(600,600, P3D);
}

void draw(){
  
  translate(300,300);
  rotateX(PI/6);
  rotateZ(-PI/6);
  stroke(0,0,255);
  line(0,0,0,0,0,255);
  stroke(255,0,0);
  line(0,0,0,255,0,0);
  stroke(0,255,0);
  line(0,0,0,0,255,0);
}
