%  Code for generating successor states for 8-puzzle
% move(CurrentSate, NewState)

% 8-puzzle state represented by a list of 9 co-ordinates as shown below

move( [E | Tiles] , [T| Tiles1] ):-
	swap( E , T , Tiles , Tiles1 ) .

swap( E , T , [T | Ts] , [E | Ts] ):-
	mandist( E , T , 1 ) .

swap( E , T , [T1 | Ts] , [T1 | Ts1] ):-
	swap( E , T , Ts , Ts1 ).

mandist( (X,Y) , (X1,Y1) , D ):-
	diff( X , X1 , Dx ) ,
	diff( Y , Y1 , Dy ) ,
	D is Dx + Dy .

diff( A , B , D ):-
    D is A - B , D > 0 , !
	;
	D is B - A .

% Some sample staring states with varying number of steps away from
% the goal state
% State = [t0, t1, t2, t3, t4, t5, t6, t7, t8]

%depth 4
start4( [(2,2), (1,1), (3,2), (2,1), (3,1), (3,3), (2,3), (1,3), (1,2)] ).

%depth 5
start5( [(2,3), (1,2), (1,1), (3,1), (3,2), (3,3), (2,2), (1,3), (2,1)] ).

%depth 6
start6( [(1,3), (1,2), (1,1), (3,1), (3,2), (3,3), (2,2), (2,3), (2,1)] ).

%depth 7
start7( [(1,2), (1,3), (1,1), (3,1), (3,2), (3,3), (2,2), (2,3), (2,1)] ).

%depth 8
start8( [(2,2), (1,3), (1,1), (3,1), (3,2), (3,3), (1,2), (2,3), (2,1)] ).

%depth 18
start18( [(2,2), (2,1), (1,1), (3,3), (1,2), (2,3), (3,1), (1,3), (3,2)]).

goal([(2,2),(1,1),(2,1),(3,1),(3,2),(3,3),(2,3),(1,3),(1,2)]).

id_solve(X, D, Sol) :-
	id_dfs(X, [], D, Sol).

id_solve(X, D, Sol) :-
	D1 is D-1,
	id_dfs(X, [], D1, Sol).

id_dfs(X, P, D, [X|P]) :-
	goal(X).

id_dfs(X, P, D, Sol) :-
	D > 0,
	move(X,Y),
	D1 is D-1,
	not(member(Y,P)),
	id_dfs(Y,[X|P], D1, Sol).

dfs :-
        write('Start at depth 4 5 6 7 8 or 18 ? : '),
        read(I),
        write(I),
        start(I, State),
        id_solve(State, I, Sol),
        reverse(Sol, Soln),
        nl,
        showPath(Soln).

showPath( [] ) .
showPath( [P | L] ) :-
	showState( P ),
    nl, write('---'),
    showPath( L ).
	

showState([P0, P1, P2, P3, P4, P5, P6, P7, P8]) :-
	member( Y , [1, 2, 3] ),
	nl,
	member( X , [1, 2, 3] ), 
	member( Tile-(X,Y),
 	        [' '-P0, 1-P1, 2-P2, 3-P3, 4-P4, 5-P5, 6-P6, 7-P7, 8-P8] ) ,
	write(' '), write( Tile ) ,
	fail 
	;
	nl, true .


% predicate to help you choose a starting state with
% solution at different depths
start( I , X ) :-
 I == 4 , start4( X ) , !
;
 I == 5 , start5( X ) , !
;
 I == 6 , start6( X ) , !
;
 I == 7 , start7( X ) , !
;
 I == 8 , start8( X ) , !
;
 I == 18, start18( X ).
