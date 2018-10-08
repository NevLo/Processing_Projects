class VM {
  ArrayList<PVector> vecs;

  VM() {
    vecs = new ArrayList<PVector>();
    vecs.add(new PVector(-100, 100));
    //vecs.add(new PVector(-100,100));


  }

  void addVec(PVector p) {
    vecs.add(p);
  }
  void show() {

    //  background(51);
    if (vecs.size() != 0) {
      //print(vecs.size());
      for (int i = 0; i < vecs.size(); i++) {
        text("[" + i + "] " + vecs.get(i).x + "x + " + vecs.get(i).y + "y", width/2, /*(4* height /5) + */map(i, 0, vecs.size(), 4*height/5, height));
      }
    } else {
      text("No Vectors Yet!", width/2, 4 * height/5);
    }
  }
  void displayVectors() {
    pushMatrix();
    translate(width/2, (3 * height / 4) /2);
    
    stroke(255);
    line(0, 150, 0, -150);
    line(150, 0, -150, 0);
    for (int i =0; i < vecs.size(); i++) {
      line(0,0, vecs.get(i).x, -vecs.get(i).y);
    }
    stroke(0);
    popMatrix();
  }
}
