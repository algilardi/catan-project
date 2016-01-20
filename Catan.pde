//RESOURCE CONSTANTS
int WHEAT  = 0;
int SHEEP  = 1;
int BRICK  = 2;
int WOOD   = 3;
int ORE    = 4;

int numPlayers;
int justRolled;
int tradePlayer;

Player[] players;
Player winner;
Player turnPlayer;

int[] mine;
int[] his;


boolean settedUp;
boolean gameOver;
boolean turnOver;

boolean buildingSettlement;
boolean buildingRoad1;
boolean buildingRoad2;
boolean buildingCity;
boolean movingRobber;

boolean justPressed;
int justPressedCounter;

HexNode robbered;

//Board Hex Arrays
HexNode[] HexRow1 = new HexNode[3];
HexNode[] HexRow2 = new HexNode[4];
HexNode[] HexRow3 = new HexNode[5];
HexNode[] HexRow4 = new HexNode[4];
HexNode[] HexRow5 = new HexNode[3];
HexNode[] Hexes = new HexNode[19];

//Board Vertex Arrays
VertexNode[] VertexRow1 = new VertexNode[3];
VertexNode[] VertexRow2 = new VertexNode[4];
VertexNode[] VertexRow3 = new VertexNode[4];
VertexNode[] VertexRow4 = new VertexNode[5];
VertexNode[] VertexRow5 = new VertexNode[5];
VertexNode[] VertexRow6 = new VertexNode[6];
VertexNode[] VertexRow7 = new VertexNode[6];
VertexNode[] VertexRow8 = new VertexNode[5];
VertexNode[] VertexRow9 = new VertexNode[5];
VertexNode[] VertexRow10 = new VertexNode[4];
VertexNode[] VertexRow11 = new VertexNode[4];
VertexNode[] VertexRow12 = new VertexNode[3];
VertexNode[] vertexes = new VertexNode[54];

void buildRoad(){
  if (turnPlayer.resources[BRICK] >= 1 
      && turnPlayer.resources[WOOD] >= 1){
        turnPlayer.buildRoad();
        buildingRoad1 = true;
      }
}

void trade(){
  boolean acceptable = true;
  for (int i = 0; i < mine.length; i++){
    if (mine[i] > turnPlayer.resources[i] || his[i] > players[tradePlayer].resources[i])
      acceptable = false;
  }
  if (acceptable){
    Player mahG = players[tradePlayer];
    turnPlayer.trade( mine, his, mahG );
  }
  for (int i = 0; i < mine.length; i++){
    mine[i] = 0;
    his[i] = 0;
  }
}

void buildSettlement(){
  if (!buildingSettlement){
    if (turnPlayer.resources[BRICK] >= 1 
        && turnPlayer.resources[WOOD] >= 1
        && turnPlayer.resources[WHEAT] >= 1 
        && turnPlayer.resources[SHEEP] >= 1){
          turnPlayer.buildSettlement();
          buildingSettlement = true;
        }
  }
  else if (buildingSettlement){
    buildingSettlement = false;
    turnPlayer.resources[BRICK]++;
    turnPlayer.resources[WOOD]++;
    turnPlayer.resources[WHEAT]++;
    turnPlayer.resources[SHEEP]++;
  }
}

void buildCity(){
  if (!buildingCity){
    if (turnPlayer.resources[WHEAT] >= 2 
        && turnPlayer.resources[ORE] >= 3){
          turnPlayer.buildCity();
          buildingCity = true;
        }
  }
  else if (buildingCity){
    buildingCity = false;
    turnPlayer.resources[WHEAT] += 2;
    turnPlayer.resources[ORE] += 3;
  }
}

