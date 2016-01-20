SETTLERS OF CATAN

by Oliver Ball, Yimin Wang and Al Gilardi
of the illustrious Period 10 


What is it? 
A recreation of the popular board game Settlers of Catan, 'The game of our generation." It can be played by 2 to 4 players, together on the same screen. 


How do you use it?
After you start it, you will be prompted to input the number of players. The board and starting settlements and roads are set up automatically. The top of the screen displays the player whose turn it currently is. To the left of that is the dice roll of the current turn. Resources are automatically allocated after each automatic dice roll at the beginning of each turn. If the dice roll is a 7, the player will be prompted to move the robber. The resources of each player are displayed on the left, along with their victory points. The actions a player can take on his turn are displayed on the lower right. Clicking these will allow the player whose turn it is to perform these actions, given that they meet the requirements. The building requirements are conveniently displayed at the bottom of the screen. 

To build a road, click on the "Build Road" button. The "Build Road Start" boolean in the lower left corner will become true, indicating that you must click on the starting location of the road. The starting location must be at the end of one of your own preexisting roads. The boolean will change, and "Build Road End" will display true, indicating that you should indicate the ending location of the road by clicking on a point that is one away from the start. .

To build a settlement, click on the "Build a settlement" button. The "Building Settlement" boolean in the lower left corner will become true, indicating that you must click on the location you want to build the Settlement. You cannot build a settlement if there is a settlement already there or one vertex away. If you don't want to build a settlement, or you did not realize that there are no valid locations for you to do so, click on "Build a settlement" again and you will have your resources refunded.

To build a city, click on the "Build a city" button. The "Building City" boolean in the lower left corner will become true, indication that you must click on the location you want a city. You must select a location that has one of your settlements on it. It will be upgraded to a city. If you don't want to build a city, or you did not realize that there are no valid locations for you to do so, click on "Build a city" again and you will have your resources refunded.

To trade with other players, use the set of arrows. The upper set of arrows indicate what you are going to give to the other person, and the bottom set of arrows indicate what the other person is going to give you. The colors indicate the individual resources: Dark Green is WOOD, Brown is Brick, Light Green is SHEEP, Yellow is WHEAT, and Grey is ORE. The black arrow in the middle allows you to change which player you want to trade with. Once both players have agreed to the trade, press the "Trade" button and the resources will be traded. If you have selected too many resources to trade, then no trade will happen.

To end the turn, press the "End Turn" button on the top right and the turn will end and the next player's turn will begin.


What concepts from this semester have been used?
The board is constructed of two different types of nodes, VertexNodes and HexNodes, that link to each other in multiple ways to allow for different types of communication between nodes.


What bugs/problems are there?
On the trade counters, one can easily increase the number of resources traded beyond the number they actually have. But in this case, the trade will not happen.

There are some problems with building roads, mainly that they could hypothetically be built anywhere, if someone were to blatantly disregard the rules in such a manner. In certain cases, when a player constructs two roads very close together, the road in between them will automatically be created as well. 

The problems with roads also result in an ability to illegally place settlements/cities, as the placement of those are based on the presence of a road. 




	