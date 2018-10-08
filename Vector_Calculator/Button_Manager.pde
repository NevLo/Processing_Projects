class ButtonManager {
  ArrayList<Button> nums; 
  ArrayList<Button> opers;
  VM VectorManager = new VM();
  ButtonManager() {
    nums = new ArrayList<Button>();
    opers = new ArrayList<Button>();
    float k = 3 * height /4;
    float wh = height/16;

    nums.add(new Button(0, k, wh, wh, "7", 7));
    nums.add(new Button(0, k + wh, wh, wh, "4", 4));
    nums.add(new Button(0, k + 2 * wh, wh, wh, "1", 1));
    nums.add(new Button(0 + wh, k, wh, wh, "8", 8));
    nums.add(new Button(0 + wh, k + wh, wh, wh, "5", 5));
    nums.add(new Button(0 + wh, k + 2 * wh, wh, wh, "2", 2));
    nums.add(new Button(0 + 2 * wh, k, wh, wh, "9", 9));
    nums.add(new Button(0 + 2 * wh, k + wh, wh, wh, "6", 6));
    nums.add(new Button(0 + 2 * wh, k + 2 * wh, wh, wh, "3", 3));
    nums.add(new Button(0 + wh, k + 3 * wh, wh, wh, "0", 0));
    nums.add(new Button(0 + 2 *wh, k + 3 * wh, wh, wh, ".", 10));



    opers.add(new Button(0 + 4 * wh, k, wh, wh, "+", 11));
    opers.add(new Button(0 + 4 * wh, k + wh, wh, wh, "-", 12));
    opers.add(new Button(0 + 4 * wh, k + 2 * wh, wh, wh, "New", 20));
  }

  void onButtonClicked() {
    //print(nums.size());
    
    
    for (int i = 0; i < nums.size(); i++) {
     // printArray(nums.get(i).getArea());
      if(mouseX > (nums.get(i).x) 
      && mouseX < (nums.get(i).x + nums.get(i).w)
      && mouseY > (nums.get(i).y)
      && mouseY < (nums.get(i).y + nums.get(i).h)){
      
        int num = nums.get(i).getValue();
        return;
      }  
    }
     for (int i = 0; i < opers.size(); i++) {
     // printArray(nums.get(i).getArea());
      if(mouseX > (opers.get(i).x) 
      && mouseX < (opers.get(i).x + opers.get(i).w)
      && mouseY > (opers.get(i).y)
      && mouseY < (opers.get(i).y + opers.get(i).h)){
      
        int num = opers.get(i).getValue();
        print(num);
        if(num == 20){
           VectorManager.addVec(new PVector()); 
        }
        return;
      }  
    }
    
  }


  void newVec(){
  
  }
  void show() {
    for (int i = 0; i < nums.size(); i++) {
      nums.get(i).show();
    }
    for (int i = 0; i < opers.size(); i++) {
      opers.get(i).show();
    }
    VectorManager.displayVectors();
    VectorManager.show();
  }
}
