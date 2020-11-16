:- use_module(library(clpfd)).
:- use_module(library(apply)).
:- use_module(library(lists)).

/*Board is a list used to place all number structs*/
%Board = [1,2].

/*fillBoard creates members in board, these members are number structs
fillBoard([Value|RestOfList], pos):-
    member(number(Value, pos, connections, group), Board),
    fillBoard(RestOfList, pos+1).

Slantlist must have slants in the correct location. find a way to set slants.*/

%SlantList = [1].

check(Board, pos, pos1, pos2, pos3):- posx is pos+1,
/* all cheks, need to set slantvalue S according to check result*/

%member(slant(S), SlantList),
check(Board, posx, posx+1, posx+sizex+1, posx+sizex+2).



/*The slant elements cannot be X in list, must be "/" or "\".*/
%allSlantsSet([H|T]):- (H = 'fs','bs'), allSlantsSet(T).

fillBoard([-1,-1,1,1,-1,0,2,-1,-1,-1,-1,1,-1,2,-1,-1,-1,-1,-1,2,-1,0,2,-1,-1]).

addConnection([V1|[P1|[C1|G1]]],[V2|[P2|[C2|G2]]],C1New,C2New):- 
    write('Connection1: '), write(C1), nl,
    C1New #= C1 + 1,
    C2New #= C2 + 1,
    write('Connection1_new: '), write(C1New), nl.

% replaceP(pos, new_variable, list, new_list)
replaceP(_, _, [], []).
replaceP(O, R, [O|T], [R|T2]) :- replaceP(O, R, T, T2).
replaceP(O, R, [H|T], [H|T2]) :- dif(H,O), replaceP(O, R, T, T2).


%megaChecker(Liste, Start, X):- check0().

check0(Start,List):-
        V1 #= 0; V4 #= 0 -> addConnection(nth0(Start+1,List,[V2|T2]),
                            nth0(Start+1+X,List,[V3|T3]),New2,New3), 
                            replaceP(Start+1,New2,List,NewList), 
                            replaceP(Start+1+X,New3,List,NewList);
        V2 #= 0; V3 #= 0 -> addConnection(nth0(Start,List,[V1|T1]),
                            nth0(Start+2+X,List,[V4|T4]),New1,New4), 
                            replaceP(Start,New1,List,NewList), 
                            replaceP(Start+2+X,New4,List,NewList),
        check0(Start+1,NewList).


/*
check0([[V1|T1],[V2|T2],[V3|T3],[V4|T4]]):-
    V1 #= 0 -> addConnection([V2|T2],[V3|T3]),
    V2 #= 0 -> addConnection([V1|T1],[V4|T4]),
    V3 #= 0 -> addConnection([V1|T1],[V4|T4]),
    V4 #= 0 -> addConnection([V2|T2],[V3|T3]).
*/
/* Num[Value, Position, Connections, Group] */


run:- List=[[0,1,X,a],[0,2,X,b],[1,3,X,c],[-1,4,X,d]], check0(0,List), write(NewList).