class HexNode{
  
  float xcor;
  float ycor;
  
  int value;
  int landType;
  
  boolean robbed;
  
  VertexNode[] vertexes;
  
  HexNode( int VALUE, int LANDTYPE, VertexNode A, VertexNode B, VertexNode C, VertexNode D, VertexNode E, VertexNode F ){
    value = VALUE;
    landType = LANDTYPE;
    robbed = false;
    vertexes = new VertexNode[6];
    vertexes[0] = A;
    vertexes[1] = B;
    vertexes[2] = C;
    vertexes[3] = D;
    vertexes[4] = E;
    vertexes[5] = F;
    xcor = 0;
    ycor = 0;
  }
  
  void display(){
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}
