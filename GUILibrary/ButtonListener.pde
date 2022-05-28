static class ButtonListener {
  private static ButtonListener bl = null;

  static ArrayList<Button> bts;
  private ButtonListener() {
    bts = new ArrayList<Button>();
    bl = this;
  }

  void register(Button b) {
    bts.add(b);
  }
  void check(int x, int y) {
    //print("inCheck");
    for(Button b : bts){
     if(b.isWithin(x,y)){
       b.execute();
       return;
     }
    }
  }

   static ButtonListener get() {
    if (bl == null) return new ButtonListener();
    else return bl;
  }
}