void mouseClicked(){
  println("MOUSE-X: " + mouseX);
  println("MOUSE-Y: " + mouseY);
  
  if ( 
      ((mouseX >= 753) && (mouseX <= 779)) &&
      ((mouseY >= 246) && (mouseY <= 276)) &&
      (!(tradePlayer <= 0)))
      tradePlayer--;
  else if (
      ((mouseX >= 813) && (mouseX <= 840)) &&
      ((mouseY >= 246) && (mouseY <= 276)) &&
      (!(tradePlayer >= numPlayers - 1)))
      tradePlayer++;
  else if (
      ((mouseX >= 700) && (mouseX <= 733)) &&
      ((mouseY >= 138) && (mouseY <= 167)))
      mine[WOOD]++; 
  else if (
      ((mouseX >= 740) && (mouseX <= 773)) &&
      ((mouseY >= 138) && (mouseY < 167)))
      mine[BRICK]++; 
  else if (
      ((mouseX >= 780) && (mouseX <= 813)) &&
      ((mouseY >= 138) && (mouseY < 167)))
      mine[SHEEP]++; 
  else if (
      ((mouseX >= 820) && (mouseX <= 853)) &&
      ((mouseY >= 138) && (mouseY < 167)))
      mine[WHEAT]++; 
  else if (
      ((mouseX >= 860) && (mouseX <= 893)) &&
      ((mouseY >= 138) && (mouseY < 167)))
      mine[ORE]++;
  else   if  (
      ((mouseX >= 700) && (mouseX <= 733)) &&
      ((mouseY >= 198) && (mouseY <= 227)) &&
      (!(mine[WOOD] <= 0)))
      mine[WOOD]--; 
  else if (
      ((mouseX >= 740) && (mouseX <= 773)) &&
      ((mouseY >= 198) && (mouseY <= 227)) &&
      (!(mine[BRICK] <= 0)))
      mine[BRICK]--; 
  else if (
      ((mouseX >= 780) && (mouseX <= 813)) &&
      ((mouseY >= 198) && (mouseY <= 227)) &&
      (!(mine[SHEEP] <= 0)))
      mine[SHEEP]--; 
  else if (
      ((mouseX >= 820) && (mouseX <= 853)) &&
      ((mouseY >= 198) && (mouseY <= 227)) && 
      (!(mine[WHEAT] <= 0)))
      mine[WHEAT]--; 
  else if (
      ((mouseX >= 860) && (mouseX <= 893)) &&
      ((mouseY >= 198) && (mouseY <= 227)) &&
      (!(mine[ORE] <= 0)))
      mine[ORE]--;
  else   if  (
      ((mouseX >= 700) && (mouseX <= 733)) &&
      ((mouseY >= 296) && (mouseY <= 325)))
      his[WOOD]++; 
  else if (
      ((mouseX >= 740) && (mouseX <= 773)) &&
      ((mouseY >= 296) && (mouseY <= 325)))
      his[BRICK]++; 
  else if (
      ((mouseX >= 780) && (mouseX <= 813)) &&
      ((mouseY >= 296) && (mouseY <= 325)))
      his[SHEEP]++; 
  else if (
      ((mouseX >= 820) && (mouseX <= 853)) &&
      ((mouseY >= 296) && (mouseY <= 325)))
      his[WHEAT]++; 
  else if (
      ((mouseX >= 860) && (mouseX <= 893)) &&
      ((mouseY >= 296) && (mouseY <= 325)))
      his[ORE]++;
  else   if  (
      ((mouseX >= 700) && (mouseX <= 733)) &&
      ((mouseY >= 360) && (mouseY <= 386)) &&
      (!(his[WOOD] <= 0)))
      his[WOOD]--; 
  else if (
      ((mouseX >= 740) && (mouseX <= 773)) &&
      ((mouseY >= 360) && (mouseY <= 386)) &&
      (!(his[BRICK] <= 0)))
      his[BRICK]--; 
  else if (
      ((mouseX >= 780) && (mouseX <= 813)) &&
      ((mouseY >= 360) && (mouseY <= 386)) &&
      (!(his[SHEEP] <= 0)))
      his[SHEEP]--; 
  else if (
      ((mouseX >= 820) && (mouseX <= 853)) &&
      ((mouseY >= 360) && (mouseY <= 386)) &&
      (!(his[WHEAT] <= 0)))
      his[WHEAT]--; 
  else if (
      ((mouseX >= 860) && (mouseX <= 893)) &&
      ((mouseY >= 360) && (mouseY <= 386)) &&
      (!(his[ORE] <= 0)))
      his[ORE]--;
  else if (
      ((mouseX >= 690) && (mouseX <= 820)) &&
      ((mouseY >= 430) && (mouseY < 460)))
      buildRoad();
  else if (
      ((mouseX >= 690) && (mouseX <= 820)) &&
      ((mouseY >= 460) && (mouseY < 490)))
      buildSettlement();
  else if (
      ((mouseX >= 690) && (mouseX <= 820)) &&
      ((mouseY >= 490) && (mouseY <= 520)))
      buildCity();
  else if (
      ((mouseX >=690) && (mouseX <= 820)) &&
      ((mouseY >= 400) && (mouseY < 430)))
      trade();
  else if (
      ((mouseX >= 770) && (mouseX <= 843)) &&
      ((mouseY >= 60) && (mouseY <= 90)))
      turnOver = true;

  
  
  
  else if (buildingRoad1){
    int tempX = mouseX;
    int tempY = mouseY;
    VertexNode tempVNode = closestVertex(tempX, tempY);
    for (int i = 0; i < tempVNode.roads.length; i++){
      if (tempVNode.roads[i] == -1){
        tempVNode.roads[i] = turnPlayer.playerNumber;
        buildingRoad1 = false;
        buildingRoad2 = true;
      }
    }
  }
  
  else if (buildingRoad2){
    int tempX = mouseX;
    int tempY = mouseY;
    VertexNode tempVNode = closestVertex(tempX, tempY);
    for (int i = 0; i < tempVNode.roads.length; i++){
      if (tempVNode.roads[i] == -1){
        tempVNode.roads[i] = turnPlayer.playerNumber;
        buildingRoad2 = false;
      }
    }
  }
  
  else if (buildingSettlement){
    int tempX = mouseX;
    int tempY = mouseY;
    VertexNode tempVNode = closestVertex(tempX, tempY);
    boolean enoughSpace = false;
    for (int i = 0; i < tempVNode.roads.length; i ++)
      if (tempVNode.roads[i] == turnPlayer.playerNumber)
        enoughSpace = true;
    for (int i = 0; i < tempVNode.adjacentVertices.length; i++)
      if (tempVNode.adjacentVertices[i].building != null)
        enoughSpace = false;
    if (tempVNode.building == null && enoughSpace ){
      tempVNode.building = new Building(turnPlayer.playerNumber);
      buildingSettlement = false;
    }
  }
  
  else if (buildingCity){
    int tempX = mouseX;
    int tempY = mouseY;
    VertexNode tempVNode = closestVertex(tempX, tempY);
    if (tempVNode.building != null && tempVNode.building.playerNumber == turnPlayer.playerNumber){
      tempVNode.building.upgrade();
      buildingCity = false;
    }
  }
  
  else if (movingRobber){
    int tempX = mouseX;
    int tempY = mouseY;
    HexNode tempHNode = closestHex(tempX, tempY);
    robbered = tempHNode;
    tempHNode.robbed = true;    
    movingRobber = false;   
  }
  
}

void setup(){

  size(900, 600);
  vertexSetup();
  hexSetup();
  
  justPressed = false;
  justPressedCounter = 0;
  
  robbered = HexRow3[0];
  background(255);
  settedUp = false;
  gameOver = false;
  buildingCity = false;
  buildingSettlement = false;
  buildingRoad1 = false;
  buildingRoad2 = false;
  winner = null;
  turnPlayer = null;
  numPlayers = 0;
  turnOver = true;
  mine = new int[5];
  his = new int[5];
}

