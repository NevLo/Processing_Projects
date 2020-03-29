class box{
 PVector pos;
 PVector vel;
 int len,wid;
 color col;
 int speed = 1;
 
 box(int len, int wid){
   this.len = len;
   this.wid = wid;
   pos = new PVector(random(0, width - wid), random(0, height - len));
   print(len + "   " + wid + "  " + pos.x + "  "+ pos.y);
   col = color(255,0,0);
   vel = new PVector(round(random(0,2)) == 0 ? -speed : speed, round(random(0,2)) == 0 ? -speed : speed); 
   
 }
  
 void show(){
   fill(col);
   rect(pos.x,pos.y,wid,len);
 }
 void update(){
   pos.add(vel);
   if(pos.x < 0 || pos.x + wid > width) {
     vel.x *= -1;
     col = colors[floor(random(0,colors.length))];
   }
   if(pos.y < 0 || pos.y + len > height) {
     vel.y *= -1;
     col = colors[floor(random(0,colors.length))];
   }
 }
  
  
}
