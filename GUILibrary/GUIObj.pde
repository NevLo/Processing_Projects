public enum WidthMode {
  STANDARD, FIXED
};
public enum TextMode {
  CENTERED, RIGHTA, LEFTA
}


public abstract class GUIObj {
  protected PVector pos;
  protected PVector dim;
  protected color objColor;
  protected color strokeColor;
  protected int strokeWeight;
  protected boolean isVisible;
  protected boolean isHovered;


  public float getPosX() {
    return pos.x;
  }
  public float getPosY() {
    return pos.y;
  }
  public float getDimX() {
    return dim.x;
  }
  public float getDimY() {
    return dim.y;
  }

  public PVector getPos() {
    return pos;
  }
  public PVector getDim() {
    return dim;
  }
  /**
   * Returns whether a point is within the bounding box of the object
   * This function only works with Tasks, Buttons, Radio Buttons, Checkboxes.
   * This will not work with Sliders,
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
  public color getColor() {
    return objColor;
  }
  public abstract void execute();

  public void setVisibility(boolean v) {
    isVisible = v;
  }
  public void setHoverStatus(boolean h) {
    isHovered = h; 
  }
}
