class Chunk {
  Block[][][] blocks;
  int[] region;


  Chunk(int... region) {
    blocks = new Block[16][256][16]; 
    this.region = region;
    
  }





  void generateRandomChunk() {
    for (int y = 0; y < blocks[0].length; y++) {
      for (int x = 0; x < blocks.length; x++) {  
        for (int z = 0; z < blocks[x][y].length; z++) {
          if (x <= 50) {
            blocks[x][y][z] = new Block((byte)2, new PVector(x, y, z));
          } else {
            blocks[x][y][z] = new Block((byte)0, new PVector(x, y, z));
          }
        }
      }
    }
  }
  void drawChunk() {
    for (int x = 0; x < blocks.length; x++) {
      for (int y = 0; y < blocks[x].length; y++) {
        for (int z = 0; z < blocks[x][y].length; z++) {
          blocks[x][y][z].drawBlock();
        }
      }
    }
  }
}
