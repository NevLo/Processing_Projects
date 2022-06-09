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
        for (Button b : temp.getButtons()) {
          if (b.isWithin(x, y) && b.isVisible) {
            b.setHoverStatus(true);
            b.executeHover();
          } else {
            if (b.isHovered) {
              b.setHoverStatus(false);
              b.setButtonColor(255);
            }
          }
        }
      } else if (g instanceof Button) {
        Button temp = (Button)g;
        if (temp.isWithin(x, y) && temp.isVisible) {
          temp.setHoverStatus(true);
          temp.executeHover();
        } else {
          if (temp.isHovered) {
            temp.setHoverStatus(false);
            temp.setButtonColor(255);
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
