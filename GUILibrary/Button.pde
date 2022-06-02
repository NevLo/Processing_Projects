class Button extends GUIObj {
  private PVector pos;
  private PVector dim;
  private String text;
  private boolean isVisible;
  private Runnable r;
  private color col;

  public Button(float x, float y, float w, float h, String text) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    this.text = text;
    isVisible = true;
    ButtonListener.get().register(this);
    col = color(255);
    r = new Runnable() {
      @Override
        public void run() {
          println("[WARN] Button-" + text + " not initialized with executable!");
        }
    };
  }
  /**
   * This function draws the button to the canvas.
   */
  void display() {
    if (!isVisible)return;
    fill(col);
    rect(pos.x, pos.y, dim.x, dim.y);
    fill(0);
    textAlign(CENTER);
    text(text, pos.x+dim.x/2, pos.y+textAscent());
  }
  /**
   * This function is designed to set what the buttons functionality is.
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
  Button setOnClick(Runnable run) {
    this.r = run;
    return this;
  }
  /**
   * Sets the background color of the button to be the specified color
   * @param col : A color.
   */
  void setButtonColor(color col) {
    this.col = col;
  }
  /**
   * Runs the saved runnable
   * @return void
   */
  void execute() {
    r.run();
  }
  /**
   * Returns whether a point is within the bounding box of the Button
   * <p>
   * @param x : The X coordinate to be checked
   * @param y : The Y coordinate to be checked
   * @return a boolean noting wether the coordinates are withing the button.
   */
  boolean isWithin(float x, float y) {
    return (x > pos.x
      && x < pos.x + dim.x
      && y > pos.y
      && y < pos.y + dim.y);
  }
  
  
  float getPosX(){
    return pos.x;
  }
  float getPosY(){
    return pos.y; 
  }
  float getDimX(){
    return dim.x; 
  }
  float getDimY(){
    return dim.y; 
  }
  
}