void draw(){
  background(255);
  
  
  
  if (justPressed){
    justPressedCounter++;
    if (justPressedCounter > 25){
      justPressedCounter = 0;
      justPressed = false;
    }
  }
    
  
  
  if (gameOver && winner != null){
      displayWinner();
    }
  
  if (!settedUp){
    fill(0);
    text( "How many players? Please press \"2\" \"3\" or \"4\"" , 330, 35 );
    
    
    
    if (keyCode == 50){
        players = new Player[2];
        players[0] = new Player(0);
        players[1] = new Player(1);
        numPlayers = 2;
        turnPlayer = players[1];
        // Player 1 - White
        VertexRow4[1].building = new Building(0);
        VertexRow4[1].roads[0] = 0;
        VertexRow3[1].roads[0] = 0;
        VertexRow9[3].building = new Building(0);
        VertexRow9[3].roads[0] = 0;
        VertexRow10[2].roads[0] = 0;
        // Player 2 - Blue
        VertexRow9[1].building = new Building(1);
        VertexRow9[1].roads[0] = 1;
        VertexRow8[1].roads[0] = 1;
        VertexRow11[2].building = new Building(1);
        VertexRow11[2].roads[0] = 1;
        VertexRow12[1].roads[0] = 1;
        
        players[0].resources[WOOD] = 2;
        players[0].resources[ORE] = 2;
        players[0].resources[BRICK] = 1;
        players[0].resources[SHEEP] = 1;

        players[1].resources[SHEEP] = 1;
        players[1].resources[BRICK] = 1;
        players[1].resources[WOOD] = 1;
        players[1].resources[ORE] = 1;
        players[1].resources[WHEAT] = 1;
        
        settedUp = true;
      }
      else if (keyCode == 51){
        players = new Player[3];
        players[0] = new Player(0);
        players[1] = new Player(1);
        players[2] = new Player(2);
        numPlayers = 3;
        turnPlayer = players[2];
        // Player 1 - White
        VertexRow4[1].building = new Building(0);
        VertexRow4[1].roads[0] = 0;
        VertexRow3[1].roads[0] = 0;
        VertexRow9[3].building = new Building(0);
        VertexRow9[3].roads[0] = 0;
        VertexRow10[2].roads[0] = 0;
        // Player 2 - Blue
        VertexRow9[1].building = new Building(1);
        VertexRow9[1].roads[0] = 1;
        VertexRow8[1].roads[0] = 1;
        VertexRow11[2].building = new Building(1);
        VertexRow11[2].roads[0] = 1;
        VertexRow12[1].roads[0] = 1;
        // Player 3 - Red
        VertexRow5[2].building = new Building(2);
        VertexRow5[2].roads[0] = 2;
        VertexRow4[2].roads[0] = 2;
        VertexRow7[3].building = new Building(2);
        VertexRow7[3].roads[0] = 2;
        VertexRow8[3].roads[0] = 2;
        
        players[0].resources[WOOD] = 2;
        players[0].resources[ORE] = 2;
        players[0].resources[BRICK] = 1;
        players[0].resources[SHEEP] = 1;
        
        players[1].resources[SHEEP] = 1;
        players[1].resources[BRICK] = 1;
        players[1].resources[WOOD] = 1;
        players[1].resources[ORE] = 1;
        players[1].resources[WHEAT] = 1;
        
        players[2].resources[ORE] = 1;
        players[2].resources[BRICK] = 1;
        players[2].resources[WHEAT] = 2;
        players[2].resources[WOOD] = 1;
        players[2].resources[SHEEP] = 1;
        
        settedUp = true;
      }
      if (keyCode == 52){
        players = new Player[4];
        players[0] = new Player(0);
        players[1] = new Player(1);
        players[2] = new Player(2);
        players[3] = new Player(3);
        numPlayers = 4;
        turnPlayer = players[3];
        // Player 1 - White
        VertexRow4[1].building = new Building(0);
        VertexRow4[1].roads[0] = 0;
        VertexRow3[1].roads[0] = 0;
        VertexRow9[3].building = new Building(0);
        VertexRow9[3].roads[0] = 0;
        VertexRow10[2].roads[0] = 0;
        // Player 2 - Blue
        VertexRow9[1].building = new Building(1);
        VertexRow9[1].roads[0] = 1;
        VertexRow8[1].roads[0] = 1;
        VertexRow11[2].building = new Building(1);
        VertexRow11[2].roads[0] = 1;
        VertexRow12[1].roads[0] = 1;
        // Player 3 - Red
        VertexRow5[2].building = new Building(2);
        VertexRow5[2].roads[0] = 2;
        VertexRow4[2].roads[0] = 2;
        VertexRow7[3].building = new Building(2);
        VertexRow7[3].roads[0] = 2;
        VertexRow8[3].roads[0] = 2;
        // Player 4 - Orange
        VertexRow3[3].building = new Building(3);
        VertexRow3[3].roads[0] = 3;
        VertexRow4[3].roads[0] = 3;
        VertexRow6[4].building = new Building(3);
        VertexRow6[4].roads[0] = 3;
        VertexRow7[4].roads[0] = 3;
        
        players[0].resources[WOOD] = 2;
        players[0].resources[ORE] = 2;
        players[0].resources[BRICK] = 1;
        players[0].resources[SHEEP] = 1;
        
        players[1].resources[SHEEP] = 1;
        players[1].resources[BRICK] = 1;
        players[1].resources[WOOD] = 1;
        players[1].resources[ORE] = 1;
        players[1].resources[WHEAT] = 1;
        
        players[2].resources[ORE] = 1;
        players[2].resources[BRICK] = 1;
        players[2].resources[WHEAT] = 2;
        players[2].resources[WOOD] = 1;
        players[2].resources[SHEEP] = 1;
        
        players[3].resources[WHEAT] = 2;
        players[3].resources[SHEEP] = 1;
        players[3].resources[WOOD] = 1;
        
        settedUp = true;  
      }
  }   

  display();  
  
  if(settedUp){
    if(turnOver){
    turnOver = false;
    int temp = turnPlayer.playerNumber + 1;
    if (temp == numPlayers)
      temp = 0;
    turnPlayer = players[temp];
    turnStart(turnPlayer);  
    calculateVP();
    isOver();
  }
  
  else if(!turnOver){
    text("It is Player " + (turnPlayer.playerNumber + 1) + "'s turn" , 400, 35);
   
  }
  } 

    
 

    
  
}

void turnStart(Player playa){

  int diceRoll = 2 + (int)(Math.random() * 6) + (int)(Math.random() * 6);
  justRolled = diceRoll;
  if (diceRoll == 7){
    rob();
    moveRobber();
  }
  
  else {
    for (int i = 0; i < Hexes.length; i++){
      HexNode hexNode = Hexes[i];
      if ( hexNode.value == diceRoll && !hexNode.robbed ){
        for (int j = 0; j < hexNode.vertexes.length; j++){
	  VertexNode vertexNode = hexNode.vertexes[j];
	  if (vertexNode.building != null){
	  players[vertexNode.building.playerNumber].resources[hexNode.landType]+= vertexNode.building.buildingNumber;
          }
        }
      }
    }
  	  

  }
}

