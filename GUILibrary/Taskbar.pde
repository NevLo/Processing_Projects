/* THIS NEEDS A BIG REWRITE IN ORDER TO INCORPORATE TASKS INSTEAD OF SECONDARIES.
 *
 */

public class Taskbar extends GUIObj {
  private ArrayList<Button> tasks;
  private ArrayList<Button> secondary;
  private WidthMode wm = WidthMode.STANDARD;

  Taskbar(float x, float y, float w, float h, String[] buttons) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    tasks = new ArrayList<Button>();
    float totalWid = 0;
    float wid = 0;
    for (int i = 0; i < buttons.length; i++) {
      if (wm == WidthMode.FIXED) {
        wid = w / buttons.length;
      } else {
        wid = textWidth(buttons[i])+10;
      }

      Button b = new Button(x+totalWid, y, wid, h, buttons[i]);
      b.setOnClick(new Runnable() {
        @Override
          public void run() {
          fill(255);
          rect(b.getPos().x, b.getPosY()+b.getDimY(), b.getDimX(), b.getDimY());
        }
      }
      );
      tasks.add(b);
      totalWid += wid;
      
    }
    GUIListener.get().register(this);
    secondary = new ArrayList<Button>();
  }
  

  void display() {
    fill(255);
    rect(pos.x, pos.y, dim.x, dim.y);
    for (Button b : tasks) {
      b.display();
    }
  }
  
  ArrayList<Button> getButtons(){
   return tasks; 
  }
  void execute(){
   return; 
  }
  
  
  /*
  * probably going to delete this when tasks are added.
 
  public void addSecondaryToTaskbar(String bta, String buttonName, Runnable r) {
    for (Button b : tasks) {
      if (b.getText().equalsIgnoreCase(bta)) {
      }
    }
  }
  */
  
  /*
  * for some reason this doesnt like being static, but it shouldnt be affected. is it some processing weirdness?
  public static Taskbar createObjectFromJSON(String filePath) {
    return null;
  }
  */
}
