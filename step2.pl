/* h(color, nationality, drink, cigar, animal) */
write_rec(P) :-
	P = [];
    P = [Head|Tail],
	    nl, write(Head), nl,
	    write_rec(Tail).
	

execute :-
	houses(Hs),
	member(h(Nationality,fish,_,_,_), Hs),
	nl, write('The person who owns the fish is '),
	write(Nationality), write('.'),
	nl, write_rec(Hs), nl.

houses(Hs) :-
	length(Hs, 5),                                            
	member(h(english,_,_,_,red), Hs),                         
	member(h(swedish,dog,_,_,_), Hs),                         
	member(h(danish,_,_,tea,_), Hs),
	left(h(_,_,_,_,green), h(_,_,_,_,white), Hs),
	member(h(_,_,_,coffee,green), Hs),                         
	member(h(_,birds,pallmall,_,_), Hs),                                   
	member(h(_,_,dunhill,_,yellow), Hs),                         
	Hs = [_,_,h(_,_,_,milk,_),_,_],
	Hs = [h(norwegian,_,_,_,_)|_], 
	next(h(_,_,blend,_,_), h(_,cats,_,_,_), Hs),        
	next(h(_,_,dunhill,_,_), h(_,horse,_,_,_), Hs),              
	member(h(_,_,bluemaster,beer,_), Hs),                         
	member(h(german,_,prince,_,_), Hs),                       
	next(h(norwegian,_,_,_,_), h(_,_,_,_,blue), Hs),
	next(h(_,_,blend,_,_), h(_,_,_,water,_), Hs),     
	member(h(_,fish,_,_,_), Hs).		

next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).
left(A, B, Ls) :- append(_, [A,B|_], Ls).