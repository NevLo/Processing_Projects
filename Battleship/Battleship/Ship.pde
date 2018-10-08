class ship {
  int size; 
  ArrayList<PVector> coords;
  ArrayList<Boolean> hits;
  ship(int size, PVector... coordinates) {
    this.size = size;
    coords = new ArrayList<PVector>(); 
    hits = new ArrayList<Boolean>(); 
    

    for (PVector c : coordinates) {
      coords.add(new PVector(c.x, c.y));
    }
    for(int i = 0; i < coords.size(); i++){
     hits.add(false); 
     
    }
  }
}
