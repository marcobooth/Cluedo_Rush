femme(anne).
femme(betty).
femme(lisa).
femme(sylvie).
femme(eve).
femme(julie).
femme(valerie).

homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(jacques).
homme(herve).
homme(paul).

femme_de(anne, marc).
femme_de(betty, luc).
femme_de(lisa, jules).
femme_de(sylvie, leon).
femme_de(eve, loic).
femme_de(julie, paul).

enfant_de(marc, jean).
enfant_de(marc, jules).
enfant_de(marc, leon).
enfant_de(luc, lisa).
enfant_de(luc, loic).
enfant_de(luc, gerard).
enfant_de(loic, paul).
enfant_de(loic, valerie).
enfant_de(leon, julie).
enfant_de(leon, herve).
enfant_de(jules, jacques).

enfant_de(anne, jean).
enfant_de(anne, jules).
enfant_de(anne, leon).
enfant_de(betty, lisa).
enfant_de(betty, loic).
enfant_de(betty, gerard).
enfant_de(eve, paul).
enfant_de(eve, valerie).
enfant_de(sylvie, julie).
enfant_de(sylvie, herve).
enfant_de(lisa, jacques).

mari_de(X,Y) :- femme_de(Y,X).

mariage(X,Y) :- femme_de(X,Y) ; mari_de(X,Y).

beaupere_de(X,Z) :- homme(X), enfant_de(X,Y), mariage(Y,Z).
bellemere_de(X,Z) :- femme(X), enfant_de(X,Y), mariage(Y,Z).

ancetre_de(X,Y) :- enfant_de(X,Y).
ancetre_de(Ancestor,Descendant) :- enfant_de(Ancestor,Middle), ancetre_de(Middle,Descendant).