man(jim).
man(mary).
mortal(X) :- man(X).
likes(X, A) :- man(X), dog(A).

dog(rex).
dog(lassie).

hates(X, Y) :- cat(X), dog(Y).
chases(Y, X) :- dog(Y), cat(X).

cat(mimi).
cat(momo).