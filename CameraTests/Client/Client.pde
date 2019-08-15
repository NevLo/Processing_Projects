float aorY = 0;
float angle = 0;
void setup(){
  size(500,500, P3D);  
}
void keyPressed(){
  
    if(keyPressed && (key == 'a' || key == 'A')) {
      aorY = -.05; 
    }
    else if(keyPressed && (key == 'd' || key == 'D')){
      aorY = .05;  
    }else { aorY = 0; }
  
  
}
  



void draw(){
 
 translate(width/2,height/2);
 if(keyPressed){
 angle += aorY;
 
 }
 rotateY(angle);
 background(51); 
 fill(255);
 //box(50,50,50);
 stroke(255,0,0);
 strokeWeight(2);
 line(0,0,0,250,0,0);
 stroke(0,255,0);
 line(0,0,0,0,-250,0);
 stroke(0,0,255);
 line(0,0,0,0,0,250);

}
