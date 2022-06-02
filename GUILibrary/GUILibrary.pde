

Taskbar t;

color back;
void setup() {
  size(400, 400);
  t = new Taskbar(0,0,width,20,new String[]{"File","Edit","Sketch","Tools","Help"});
 
}

void mousePressed() {
  //print("inMousePressed");
  ButtonListener.get().check(mouseX, mouseY);
}


void draw() {
  background(back);
  t.display();

}
