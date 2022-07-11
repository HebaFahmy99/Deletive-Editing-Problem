deletiveEditing(InitialState,GoalState):-  
	search(InitialState,GoalState).

search([],[_]).
search([_],[]).
search([X],[X]).

getHeuristic([],0,[]):-!.
getHeuristic(_,0,[]):-!. 
getHeuristic([],0,_):-!.

getHeuristic([H|T1],V,[H|T2]):-!,
	getHeuristic(T1,V, T2).

getHeuristic([H1|T1],H,[H2|T2]):- 
	len([H1|T1], L1),
	len([H2|T2], L2),
	equal(L1,L2),
	notEqual(H1,H2),
	getHeuristic(T1,TH,T2),
	H is TH + 1.   
	
getHeuristic([H1|T1],H,[H2|T2]):-
	len([H1|T1], L1),
	len([H2|T2], L2),
	notEqual(L1,L2),
	equal(H1,H2),
	getHeuristic(T1,TH, T2),
	H is TH + 1.

getHeuristic([H1|T1],H,[H2|T2]):-
	len([H1|T1], L1),
	len([H2|T2], L2),
	notEqual(L1,L2),
	notEqual(H1,H2),
	getHeuristic(T1,TH, T2),
	H is TH + 2 . 
	

move(State,Goal):-
	getHeuristic(State,H,Goal).

search([HI|TI],[HG|TG]):- 	
	notEqual(HI,HG), 
	indexOf([HI|TI],HI,Index),  
	split_list([HI|TI],Index+1,[HR|TR]), 
	%print([HR|TR]),  
	move([HR|TR],[HG|TG]), 
	search([HR|TR],[HG|TG]).
	
	
search([HR|TR],[HG|TG]):-   	
	equal(HR,HG), 
	count(HG,[HR|TR],Occurance1), 
	count(HG,[HG|TG],Occurance2), 
	equal(Occurance1,Occurance2),
	append([HR],TempList,NewList), 
	indexOf([HR|TR],HR,Index),  
	split_list([HR|TR],Index+1,[HR2|TR2]),  	
	%print([HR2|TR2]),    
	move([HR2|TR2],[HG|TG]), 
	search([HR2|TR2],TG).

search([HR|TR],[HG|TG]):-   	
	equal(HR,HG), 
	count(HG,[HR|TR],Occurance1), 
	count(HG,[HG|TG],Occurance2), 
	(Occurance1 > Occurance2), 
	split_list([HR|TR],1,[HR2|TR2]),  
	move([HR2|TR2],[HG|TG]), 
	search([HR2|TR2],[HG|TG]).

notEqual(H1,H2):- H1\=H2.
equal(H1,H2):- H1 == H2.

len([], LenResult):-
    LenResult is 0.

len([X|Y], LenResult):-
    len(Y, L),
    LenResult is L + 1.

append([],X,X).
append([X|Y],Z,[X|W]) :-
     append(Y,Z,W). 	

indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.

 
count(_, [], 0).
count(X, [X | T], N) :-
  !, count(X, T, N1),
  N is N1 + 1.
count(X, [_ | T], N) :-
  count(X, T, N).
	

split_list([], 0, []).	
split_list([X], 0, [X]).
split_list([H|T], 0, [H|T]).
split_list([_|T], I, Result) :-  
    NewIndex is I-1, 
	split_list(T, NewIndex, Result).