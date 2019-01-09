%% task 1
person(Name, age, gender, fitness_level).

eligble(Name):-	fitness_level(excellent),
				age(A),
				A @> 17:
				A @< 33.
				
eligble(Name):-	fitness_level(good),
				drinks(alcohol, not_at_all);
				drinks(alcohol, moderately),
				drives(name, carType).
				
eligble(Name):-	isImportant(fatherName).

%% task 2
canGoFromTo(A, B) :-	bicycleLane(A, B).
canGoFromTo(A, B) :-	bicycleLane(A, C),
						canGoFromTo(C, B).


canGoFromTo(A, B) :-	moped(A, B).
canGoFromTo(A, B) :-	bicycleLane(A, C),
						canGoFromTo(C, B).

bicycleLane(dublin, kilkenny).
bicycleLane(dublin, carlow).
bicycleLane(kilkenny, waterford).
bicycleLane(mallow, carlow).
bicycleLane(cork, mallow).
bicycleLane(waterford, youghal).
bicycleLane(youghal, cork).
bicycleLane(dublin, athlone).
bicycleLane(athlone, limerick).
bicycleLane(limerick, cork).
moped(dublin, galway).
moped(galway, limerick).
moped(limerick, ennis).
moped(limerick, cork).

% possible to get from dublin to cork, there are 3 ways
% not possible to get from carlow to limerick

%% task 3
canGoFromTo(A, B, Distance) :- bicycleLane(A, B, Distance).
canGoFromTo(A, B, Total) :- bicycleLane(A, C, T1),
		canGoFromTo(C, B, T2),
		Total is T1 + T2.
		
canGoFromTo(A, B, Distance) :- moped(A, B, Distance).
canGoFromTo(A, B, Total) :- moped(A, C, T1),
		canGoFromTo(C, B, T2),
		Total is T1 + T2.

bicycleLane(dublin, kilkenny, 120).
bicycleLane(dublin, carlow, 80).
bicycleLane(kilkenny, waterford, 85).
bicycleLane(mallow, carlow, 110).
bicycleLane(cork, mallow, 38).
bicycleLane(waterford, youghal, 110).
bicycleLane(youghal, cork, 30).
bicycleLane(dublin, athlone, 105).
bicycleLane(athlone, limerick, 135).
bicycleLane(limerick, cork, 75).
moped(dublin, galway, 200).
moped(galway, limerick, 110).
moped(limerick, ennis, 30).
moped(limerick, cork, 95).

%% task 4
canGoFromTo(A, B, Distance, Route) :- bicycleLane(A, B, Distance), Route = [A,B].
canGoFromTo(A, B, Total, [A|Route] ) :- bicycleLane(A, C, T1),
		canGoFromTo(C, B, T2, Route),
		Total is T1 + T2.

%% task 5
% add a number to all numbers of list
addTo(X, [], Lnew).
addTo(X, [], []).
addTo(X,[H | T], [Y | Lnew]):-	Y is H + X,
								addTo(X, T, Lnew).
								
% remove all a specific element from list								
removeAll(X, [], []).
removeAll(X, [E1 | T], Lnew):-	E1 = X, removeAll(T, Lnew).
removeAll(X, [H | T1], [H | T2]):-	H \= X, removeAll(T1, T2).

%
freq(X, [], N).
freq(X, [H | T], N):-	X is H, N + 1, freq(X, T, N).	
freq(X, [H1 | T], N):-	X is not H, freq(X, T, N).


% find maximum of list
listMax([H | T], X):-	listMax(T, H, X).
listMax([], X, X).
listMax([H | T], X0, X):-	X1 is max(H, X0),
							listMax(T, X1, X).
							
% 
makePairs([], L2).
makePairs([H | T], [Y | L2]):-	

% 
mergeLists([], [], []).
mergeLists([H1 | T1], [H2 | T2], [H1,H2 | T]):-	mergeLists(T1, T2, T).

							
