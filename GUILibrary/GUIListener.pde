static class GUIListener {
  private static GUIListener bl = null;

  static ArrayList<GUIObj> bts;
  private GUIListener() {
    bts = new ArrayList<GUIObj>();
    bl = this;
  }

  void register(GUIObj b) {
    bts.add(b);
  }
  void check(float x, float y) {
    //print("inCheck");
    for (GUIObj b : bts) {
      if (b.isWithin(x, y)) {
        b.execute();
        return;
      }
    }
  }
  void checkHover(float x, float y) {
    for (GUIObj g : bts) {
      if (g instanceof Taskbar) {
        Taskbar temp = (Taskbar)g;
        for(Button b : temp.getButtons()){
          if(b.isWithin(x,y)){
            print(b.getText()); 
          }
        }
      }
    }
  }


  static GUIListener get() {
    if (bl == null) return new GUIListener();
    else return bl;
  }
}
