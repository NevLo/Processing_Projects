class Button extends GUIObj {

  private String text;
  private Runnable r;
  private Runnable h;

  public Button(float x, float y, float w, float h, String text) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    this.text = text;
    isVisible = true;
    GUIListener.get().register(this);
    objColor = color(255);
    r = new Runnable() {
      @Override
        public void run() {
        println("[WARN] Button-" + text + " not initialized with click executable!");
      }
    };
    this.h = new Runnable() {
      @Override
        public void run() {
        println("[WARN] Button-" + text + " not initialized with hover executable!");
      }
    };
  }
  /**
   * This function draws the button to the canvas.
   */
  void display() {
    if (!isVisible) return;
    fill(objColor);
    rect(pos.x, pos.y, dim.x, dim.y);
    fill(0);
    textAlign(CENTER);
    text(text, pos.x+dim.x/2, pos.y+textAscent());
  }
  /**
   * setOnClick
   * <p>
   * the correct usage of this should be:
   * button.setOnClick(new Runnable() {
   *   @Override
   *   public void run() {
   *     println("Hello, World!");
   *   }
   * });
   * OR
   * Runnable run = new Runnable(){
   *   @Override
   *   public void run(){
   *     println("Hello, World!");
   *  }
   * });
   *
   * button.setOnClick(run);
   *
   * @param run : Instance of a runnable piece of code that the button will activate.
   *
   */
  void setOnClick(Runnable run) {
    this.r = run;
  }
  void setOnHover(Runnable hov) {
    this.h = hov; 
  }
  
  /**
   * Sets the background color of the button to be the specified color
   * @param col : A color.
   */
  void setButtonColor(color col) {
    this.objColor = col;
  }
  /**
   * Runs the saved runnable
   * @return void
   */
  void execute() {
    r.run();
  }
  void executeHover() {
    h.run();
  }

  String getText() {
    return text;
  }
}