void rob(){
  for (int p = 0; p < players.length; p++){
    if (players[p].totalCards() > 7){
      int removesLeft = players[p].totalCards() - (players[p].totalCards() / 2);
      
      while (removesLeft > 0){
        int selectedResource = (int)random(5);
        if (players[p].resources[selectedResource] > 0){
           players[p].resources[selectedResource]--;
           removesLeft--; 
        }
      }
      
    }

  } 
}


  

void moveRobber(){
  movingRobber = true;
  robbered.robbed = false;
}
  




void calculateVP () {
  for (int i = 0; i < players.length; i++) 
    players[i].victoryPoints = 0;
  for (int i = 0; i < vertexes.length; i++) {
    if (vertexes[i].building == null)
      continue;
    else
      players[vertexes[i].building.playerNumber].victoryPoints += vertexes[i].building.buildingNumber;
  }

}

		

void keyPressed(){
println(key);
println(keyCode);
println(settedUp);
}

void isOver(){
  for (int i = 0; i < players.length; i ++){
    if (players[i].victoryPoints >= 7){
      gameOver = true;
      winner = players[i];
    }
  }
}

void displayWinner(){
  background(255);
  fill(0);
  text( "Player " + winner.playerNumber + " is the winner of this round of Settlers of Catan, Processing Edition. Congradulations, you are swag.", 160, 250);
}

void display(){
  
  if (numPlayers == 4){
fill(0);
text ("Player 1", 40, 100);
text ("Victory Points: " + players[0].victoryPoints, 47, 113);
text ("Wood: " + players[0].resources[WOOD], 47, 125);
text ("Brick: " + players[0].resources[BRICK], 47, 137);
text ("Sheep: " + players[0].resources[SHEEP], 47, 149);
text ("Wheat: " + players[0].resources[WHEAT], 47, 161);
text ("Ore: " + players[0].resources[ORE], 47, 173);

fill(4,99,255);
text ("Player 2", 40, 193);
text ("Victory Points: " + players[1].victoryPoints, 47, 206);
text ("Wood: " + players[1].resources[WOOD], 47, 218);
text ("Brick: " + players[1].resources[BRICK], 47, 230);
text ("Sheep: " + players[1].resources[SHEEP], 47, 242);
text ("Wheat: " + players[1].resources[WHEAT], 47, 254);
text ("Ore: " + players[1].resources[ORE], 47, 266);

fill(255,0,0);
text ("Player 3", 40, 285);
text ("Victory Points: " + players[2].victoryPoints, 47, 298);
text ("Wood: " + players[2].resources[WOOD], 47, 310);
text ("Brick: " + players[2].resources[BRICK], 47, 322);
text ("Sheep: " + players[2].resources[SHEEP], 47, 334);
text ("Wheat: " + players[2].resources[WHEAT], 47, 346);
text ("Ore: " + players[2].resources[ORE], 47, 358);

fill(169,4,255);
text ("Player 4", 40, 377);
text ("Victory Points: " + players[3].victoryPoints, 47, 390);
text ("Wood: " + players[3].resources[WOOD], 47, 402);
text ("Brick: " + players[3].resources[BRICK], 47, 414);
text ("Sheep: " + players[3].resources[SHEEP], 47, 426);
text ("Wheat: " + players[3].resources[WHEAT], 47, 438);
text ("Ore: " + players[3].resources[ORE], 47, 450);
  }
  
  if (numPlayers == 3){
fill(0);
text ("Player 1", 40, 100);
text ("Victory Points: " + players[0].victoryPoints, 47, 113);
text ("Wood: " + players[0].resources[WOOD], 47, 125);
text ("Brick: " + players[0].resources[BRICK], 47, 137);
text ("Sheep: " + players[0].resources[SHEEP], 47, 149);
text ("Wheat: " + players[0].resources[WHEAT], 47, 161);
text ("Ore: " + players[0].resources[ORE], 47, 173);

fill(4,99,255);
text ("Player 2", 40, 193);
text ("Victory Points: " + players[1].victoryPoints, 47, 206);
text ("Wood: " + players[1].resources[WOOD], 47, 218);
text ("Brick: " + players[1].resources[BRICK], 47, 230);
text ("Sheep: " + players[1].resources[SHEEP], 47, 242);
text ("Wheat: " + players[1].resources[WHEAT], 47, 254);
text ("Ore: " + players[1].resources[ORE], 47, 266);

fill(255,0,0);
text ("Player 3", 40, 285);
text ("Victory Points: " + players[2].victoryPoints, 47, 298);
text ("Wood: " + players[2].resources[WOOD], 47, 310);
text ("Brick: " + players[2].resources[BRICK], 47, 322);
text ("Sheep: " + players[2].resources[SHEEP], 47, 334);
text ("Wheat: " + players[2].resources[WHEAT], 47, 346);
text ("Ore: " + players[2].resources[ORE], 47, 358);
  }
  
  if (numPlayers ==2){
fill(0);
text ("Player 1", 40, 100);
text ("Victory Points: " + players[0].victoryPoints, 47, 113);
text ("Wood: " + players[0].resources[WOOD], 47, 125);
text ("Brick: " + players[0].resources[BRICK], 47, 137);
text ("Sheep: " + players[0].resources[SHEEP], 47, 149);
text ("Wheat: " + players[0].resources[WHEAT], 47, 161);
text ("Ore: " + players[0].resources[ORE], 47, 173);

fill(4,99,255);
text ("Player 2", 40, 193);
text ("Victory Points: " + players[1].victoryPoints, 47, 206);
text ("Wood: " + players[1].resources[WOOD], 47, 218);
text ("Brick: " + players[1].resources[BRICK], 47, 230);
text ("Sheep: " + players[1].resources[SHEEP], 47, 242);
text ("Wheat: " + players[1].resources[WHEAT], 47, 254);
text ("Ore: " + players[1].resources[ORE], 47, 266);
  }
  
 
  if (numPlayers != 0) {
     PImage derp;
  derp = loadImage("rowofarrows.png");
  imageMode(CENTER);
  image(derp, 795, 180);
  
  PImage herp;
  herp = derp;
  image(herp, 795, 340);
  
  PImage Kratos;
  Kratos = loadImage("SidewaysArrows.png");
  image(Kratos, 795, 260);
  
  
  
  PImage b;
  b = loadImage("hex.png");
  imageMode(CENTER);
  image(b, 450, 300);
  
  PImage c;
  c = loadImage("Robber.png");
  imageMode(CENTER);
  image(c, robbered.xcor, robbered.ycor);
  
  if (movingRobber){
    PImage mcderp;
    mcderp = loadImage("moveRobber.png");
    imageMode(CENTER);
    image(mcderp, 450, 62);
  }

    fill(0);
    text ("Build Road", 700, 450);
    text ("Build Settlement", 700, 480);
    text ("Build City", 700, 510);
    text ("End turn", 780, 80);
    text ("Trade", 700, 420);
    text ("Building Costs", 410, 570);
    text ("Road: 1 Brick, 1 Wood.    Settlement: 1 Brick, 1 Wood, 1 Wheat, 1 Sheep.    City: 2 Wheat, 3 Ore.", 140, 590);
    text ("Dice roll: " + justRolled, 185, 70);
    text ("Building Road Start: " + buildingRoad1, 50, 475);
    text ("Building Road End: " + buildingRoad2, 50, 492);
    text ("Building Settlement: " + buildingSettlement, 50, 509);
    text ("Building City: " + buildingCity, 50, 526);
    text (mine[WOOD], 712, 185);
    text (mine[BRICK], 751, 185);
    text (mine[SHEEP], 792, 185);
    text (mine[WHEAT], 832, 185);
    text (mine[ORE], 872, 185);
    text (his[WOOD], 712, 345);
    text (his[BRICK], 751, 345);
    text (his[SHEEP], 792, 345);
    text (his[WHEAT], 832, 345);
    text (his[ORE], 872, 345);
    text (tradePlayer + 1, 791, 267);
  
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(690, 430, 130, 30);
    rect(690, 460, 130, 30);
    rect(690, 490, 130, 30);
    rect(770, 60, 73, 30);
    rect(690, 400, 130, 30);
  }
 


      
     
  for (int i = 0; i < 3; i++) {
    VertexRow1[i].display();
    VertexRow12[i].display();
  }
  for (int i = 0; i < 4; i++) {
    VertexRow2[i].display();
    VertexRow3[i].display();
    VertexRow10[i].display();
    VertexRow11[i].display();
  }
  for (int i = 0; i < 5; i++) {
    VertexRow4[i].display();
    VertexRow5[i].display();
    VertexRow8[i].display();
    VertexRow9[i].display();
  }
  for (int i = 0; i < 6; i++) {
    VertexRow6[i].display();
    VertexRow7[i].display();
  }
}

