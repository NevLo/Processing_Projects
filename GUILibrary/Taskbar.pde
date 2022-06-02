class Taskbar extends GUIObj {
  private ArrayList<Button> tasks;
  private PVector pos;
  private PVector dim;


  Taskbar(float x, float y, float w, float h, String[] buttons) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    tasks = new ArrayList<Button>();
    float wid = w / buttons.length;

    for (int i = 0; i < buttons.length; i++) {
      tasks.add(new Button(x+i*wid, y, wid, h, buttons[i])
        .setOnClick(new Runnable() {
        @Override
          public void run() {
          fill(255);
          rect(x, y+h, wid, h);
        }
      }
      ));
    }
  }


  void display() {
    rect(pos.x, pos.y, dim.x, dim.y);
    for (Button b : tasks) {
      b.display();
    }
  }
}
