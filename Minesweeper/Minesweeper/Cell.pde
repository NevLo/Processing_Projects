public class cell {
  PVector pos;
  int i, j, w, h; 
  boolean bomb;
  boolean revealed;
  boolean flagged;
  int neighborCount;
  cell( int i, int j, int x, int y, int w, int h) {
    pos = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.i = i;
    this.j = j;
    if (random(1) < 0.2) {
      this.bomb = true;
    } else {
      this.bomb = false;
    }
    this.revealed = false;
    this.flagged = false;
  }

  void display() {
    stroke(0);
    noFill();
    rect(pos.x, pos.y, w, h); 
    if (this.revealed) {
      if (this.bomb) {
        if (this.flagged) {
          fill(255, 0, 0);
          rect(pos.x, pos.y, w, h);
        } else {
          fill(127);
          ellipse(this.pos.x +this.w * 0.5, this.pos.y + this.h * 0.5, this.w * 0.5, this.h * 0.5);
        }
      } else {
        fill(127);
        rect(pos.x, pos.y, w, h);
        textAlign(CENTER);
        stroke(0);
        fill(0);
        if(neighborCount !=0)
        text(neighborCount, pos.x + w * 0.5, pos.y + h - 5);
      }
    }
  }
  boolean contains(int x, int y) {
    return (x > this.pos.x && x < this.pos.x + this.w && y > this.pos.y && y < this.pos.y + this.h);
  }
  void revealed() {
    this.revealed = true;
  }
  void flagged() {
    this.flagged = true;
  }
  boolean isBomb() {
    return bomb;
  }
  boolean isFlagged(){
   return flagged; 
  }
  void countBombs() {

    if (this.bomb) {
      neighborCount = -1;
    }
    if (this.revealed) {
      return;
    }
    cells.get(i).get(j).revealed();
    int total = 0;
    int rev = 0;
    for (int _i = -1; _i <= 1; _i++) {
      for (int _j = -1; _j <= 1; _j++) {
        int i = this.i + _i;
        int j = this.j + _j;
        if ((i > -1 && i < cells.size() && j > -1 && j < cells.get(this.i).size())) {
          cell neighbor = cells.get(i).get(j);
          if (neighbor.bomb) {
              total++;
          }
          if(neighbor.flagged){
              rev++; 
          }
        }
      }
    }

    neighborCount = total;
    if (total - rev == 0) {
      for (int _i = -1; _i <= 1; _i++) {
        for (int _j = -1; _j <= 1; _j++) {
          int i = this.i + _i;
          int j = this.j + _j;
          if ((i > -1 && i < cells.size() && j > -1 && j < cells.get(this.i).size())) {
            cells.get(i).get(j).countBombs();
          }
        }
      }
    }
  }
}
