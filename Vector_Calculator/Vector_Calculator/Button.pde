class Button{
    float x, y, w, h;
    String text;
    int value;
    
    
    
    Button(float x, float y, float w, float h, String text, int value){
    this.x = x;
    this.y =y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.value = value;
    
    
    
    }
    void show(){
     rect(x, y, w, h); 
     textSize(32);
     fill(0);
     if(!text.equals("New")){
     text(text, x+w/3, y+2*w/3);
     }else{
       textSize(20);
      text(text,  x+w/9, y+2*w/3); 
       
     }
     fill(255);
    }
    int getValue(){
      return value;
    }
    float[] getArea(){
      float[] area = {x, y, w, h};
      return area;
    }
}
