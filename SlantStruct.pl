
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

% Write Output  
writeFullOutput(S, X, Y,P):- write('puzzles '),write(P),nl, write('size '), write(X), write('x'), write(Y), nl, writeOutput(S).

writeOutput([]).
writeOutput([E|R]):- writeLine(E), writeOutput(R).

writeLine([]):- nl.
writeLine([E|R]):- write(' '), translate(E,X) ,write(X), writeLine(R).
translate(32, '_').

translate(X,X).
run:- E = 
[
[1 , _, _, _, _],
[x ,x ,x ,x],
[_ ,2 ,1 ,_ ,1],
[x ,x ,x ,x],
[0 ,3 ,_ ,2 ,_],
[x ,x ,x ,x],
[1 ,1 ,3 ,_ ,1],
[x ,x ,x ,x],
[_ ,_ ,1 ,_ ,1]], writeFullOutput(E,2,3,2).