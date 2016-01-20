class VertexNode {
  
  float xcor;
  float ycor;
  
  Building building;
  
  VertexNode[] adjacentVertices;
  
  boolean traversed;
  
  int[] roads;
  
  VertexNode(int num){
    building = null;
    adjacentVertices = new VertexNode[num];
    roads = new int[num];
    for (int i = 0; i < roads.length; i++)
      roads[i] = -1;
    traversed = false;
  }
  
  void display(){
    PImage b;
    
    
    if (building != null && building.isCity()){
      
       if (building.playerNumber == 0){
        b = loadImage("City-White.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 1){
        b = loadImage("City-Blue.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 2){
        b = loadImage("City-Red.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 3){
        b = loadImage("City-Pink.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
    }
          
      
    else if(building != null && !building.isCity()){
      
      if (building.playerNumber == 0){
        b = loadImage("Settlement-White.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 1){
        b = loadImage("Settlement-Blue.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 2){
        b = loadImage("Settlement-Red.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }
       else if (building.playerNumber == 3){
        b = loadImage("Settlement-Pink.png");
         imageMode(CENTER);
         image(b, xcor, ycor);
       }

    }
    
    for (int i = 0; i < roads.length; i++) {
    if (!(roads[i] == -1)) {
	for (int k = 0; k < adjacentVertices.length; k++) {
	    for (int j = 0; j < adjacentVertices[k].roads.length; j++) {
		if (adjacentVertices[k].roads[j] == roads[i]) {
  		    strokeWeight(5);
		    if (roads[i] == 0)
			stroke (255);
		    else if (roads[i] == 1)
			stroke (4,99,255);
		    else if (roads[i] == 2)
			stroke (255,0,0);
		    else if (roads[i] == 3)
			stroke (169,4,255);
		    line (xcor, ycor, adjacentVertices[k].xcor, adjacentVertices[k].ycor);
		    }
	        }
	    }
        }
    }
  }
  
  void setCor(int x, int y){
       xcor = x;
        ycor = y; 
    }
}

