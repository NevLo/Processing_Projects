class Block {
  byte id;
  String name;
  PVector pos;
  color texture;
  boolean isAir;

  Block(byte id, PVector pos) {
    this.id = id; 
    isAir = (id == 0) ? true : false;
    this.pos = pos;
    this.name = getBlockNameByID();
    this.texture = getColorByID();
  }

  String getBlockNameByID() {
    String temp = "";
    JSONArray blocks = loadJSONArray("blocks.json");
    //printArray(blocks);
    for (int i = 0; i < blocks.size(); i++) {
      JSONObject b = blocks.getJSONObject(i);
      if (b.getInt("id") == id) {
        temp = b.getString("name");
      }
    }
    if (temp.equals("")) {
      
    }
    return temp;
  }
  String getName() {
    return name;
  }
  color getColorByID() {
    color temp = color(0,0,0);
    JSONArray blocks = loadJSONArray("blocks.json");
    //printArray(blocks);
    for (int i = 0; i < blocks.size(); i++) {
      JSONObject b = blocks.getJSONObject(i);
      if (b.getInt("id") == id) {
        JSONArray RGBA = b.getJSONArray("color");
        temp = color(RGBA.getJSONObject(0).getInt("r"),
          RGBA.getJSONObject(0).getInt("g"),
          RGBA.getJSONObject(0).getInt("b"),
          RGBA.getJSONObject(0).getInt("a"));
      }
    }

    return temp;
  }
  void drawBlock() {
  int x,x1,y,y1,z,z1;  
  if(isAir){
    return;
  }
  pushMatrix();
  translate(pos.x*scl,pos.y*scl,pos.z*scl);
  fill(texture);
  box(scl);
  popMatrix();
  }
  
 
  
}
