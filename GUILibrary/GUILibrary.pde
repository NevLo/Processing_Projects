Taskbar t;
Button b;
color back;
void setup() {
  size(400, 400);
  t = new Taskbar(0,0,width,20,new String[]{"File","Edit","Sketch","Tools","Help"});
  b = new Button(width/2, height/2, 100, 20, "test");
  b.setButtonColor(color(255,0,0));
  b.setOnClick(new Runnable(){
    @Override
    public void run(){
     b.setButtonColor(color(random(0,255),random(0,255),random(0,255)));
    }
  });
}

void mousePressed() {
  //print("inMousePressed");
  ButtonListener.get().check(mouseX, mouseY);
}


void draw() {
  background(back);
  t.display();
  b.display();
}
