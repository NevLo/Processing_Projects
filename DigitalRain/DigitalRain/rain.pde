class rain{
 PVector pos;
 PVector vel;
 int len;
 rain(){
    pos = new PVector(random(0,1200), -120, random(0,10)); 
    len = floor(random(4,10)) * 20;
 }
 void show(){
   stroke(0,255,0);
   //fill(0,255,0);
   rect(pos.x, pos.y, 20, len); 
 }
 void update(){
   
   if(pos.y > height + len + 1){
     pos.y = 0 - len - 1;
   }else{
     pos.y += pos.z*2;
   }
 }
  
}
