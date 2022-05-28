
Button b;
Button b2;
Button b3;

color back;
void setup() {
  size(400, 400);
  b = new Button(160, 190, 80, 20, "Hello!");
  b.setOnClick(new Runnable() {
    @Override
      public void run() {
      println("hello!");
    }
  }
  );
  b2 = new Button(160,225,80,20, "Hello 2!");
  b2.setOnClick(new Runnable() {
    @Override
      public void run() {
      println("hello world!!!");
    }
  }
  );
  b3 = new Button(160,260,80,20, "change color!");
  b3.setOnClick(new Runnable() {
    @Override
      public void run() {
      if(back == color(100,100,100)){
        back = color(0,0,0);
      }
      else back = color(100,100,100);
    }
  }
  );
}

void mousePressed(){
  //print("inMousePressed");
  ButtonListener.get().check(mouseX, mouseY);
}


void draw() {
  background(back);
  b.display();
  b2.display();
  b3.display();
}
