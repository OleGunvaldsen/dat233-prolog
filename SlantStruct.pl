
/*Board is a list used to place all number structs*/
Board = [].

/*fillBoard creates members in board, these members are number structs*/
fillBoard([Value|RestOfList], pos):- 
    member(number(Value, pos, connections, group), Board),
    fillBoard(RestOfList, pos+1).

/*Slantlist must have slants in the correct location. find a way to set slants.*/

SlantList = [].


check(Board, pos, pos1, pos2, pos3):- posx is pos+1,
/* all cheks, need to set slantvalue S according to check result*/

member(slant(S), SlantList),
check(Board, posx, posx+1, posx+sizex+1, posx+sizex+2).



/*The slant elements cannot be X in list, must be "/" or "\".*/
allSlantsSet([H|T]):- H = "\\", "/", allSlantsSet(T).



