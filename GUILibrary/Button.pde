class Button {
  PVector pos;
  PVector dim;
  String text;
  boolean isVisible;
  Runnable r;
  Button(float x, float y, float w, float h, String text) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    this.text = text;
    isVisible = true;
    ButtonListener.get().register(this);
  }

  void display() {
    if(!isVisible)return;
    fill(255);
    rect(pos.x, pos.y, dim.x, dim.y);
    fill(0);
    textAlign(CENTER);
    text(text, pos.x+dim.x/2, pos.y+textAscent());
  }
  void setOnClick(Runnable r) {
    this.r = r;
  }
  void execute() {
    r.run();
  }
  boolean isWithin(float x, float y) {
    return (x > pos.x
      && x < pos.x + dim.x
      && y > pos.y
      && y < pos.y + dim.y);
  }
}
