class Building{
  
  int buildingNumber;
  int playerNumber;
  
  Building( int p ) {
    buildingNumber = 1;
    playerNumber = p;
  }
  
  void upgrade() {
    buildingNumber++;
  }  
  
  boolean isCity(){
    if (buildingNumber == 1){
      return false;
    }
    else{
      return true;
    }
  }
  
}
