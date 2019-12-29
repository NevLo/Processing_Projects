class firework {
  particle[] parts;
  
  firework(float x, float y){
    parts = new particle[100];
    for(int i = 0; i < 100; i++){
      parts[i] = new particle(x, y);
    }
  } 
}
