:- use_module(library(apply)).
:- use_module(library(lists)).


addConnection([V1|[P1|[C1|G1]]],[V2|[P2|[C2|G2]]],[V1|[P1|[C1New|G1]]],[V2|[P2|[C2New|G2]]]):- 
    write('so far so good '), write(V1),
    C1New is C1 + 1,
    C2New is C2 + 1.

% **** replaceP(pos, new_variable, list, new_list) *****
replaceP(_, _, [], []).
replaceP(O, R, [O|T], [R|T2]) :- replaceP(O, R, T, T2).
replaceP(O, R, [H|T], [H|T2]) :- dif(H,O), replaceP(O, R, T, T2).

%megaChecker(Liste, Start, X):- check0():-.


check0(Start,Xwidth,List,NewList):-
    N1 is Start, N2 is Start+1, N3 is Start+Xwidth, N4 is Start+1+Xwidth,
    nth0(N1,List,[V1|T1]), 
    nth0(N2,List,[V2|T2]),
    nth0(N3,List,[V3|T3]), 
    nth0(N4,List,[V4|T4]),
        write('Write it: '),write(V1),write(V2),write(V3),write(V4), nl,
        V1 == 0 -> addConnection([V2|T2],[V3|T3],New2,New3), replaceP(N2,New2,List,NewList), replaceP(N3,New3,List,NewList);
        V4 == 0 -> addConnection([V2|T2],[V3|T3],New2,New3), replaceP(N2,New2,List,NewList), replaceP(N3,New3,List,NewList);
        V2 == 0 -> addConnection([V1|T1],[V4|T4],New1,New4), replaceP(N1,New1,List,NewList), replaceP(N4,New4,List,NewList);
        V3 == 0 -> addConnection([V1|T1],[V4|T4],New1,New4), replaceP(N1,New1,List,NewList), replaceP(N4,New4,List,NewList);
        (Start+1 mod Xwidth) == 0 -> check0(Start+2,Xwidth,NewList,NewList);
        check0(Start+1,Xwidth,NewList,NewList).

                                                        %     start, width,list 
run:- List=[ [0,1,0,a], [0,2,0,b], [1,3,0,c], [-1,4,0,d] ], check0(0,2,List,NewList).
