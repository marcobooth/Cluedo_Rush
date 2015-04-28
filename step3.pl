change(east,west).
change(west,east).

/*
 * move function changes an item from east to west
 * (it is the boat, it always takes the farmer plus something or nothing.
 * the list in east and west, have 4 arguments in this order
 * [farmer, wolf, goat, cabbage]
 * move(L_East, thing, L_West)
 * 
*/ 

move([East,East,Goat,Cabbage],wolf,[West,West,Goat,Cabbage]) :- change(East,West).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :- change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :- change(X,Y).
move([X,Wolf,Goat,Cabbage],nothing,[Y,Wolf,Goat,Cabbage]) :- change(X,Y).

oneeq(X,X,_).
oneeq(X,_,X).

safe([Man,Wolf,Goat,Cabbage]) :-
        oneeq(Man,Goat,Wolf),
        oneeq(Man,Goat,Cabbage).

wgc([east,east,east,east],[]).

wgc(Config,[FirstMove|OtherMoves]) :-
        move(Config,FirstMove,NextConfig),
        safe(NextConfig),
        wgc(NextConfig,OtherMoves).

go :- length(X,7), write('First take :'), wgc([west,west,west,west],X), write_list(X, '\nway/way back :'), !, nl.
