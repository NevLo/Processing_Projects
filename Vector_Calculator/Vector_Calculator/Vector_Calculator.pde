ButtonManager buttons;

void setup(){
  size(1000,1000);
  buttons = new ButtonManager();
  
  
}
void mouseClicked(){
 
  buttons.onButtonClicked();
  
}


void draw(){
  background(51);
  line(0,3*height/4, width , 3*height/4); 
  buttons.show();
  
  
}
