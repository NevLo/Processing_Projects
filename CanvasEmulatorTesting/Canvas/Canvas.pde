color[][] canvas;
int marginH = 30, marginV = 30;
int canvasW = 256, canvasH = 240;
void setup(){
 size(500,280); 
 canvas = new color[canvasH][canvasW];
 for(int x = 0; x < canvas.length; x++){
   for(int y = 0; y < canvas[x].length; y++){
     canvas[x][y] = color(x,y,50);  
   }
 }
}

void draw(){
  loadPixels();
  for (int i = 0, k = marginH + (width * marginV) ; i < canvas.length; i++) {
    for(int j = 0; j < canvas[i].length; j++, k++){
      pixels[k] = canvas[i][j];
    }
    k += width - canvas[i].length;
  }
  updatePixels();
  line(marginH, marginV, marginH, marginV + canvasH);
  line(marginH, marginV, marginH + canvasW, marginV);
  line(marginH + canvasW, marginV, marginH + canvasW, marginV + canvasH);
  line(marginH, marginV + canvasH, marginH + canvasW, marginV + canvasH);

}
