class Button{
 public int x, y, w, h;
 public int borderWidth;
 public String Text;
 Button(int x, int y, int w, int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   borderWidth = 2;
 }
 Button(int x, int y, int w, int h, String Text){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.Text = Text;
   borderWidth = 2;
 }
 void draw(){
    int temp = 2;
    fill(255);
    strokeWeight(borderWidth);
    rect(x,y,w,h); 
    strokeWeight(temp);
    fill(0);
    text(Text, x+w/2, y+h/2);
 }
  
 boolean isFocused(){
 return mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h;  
 }
 
 void setBorderWidth(int b){
   borderWidth = b; 
 }
 void setText(String text){
  Text = text; 
 }

}
