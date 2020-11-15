:- use_module(library(clpfd)).
:- use_module(library(apply)).
:- use_module(library(lists)).

/*Board is a list used to place all number structs*/
Board = [1,2].

/*fillBoard creates members in board, these members are number structs*/
fillBoard([Value|RestOfList], pos):-
    member(number(Value, pos, connections, group), Board),
    fillBoard(RestOfList, pos+1).

/*Slantlist must have slants in the correct location. find a way to set slants.*/

SlantList = [1].

check(Board, pos, pos1, pos2, pos3):- posx is pos+1,
/* all cheks, need to set slantvalue S according to check result*/

member(slant(S), SlantList),
check(Board, posx, posx+1, posx+sizex+1, posx+sizex+2).



/*The slant elements cannot be X in list, must be "/" or "\".*/
%allSlantsSet([H|T]):- (H = 'fs','bs'), allSlantsSet(T).

fillBoard([-1,-1,1,1,-1,0,2,-1,-1,-1,-1,1,-1,2,-1,-1,-1,-1,-1,2,-1,0,2,-1,-1]).

change([V1|[P1|[C1|G1]]],[V2|[P2|[C2|G2]]]):- 
    C1 is C1 + 1,
    C2 is C2 + 1.

check0([V1|T1],[V2|T2],[V3|T3],[V4|T4]):-
    V1 #= 0 -> change([V2|T2],[V3|T3]),
    V1 #= 0 -> change([V1|T1],[V4|T4]),
    V1 #= 0 -> change([V1|T1],[V4|T4]),
    V1 #= 0 -> change([V2|T2],[V3|T3]).
% Num[Value, Position, Connections, Group]
Liste=[[0,1,0,a],[1,2,0,a],[1,3,0,a],[5,4,0,a]].

run:- check0(Liste).