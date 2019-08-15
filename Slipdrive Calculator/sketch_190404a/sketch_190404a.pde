
ArrayList<Button> Buttons;

void setup(){
 size(1000,1000); 
 Buttons = new ArrayList<Button>();
 Buttons.add(new Button(100,100,100,100,"Hi"));
 Buttons.add(new Button(100,200,100,100,"Hi"));
 Buttons.add(new Button(200,100,100,100,"Hi"));
 Buttons.add(new Button(200,200,100,100,"Hi"));
 
 
 
 Buttons.get(0).setText("Hi");
}
void mousePressed(){
  for(Button b: Buttons){
    if(b.isFocused()){
      b.setBorderWidth(2);
    }else{
     b.setBorderWidth(1); 
     
    }
  }
}
void draw(){
 background(51);
 for(Button b: Buttons){
  b.draw(); 
   
 }
}