VertexNode closestVertex (float x, float y) {
    VertexNode ans = vertexes[0];
    float currentDiff = abs(x - vertexes[0].xcor) + abs(y - vertexes[0].ycor);
    float newDiff = 1000;
    for (int i = 0; i < vertexes.length; i++) {
	newDiff = abs(x - vertexes[i].xcor) + abs(y - vertexes[i].ycor);
	if (newDiff < currentDiff) {
	    ans = vertexes[i];
	    currentDiff = newDiff;
	}
    }
    return ans;
}

HexNode closestHex (float x, float y) {
    HexNode ans = Hexes[0];
    float currentDiff = abs(x - Hexes[0].xcor) + abs(y - Hexes[0].ycor);
    float newDiff = 1000;
    for (int i = 0; i < Hexes.length; i++) {
	newDiff = abs(x - Hexes[i].xcor) + abs(y - Hexes[i].ycor);
	if (newDiff < currentDiff) {
	    ans = Hexes[i];
	    currentDiff = newDiff;
	}
    }
    return ans;
}

void vertexSetup() {
  VertexRow1[0] = new VertexNode(2);
  VertexRow1[1] = new VertexNode(2);
  VertexRow1[2] = new VertexNode(2);
  
  VertexRow2[0] = new VertexNode(2);
  VertexRow2[1] = new VertexNode(3);
  VertexRow2[2] = new VertexNode(3);
  VertexRow2[3] = new VertexNode(2);
  
  VertexRow3[0] = new VertexNode(3);
  VertexRow3[1] = new VertexNode(3);
  VertexRow3[2] = new VertexNode(3);
  VertexRow3[3] = new VertexNode(3);
  
  VertexRow4[0] = new VertexNode(2);
  VertexRow4[1] = new VertexNode(3);
  VertexRow4[2] = new VertexNode(3);
  VertexRow4[3] = new VertexNode(3);
  VertexRow4[4] = new VertexNode(2);
  
  VertexRow5[0] = new VertexNode(3);
  VertexRow5[1] = new VertexNode(3);
  VertexRow5[2] = new VertexNode(3);
  VertexRow5[3] = new VertexNode(3);
  VertexRow5[4] = new VertexNode(3);
  
  VertexRow6[0] = new VertexNode(2);
  VertexRow6[1] = new VertexNode(3);
  VertexRow6[2] = new VertexNode(3);
  VertexRow6[3] = new VertexNode(3);
  VertexRow6[4] = new VertexNode(3);
  VertexRow6[5] = new VertexNode(2);
  
  VertexRow7[0] = new VertexNode(2);
  VertexRow7[1] = new VertexNode(3);
  VertexRow7[2] = new VertexNode(3);
  VertexRow7[3] = new VertexNode(3);
  VertexRow7[4] = new VertexNode(3);
  VertexRow7[5] = new VertexNode(2);
  
  VertexRow8[0] = new VertexNode(3);
  VertexRow8[1] = new VertexNode(3);
  VertexRow8[2] = new VertexNode(3);
  VertexRow8[3] = new VertexNode(3);
  VertexRow8[4] = new VertexNode(3);
  
  VertexRow9[0] = new VertexNode(2);
  VertexRow9[1] = new VertexNode(3);
  VertexRow9[2] = new VertexNode(3);
  VertexRow9[3] = new VertexNode(3);
  VertexRow9[4] = new VertexNode(2);
  
  VertexRow10[0] = new VertexNode(3);
  VertexRow10[1] = new VertexNode(3);
  VertexRow10[2] = new VertexNode(3);
  VertexRow10[3] = new VertexNode(3);
  
  VertexRow11[0] = new VertexNode(2);
  VertexRow11[1] = new VertexNode(3);
  VertexRow11[2] = new VertexNode(3);
  VertexRow11[3] = new VertexNode(2);
  
  VertexRow12[0] = new VertexNode(2);
  VertexRow12[1] = new VertexNode(2);
  VertexRow12[2] = new VertexNode(2);
  
  for (int i = 0 ; i < VertexRow1.length ; i++){
    VertexRow1[i].setCor(359 + (i * 88), 98);
  }

  for (int i = 0 ; i < VertexRow2.length ; i++){
    VertexRow2[i].setCor(315 + (i * 88), 122);
  }

  for (int i = 0 ; i < VertexRow3.length ; i++){
    VertexRow3[i].setCor(315 + (i * 88), 174);
  }

  for (int i = 0 ; i < VertexRow4.length ; i++){
    VertexRow4[i].setCor(272 + (i * 88), 199);
  }

  for (int i = 0 ; i < VertexRow5.length ; i++){
    VertexRow5[i].setCor(272 + (i * 88), 259);
  }

  for (int i = 0 ; i < VertexRow6.length ; i++){
    VertexRow6[i].setCor(228 + (i * 88), 275);
  }

  
  for (int i = 0; i < VertexRow12.length; i++)
	VertexRow12[i].setCor(360 + 88 * i , 500);
  for (int i = 0; i < VertexRow11.length; i++)
	VertexRow11[i].setCor(316 + 88 * i , 475);
  for (int i = 0; i < VertexRow10.length; i++)
	VertexRow10[i].setCor(316 + 88 * i , 425);
  for (int i = 0; i < VertexRow9.length; i++)
	VertexRow9[i].setCor(272 + 88 * i , 400);
  for (int i = 0; i < VertexRow8.length; i++)
	VertexRow8[i].setCor(272 + 88 * i , 350);
  for (int i = 0; i < VertexRow7.length; i++)
	VertexRow7[i].setCor(228 + 88 * i , 325);

  
  int k = 0;
  for (int i = 0; i < 3; i++) {
    vertexes[k] = VertexRow1[i];
    k++;
  }
  for (int i = 0; i < 4; i++) {
    vertexes[k] = VertexRow2[i];
    k++;
  }
  for (int i = 0; i < 4; i++) {
    vertexes[k] = VertexRow3[i];
    k++;
  }
  for (int i = 0; i < 5; i++) {
    vertexes[k] = VertexRow4[i];
    k++;
  }
  for (int i = 0; i < 5; i++) {
    vertexes[k] = VertexRow5[i];
    k++;
  }
  for (int i = 0; i < 6; i++) {
    vertexes[k] = VertexRow6[i];
    k++;
  }
  for (int i = 0; i < 6; i++) {
    vertexes[k] = VertexRow7[i];
    k++;
  }
  for (int i = 0; i < 5; i++) {
    vertexes[k] = VertexRow8[i];
    k++;
  }
  for (int i = 0; i < 5; i++) {
    vertexes[k] = VertexRow9[i];
    k++;
  }
  for (int i = 0; i < 4; i++) {
    vertexes[k] = VertexRow10[i];
    k++;
  }
  for (int i = 0; i < 4; i++) {
    vertexes[k] = VertexRow11[i];
    k++;
  }
  for (int i = 0; i < 3; i++) {
    vertexes[k] = VertexRow12[i];
    k++;
  } 
  
  VertexRow1[0].adjacentVertices[0] = VertexRow2[1];
  VertexRow1[0].adjacentVertices[1] = VertexRow2[0];
  VertexRow1[1].adjacentVertices[0] = VertexRow2[2];
  VertexRow1[1].adjacentVertices[1] = VertexRow2[1];
  VertexRow1[2].adjacentVertices[0] = VertexRow2[3];
  VertexRow1[2].adjacentVertices[1] = VertexRow2[2];
  
  VertexRow2[0].adjacentVertices[0] = VertexRow1[0];
  VertexRow2[0].adjacentVertices[1] = VertexRow3[0];
  VertexRow2[1].adjacentVertices[0] = VertexRow1[1];
  VertexRow2[1].adjacentVertices[1] = VertexRow3[1];
  VertexRow2[1].adjacentVertices[2] = VertexRow1[0];
  VertexRow2[2].adjacentVertices[0] = VertexRow1[2];
  VertexRow2[2].adjacentVertices[1] = VertexRow3[2];
  VertexRow2[2].adjacentVertices[2] = VertexRow1[1];
  VertexRow2[3].adjacentVertices[0] = VertexRow1[2];
  VertexRow2[3].adjacentVertices[1] = VertexRow3[3];
  
  VertexRow3[0].adjacentVertices[0] = VertexRow2[0];
  VertexRow3[0].adjacentVertices[1] = VertexRow4[1];
  VertexRow3[0].adjacentVertices[2] = VertexRow4[0];
  VertexRow3[1].adjacentVertices[0] = VertexRow2[1];
  VertexRow3[1].adjacentVertices[1] = VertexRow4[2];
  VertexRow3[1].adjacentVertices[2] = VertexRow4[1];
  VertexRow3[2].adjacentVertices[0] = VertexRow2[2];
  VertexRow3[2].adjacentVertices[1] = VertexRow4[3];
  VertexRow3[2].adjacentVertices[2] = VertexRow4[2];
  VertexRow3[3].adjacentVertices[0] = VertexRow2[3];
  VertexRow3[3].adjacentVertices[1] = VertexRow4[4];
  VertexRow3[3].adjacentVertices[2] = VertexRow4[3];
  
  VertexRow4[0].adjacentVertices[0] = VertexRow3[0];
  VertexRow4[0].adjacentVertices[1] = VertexRow5[0];
  VertexRow4[1].adjacentVertices[0] = VertexRow3[1];
  VertexRow4[1].adjacentVertices[1] = VertexRow5[1];
  VertexRow4[1].adjacentVertices[2] = VertexRow3[0];
  VertexRow4[2].adjacentVertices[0] = VertexRow3[2];
  VertexRow4[2].adjacentVertices[1] = VertexRow5[2];
  VertexRow4[2].adjacentVertices[2] = VertexRow3[1];
  VertexRow4[3].adjacentVertices[0] = VertexRow3[3];
  VertexRow4[3].adjacentVertices[1] = VertexRow5[3];
  VertexRow4[3].adjacentVertices[2] = VertexRow3[2];
  VertexRow4[4].adjacentVertices[0] = VertexRow5[4];
  VertexRow4[4].adjacentVertices[1] = VertexRow2[1];
  
  VertexRow5[0].adjacentVertices[0] = VertexRow4[0];
  VertexRow5[0].adjacentVertices[1] = VertexRow6[1];
  VertexRow5[0].adjacentVertices[2] = VertexRow6[0];
  VertexRow5[1].adjacentVertices[0] = VertexRow4[1];
  VertexRow5[1].adjacentVertices[1] = VertexRow6[2];
  VertexRow5[1].adjacentVertices[2] = VertexRow6[1];
  VertexRow5[2].adjacentVertices[0] = VertexRow4[2];
  VertexRow5[2].adjacentVertices[1] = VertexRow6[3];
  VertexRow5[2].adjacentVertices[2] = VertexRow6[2];
  VertexRow5[3].adjacentVertices[0] = VertexRow4[3];
  VertexRow5[3].adjacentVertices[1] = VertexRow6[4];
  VertexRow5[3].adjacentVertices[2] = VertexRow6[3];
  VertexRow5[4].adjacentVertices[0] = VertexRow4[4];
  VertexRow5[4].adjacentVertices[1] = VertexRow6[5];
  VertexRow5[4].adjacentVertices[2] = VertexRow6[4];
  
  VertexRow6[0].adjacentVertices[0] = VertexRow5[0];
  VertexRow6[0].adjacentVertices[1] = VertexRow7[0];
  VertexRow6[1].adjacentVertices[0] = VertexRow5[1];
  VertexRow6[1].adjacentVertices[1] = VertexRow7[1];
  VertexRow6[1].adjacentVertices[2] = VertexRow5[0];
  VertexRow6[2].adjacentVertices[0] = VertexRow5[2];
  VertexRow6[2].adjacentVertices[1] = VertexRow7[2];
  VertexRow6[2].adjacentVertices[2] = VertexRow5[1];
  VertexRow6[3].adjacentVertices[0] = VertexRow5[3];
  VertexRow6[3].adjacentVertices[1] = VertexRow7[3];
  VertexRow6[3].adjacentVertices[2] = VertexRow5[2];
  VertexRow6[4].adjacentVertices[0] = VertexRow5[4];
  VertexRow6[4].adjacentVertices[1] = VertexRow7[4];
  VertexRow6[4].adjacentVertices[2] = VertexRow5[3];
  VertexRow6[5].adjacentVertices[0] = VertexRow7[5];
  VertexRow6[5].adjacentVertices[1] = VertexRow5[4];
  
  VertexRow7[0].adjacentVertices[0] = VertexRow6[0];
  VertexRow7[0].adjacentVertices[1] = VertexRow8[0];
  VertexRow7[1].adjacentVertices[0] = VertexRow6[1];
  VertexRow7[1].adjacentVertices[1] = VertexRow8[1];
  VertexRow7[1].adjacentVertices[2] = VertexRow8[0];
  VertexRow7[2].adjacentVertices[0] = VertexRow6[2];
  VertexRow7[2].adjacentVertices[1] = VertexRow8[2];
  VertexRow7[2].adjacentVertices[2] = VertexRow8[1];
  VertexRow7[3].adjacentVertices[0] = VertexRow6[3];
  VertexRow7[3].adjacentVertices[1] = VertexRow8[3];
  VertexRow7[3].adjacentVertices[2] = VertexRow8[2];
  VertexRow7[4].adjacentVertices[0] = VertexRow6[4];
  VertexRow7[4].adjacentVertices[1] = VertexRow8[4];
  VertexRow7[4].adjacentVertices[2] = VertexRow8[3];
  VertexRow7[5].adjacentVertices[0] = VertexRow6[5];
  VertexRow7[5].adjacentVertices[1] = VertexRow8[4];
  
  VertexRow8[0].adjacentVertices[0] = VertexRow7[1];
  VertexRow8[0].adjacentVertices[1] = VertexRow9[0];
  VertexRow8[1].adjacentVertices[0] = VertexRow7[2];
  VertexRow8[1].adjacentVertices[1] = VertexRow9[1];
  VertexRow8[1].adjacentVertices[2] = VertexRow7[1];
  VertexRow8[2].adjacentVertices[0] = VertexRow7[3];
  VertexRow8[2].adjacentVertices[1] = VertexRow9[2];
  VertexRow8[2].adjacentVertices[2] = VertexRow7[2];
  VertexRow8[3].adjacentVertices[0] = VertexRow7[4];
  VertexRow8[3].adjacentVertices[1] = VertexRow9[3];
  VertexRow8[3].adjacentVertices[2] = VertexRow7[3];
  VertexRow8[4].adjacentVertices[0] = VertexRow7[5];
  VertexRow8[4].adjacentVertices[1] = VertexRow9[4];
  VertexRow8[4].adjacentVertices[2] = VertexRow7[4];
  
  VertexRow9[0].adjacentVertices[0] = VertexRow8[0];
  VertexRow9[0].adjacentVertices[1] = VertexRow10[0];
  VertexRow9[1].adjacentVertices[0] = VertexRow8[1];
  VertexRow9[1].adjacentVertices[1] = VertexRow10[1];
  VertexRow9[1].adjacentVertices[2] = VertexRow10[0];
  VertexRow9[2].adjacentVertices[0] = VertexRow8[2];
  VertexRow9[2].adjacentVertices[1] = VertexRow10[2];
  VertexRow9[2].adjacentVertices[2] = VertexRow10[1];
  VertexRow9[3].adjacentVertices[0] = VertexRow8[3];
  VertexRow9[3].adjacentVertices[1] = VertexRow10[3];
  VertexRow9[3].adjacentVertices[2] = VertexRow10[2];
  VertexRow9[4].adjacentVertices[0] = VertexRow8[4];
  VertexRow9[4].adjacentVertices[1] = VertexRow10[3];
  
  VertexRow10[0].adjacentVertices[0] = VertexRow9[1];
  VertexRow10[0].adjacentVertices[1] = VertexRow11[0];
  VertexRow10[0].adjacentVertices[2] = VertexRow9[0];
  VertexRow10[1].adjacentVertices[0] = VertexRow9[2];
  VertexRow10[1].adjacentVertices[1] = VertexRow11[1];
  VertexRow10[1].adjacentVertices[2] = VertexRow9[1];
  VertexRow10[2].adjacentVertices[0] = VertexRow9[3];
  VertexRow10[2].adjacentVertices[1] = VertexRow11[2];
  VertexRow10[2].adjacentVertices[2] = VertexRow9[2];
  VertexRow10[3].adjacentVertices[0] = VertexRow9[4];
  VertexRow10[3].adjacentVertices[1] = VertexRow11[3];
  VertexRow10[3].adjacentVertices[2] = VertexRow9[3];
  
  VertexRow11[0].adjacentVertices[0] = VertexRow11[3];
  VertexRow11[0].adjacentVertices[1] = VertexRow11[3];
  VertexRow11[1].adjacentVertices[0] = VertexRow10[1];
  VertexRow11[1].adjacentVertices[1] = VertexRow12[1];
  VertexRow11[1].adjacentVertices[2] = VertexRow12[0];
  VertexRow11[2].adjacentVertices[0] = VertexRow10[2];
  VertexRow11[2].adjacentVertices[1] = VertexRow12[2];
  VertexRow11[2].adjacentVertices[2] = VertexRow12[1];
  VertexRow11[3].adjacentVertices[0] = VertexRow10[3];
  VertexRow11[3].adjacentVertices[1] = VertexRow12[2];
  
  VertexRow12[0].adjacentVertices[0] = VertexRow11[0];
  VertexRow12[0].adjacentVertices[1] = VertexRow11[1];
  VertexRow12[1].adjacentVertices[0] = VertexRow11[1];
  VertexRow12[1].adjacentVertices[1] = VertexRow11[2];
  VertexRow12[2].adjacentVertices[0] = VertexRow11[2];
  VertexRow12[2].adjacentVertices[1] = VertexRow11[3];

}

