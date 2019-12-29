Button b;

void setup(){
  background(51);
  size(800,800);
  b = new Button(new PVector(width/2, height/2), 60); 
}

int eFrame = 0;
void mousePressed() {
  if (b.col == #ff0000 && b.isIn(mouseX,mouseY)) {
    b.col = #ff5555;
    eFrame = 0;
    b.fire();
  }
}

void draw(){
  background(51);
  b.show();
  eFrame++;
  if(eFrame == 10){
    b.col = #ff0000; 
  }
  
}
