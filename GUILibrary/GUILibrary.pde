

Taskbar t;
Button b;
int framesHovered = 0;
color back = 0;
void setup() {
  size(400, 400);
  t = new Taskbar(0, 0, width, 20, new String[]{"File", "Edit", "Sketch", "Tools", "Help"});
  b = new Button(200, 200, 50, 30, "heyo");
  b.setOnClick(new Runnable() {
    @Override
      public void run() {
      print("heyo!");
    }
  }
  );
  b.setOnHover(new Runnable() {
    @Override
      public void run() {
      framesHovered += 1;
      //print(framesHovered);
    }
  }
  );
}

void mousePressed() {
  //print("inMousePressed");
  GUIListener.get().check(mouseX, mouseY);
}


void draw() {
  background(back);
  GUIListener.get().checkHover(mouseX, mouseY);
  //fill(255);
  //rect(200,200,10,10);
  t.display();
  b.display();
  fill(255);
  text(framesHovered, 200, 300);
  //println(frameRate);
}