void hexSetup(){
  HexRow1[0] = new HexNode(11, WOOD , VertexRow1[0], VertexRow2[1], VertexRow3[1], VertexRow4[1], VertexRow3[0], VertexRow2[0]);
  HexRow1[1] = new HexNode(12, SHEEP, VertexRow1[1], VertexRow2[2], VertexRow3[2], VertexRow4[2], VertexRow3[1], VertexRow2[1]);
  HexRow1[2] = new HexNode(9 , WHEAT, VertexRow1[2], VertexRow2[3], VertexRow3[3], VertexRow4[3], VertexRow3[2], VertexRow2[2]);

  HexRow2[0] = new HexNode(4 , BRICK, VertexRow3[0], VertexRow4[1], VertexRow5[1], VertexRow6[1], VertexRow5[0], VertexRow4[0]);
  HexRow2[1] = new HexNode(6 , ORE  , VertexRow3[1], VertexRow4[2], VertexRow5[2], VertexRow6[2], VertexRow5[1], VertexRow4[1]);
  HexRow2[2] = new HexNode(5 , BRICK, VertexRow3[2], VertexRow4[3], VertexRow5[3], VertexRow6[3], VertexRow5[2], VertexRow4[2]);
  HexRow2[3] = new HexNode(10, SHEEP, VertexRow3[3], VertexRow4[4], VertexRow5[4], VertexRow6[4], VertexRow5[3], VertexRow4[3]);

  HexRow3[0] = new HexNode(-1, -1   , VertexRow5[0], VertexRow6[1], VertexRow7[1], VertexRow8[0], VertexRow7[0], VertexRow6[0]);  
  HexRow3[1] = new HexNode(3 , WOOD , VertexRow5[1], VertexRow6[2], VertexRow7[2], VertexRow8[1], VertexRow7[1], VertexRow6[1]);
  HexRow3[2] = new HexNode(11, WHEAT, VertexRow5[2], VertexRow6[3], VertexRow7[3], VertexRow8[2], VertexRow7[2], VertexRow6[2]);
  HexRow3[3] = new HexNode(4 , WOOD , VertexRow5[3], VertexRow6[4], VertexRow7[4], VertexRow8[3], VertexRow7[3], VertexRow6[3]);
  HexRow3[4] = new HexNode(8 , WHEAT, VertexRow5[4], VertexRow6[5], VertexRow7[5], VertexRow8[4], VertexRow7[4], VertexRow6[4]);

  HexRow4[0] = new HexNode(8 , BRICK, VertexRow7[1], VertexRow8[1], VertexRow9[1], VertexRow10[0], VertexRow9[0], VertexRow8[0]);
  HexRow4[1] = new HexNode(10, SHEEP, VertexRow7[2], VertexRow8[2], VertexRow9[2], VertexRow10[1], VertexRow9[1], VertexRow8[1]);
  HexRow4[2] = new HexNode(9 , SHEEP, VertexRow7[3], VertexRow8[3], VertexRow9[3], VertexRow10[2], VertexRow9[2], VertexRow8[2]);
  HexRow4[3] = new HexNode(3 , ORE  , VertexRow7[4], VertexRow8[4], VertexRow9[4], VertexRow10[3], VertexRow9[3], VertexRow8[3]);

  HexRow5[0] = new HexNode(5 , ORE  , VertexRow9[1], VertexRow10[1], VertexRow11[1], VertexRow12[0], VertexRow11[0], VertexRow10[0]);
  HexRow5[1] = new HexNode(2 , SHEEP, VertexRow9[2], VertexRow10[2], VertexRow11[2], VertexRow12[1], VertexRow11[1], VertexRow10[1]);
  HexRow5[2] = new HexNode(6 , WOOD , VertexRow9[3], VertexRow10[3], VertexRow11[3], VertexRow12[2], VertexRow11[2], VertexRow10[2]); 
  
  int k = 0;
  int gap = 88;
  for (int i = 0; i < 3; i++) {
    Hexes[k] = HexRow1[i];
    k++;
    HexRow1[i].xcor = 360 + (i * gap);
    HexRow1[i].ycor = 149;
  }
  for (int i = 0; i < 4; i++) {
    Hexes[k] = HexRow2[i];
    k++;
    HexRow2[i].xcor = 318 + (i * gap);
    HexRow2[i].ycor = 226;
  }
  for (int i = 0; i < 5; i++) {
    Hexes[k] = HexRow3[i];
    k++;
    HexRow3[i].xcor = 273 + (i * gap);
    HexRow3[i].ycor = 301;
  }
  for (int i = 0; i < 4; i++) {
    Hexes[k] = HexRow4[i];
    k++;
    HexRow4[i].xcor = 318 + (i * gap);
    HexRow4[i].ycor = 377;
  }
  for (int i = 0; i < 3; i++) {
    Hexes[k] = HexRow5[i];
    k++;
    HexRow5[i].xcor = 360 + (i * gap);
    HexRow5[i].ycor = 452;
  }
  
  
   
    
}



