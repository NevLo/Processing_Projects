ArrayList<ArrayList<cell>> cells;
final int CELL_WIDTH = 20;
final int CELL_HEIGHT = 20;
final int FRAME_WIDTH = 1001;
final int FRAME_HEIGHT = 1001;
final int NUMER_OF_BOMBS = 10;

void setup() {
  size(1001, 1001);
  cells = new ArrayList<ArrayList<cell>>();
  int cellCols = FRAME_HEIGHT / CELL_HEIGHT;
  int cellRows = FRAME_WIDTH / CELL_WIDTH;

  for (int i =0; i < cellCols; i++) {
    cells.add(new ArrayList<cell>());
    for (int j =0; j < cellRows; j++) {
      cells.get(i).add(new cell(i, j, i * CELL_WIDTH, j*CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT));
    }
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    for (int i =0; i < cells.size(); i++) {
      for (int j =0; j < cells.get(i).size(); j++) {
        if (cells.get(i).get(j).contains(mouseX, mouseY)) {
          if (!cells.get(i).get(j).revealed) {
            cells.get(i).get(j).countBombs();
            if (cells.get(i).get(j).isBomb() && !cells.get(i).get(j).isFlagged()) {
              for (int x =0; x < cells.size(); x++) {
                for (int y =0; y < cells.get(x).size(); y++) {
                  if (cells.get(x).get(y).isBomb()) {
                    cells.get(x).get(y).flagged = false;
                    cells.get(x).get(y).revealed();
                  }
                }
              }
            }
          } else {
            cells.get(i).get(j).revealed = false;
            cells.get(i).get(j).countBombs();
            
          }
        }
      }
    }
  } else if (mouseButton == RIGHT ) {
    for (int i =0; i < cells.size(); i++) {
      for (int j =0; j < cells.get(i).size(); j++) {
        if (cells.get(i).get(j).contains(mouseX, mouseY)) {
          cells.get(i).get(j).flagged();
          cells.get(i).get(j).revealed();
        }
      }
    }
  }
}




void draw() {
  background(175);
  for (int i =0; i < cells.size(); i++) {
    for (int j = 0; j < cells.get(i).size(); j++) {
      cells.get(i).get(j).display();
    }
  }
}
