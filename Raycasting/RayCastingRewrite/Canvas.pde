class Canvas{
  float _x, _y, _width, _height;
  //Preferably, these two values would be the same.
  float _sizeH;
  float _sizeV;
  ArrayList<ArrayList<Tile>> board;
  Canvas(float _x, float _y,float _width, float _height){
    this._x = _x;
    this._y = _y;
    this._width = _width;
    this._height = _height;
  }
  
  void setCanvasSize(float num){
    _sizeH = _width / num;
    _sizeV = _height / num;
    
  }
  void initGameBoard(){
    if(_sizeH == 0.0f || _sizeV == 0.0f){
      print("You need to initialize the gameboard size");
      exit();
    }
    board = new ArrayList<ArrayList<Tile>>((int)_sizeH);
    for(int i = 0; i < board.size(); i++){
      board.add(new ArrayList<Tile>((int)_sizeV)); 
    }
    for(int i = 0; i < board.size(); i++){
      for(int j = 0; i < board.get(i).size(); j++){
        board.get(i).add(new Tile(i,j,_sizeH,_sizeV,(random(1) == 0)));
      
      }
    }
  }
  
  void show(){
    line(_x,_y,_x,_y+_height);
    line(_x,_y,_x+_width,_y);
    line(_x,_y+_height,_x+_width,_y+_height);
    line(_x+_width,_y,_x+_width,_y+_height);
    for(int i = 1; i < _width/_sizeH; i++){
      line(i*_sizeH,0, i*_sizeH, _height);
    }
    for(int i = 1; i < _height/_sizeV; i++){
      line(0,i*_sizeV, _width, i*_sizeV);
    }
    for(int i = 0; i < board.size(); i++){
      for(int j = 0; i < board.get(i).size(); j++){
        board.get(i).get(j).show();
         
      }
    }
    
    
    
  }
}
