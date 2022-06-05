class Task extends GUIObj{
  private Button button;
  private ArrayList<Task> tasks;
  private boolean isPopupActive;


  Task(float x, float y, float w, float h) {
    pos = new PVector(x,y);
    dim = new PVector(w,h);
  }
  
  void execute(){
  }
}
