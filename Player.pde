class Player {
  int[] resources;
  int[] developments; //may convert to arraylist
  int availableRoads;
  int playerNumber;
  int totalResources;
  int victoryPoints;



  Player (int num){
   resources = new int[5];
     for (int i = 0 ; i < resources.length ; i++)
       resources[i] = 0;
   availableRoads = 15; // change to 13 if initial roads are not selectable
   playerNumber = num;
   victoryPoints = 0;
  }
  


  int totalCards(){
    int total = 0;
    for (int i = 0 ; i < resources.length ; i++)
       total += resources[i];
    return total;
  }

  void stealFrom(Player p){
      boolean hasStolen = false;
      while (!hasStolen){
        int selectedResource = (int)random(5);
        if (p.resources[selectedResource] > 0){
             p.resources[selectedResource]--;
             this.resources[selectedResource]++;
             hasStolen = true;
        }
      }
   }

  void trade( int[] mine, int[] his , Player dota2){
    resources[0] = resources[0] - mine[0] + his[0];
    dota2.resources[0] = dota2.resources[0] - his[0] + mine[0];
    resources[1] = resources[1] - mine[1] + his[1];
    dota2.resources[1] = dota2.resources[1] - his[1] + mine[1];
    resources[2] = resources[2] - mine[2] + his[2];
    dota2.resources[2] = dota2.resources[2] - his[2] + mine[2];
    resources[3] = resources[3] - mine[3] + his[3];
    dota2.resources[3] = dota2.resources[3] - his[3] + mine[3];
    resources[4] = resources[4] - mine[4] + his[4];
    dota2.resources[4] = dota2.resources[4] - his[4] + mine[4];
  }


  int[] getAllCards(){
    int[] allCards = new int[totalCards()];
      
      int i = 0;
      int j = 0;
      
      while (j < getWood()){
         allCards[i] = WOOD;
        j++;
        i++; 
      }
      j = 0;
      while (j < getWheat()){
        allCards[i] = WHEAT;
        j++;
        i++;
      }
      j = 0;
      while (j < getSheep()){
         allCards[i] = SHEEP;
        j++;
        i++; 
      }
      while (j < getBrick()){
         allCards[i] = BRICK;
        j++;
        i++; 
      }
      while (j < getOre()){
         allCards[i] = ORE;
        j++;
        i++; 
      }
      
    return allCards;
  }

  int getWheat(){
    return resources[WHEAT]; 
  }
  
  void alAlone(){
    for (int i = 0; i < 1000; i++) 
      stroke(1);
  }
  
  int getSheep(){
     return resources[SHEEP]; 
  }

  int getBrick(){
     return resources[BRICK]; 
  }

  int getWood(){
      return resources[WOOD]; 
  }
  
  int getOre(){
     return resources[ORE]; 
  }

  void addWheat(){
    resources[WHEAT]++; 
  }

  void addSheep(){
    resources[SHEEP]++;
  }

  void addBrick(){
    resources[BRICK]++;
  }

  void addWood(){
    resources[WOOD]++;
  }

  void addOre(){
    resources[ORE]++;   
  }

  //BUILD METHODS ARE INCOMPLETE, NEED IMPLEMENTATION OF BOARD AND BUILDINGS FIRST

  void buildRoad(){
     resources[WOOD]--;
     resources[BRICK]--; 
  }

  void buildSettlement(){
    Building b = new Building(playerNumber);
    resources[WOOD]--;
    resources[BRICK]--;
    resources[SHEEP]--;
    resources[WHEAT]--;
  }
  
  void buildCity(){
    resources[WHEAT] -= 2;
    resources[ORE] -= 3;
  }
  
  void buildDevelopmentCard() {
    resources[SHEEP]--;
    resources[WHEAT]--;
    resources[ORE]--;
  }
}
