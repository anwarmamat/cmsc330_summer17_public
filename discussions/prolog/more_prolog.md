# More Prolog 

**Exercise 1** Suppose we have the following 

```prolog 
p(1).
p(2) :- !. 
p(3).
```

Write all of Prolog's answers to the following queries. 

```prolog
?- P(X). 
?- P(X),p(Y). 
?- P(X),!,P(Y).
```


---
**Exercise 2** First, explain what the following program does. 

```prolog
class(Number,positive)  :-  Number  >  0. 
class(0,zero). 
class(Number,negative)  :-  Number  <  0.
```

Now, improve it by adding green cuts.


---
**Exercise 3** Without using cut, write a predicate split/3 that splits a list of integers into two lists: One containing the positive (and zero) numbers, the other containing the negative numbers. For example:

```prolog 
split([2,5,-2,0,4,-9],P,N).
P = [2,5,0,4].
N = [-2,-9].
```

Now, improve this program using cuts.


---
**Exercise 4** During discussion, we defined a predicate max/3 which would return the max of two numbers. 

First, we found a solution that looked something like this: 

```prolog 
max(X,Y,X) :- X >= Y. 
max(X,Y,Y) :- Y > X.
```

Then, we realized we don't need to use the second rule if the first rule is true, so we used this:

```prolog 
max(X,Y,X) :- X >= Y, !. 
max(X,Y,Y) :- Y > X.
```

However, now `Y > X` is going to be reduntant right? So let's say we rewrote this rule like this: 

```prolog 
max(X,Y,X) :- X >= Y, !. 
max(X,Y,Y).
```

Try using this rule with the following queries:

```prolog
?- max(2,1,M).
?- max(1,2,M). 
?- max(1,1,M). 
?- max(2,1,2).
?- max(2,1,1).
```

You might have notice an error. _Fix the code by only changing the first rule_.


--- 
**Exercise 5** For the following exercises, use the following definition of not 

```prolog 
not(X) :- call(X), !, fail.
not(X).
```

Given the following database

```prolog
jedi(luke).
jedi(vader).
sith(vader). 
```

What is the result of the following queries? 

```prolog 
?- not(sith(luke))
?- not(sith(vader))
?- not(jedi(leia))
?- not(sith(leia)
```

--- 
**Exercise 6** Recall the following 

+ `\+` is the same as `not` 
+ `X \= Y` is the same as `not(X = Y)`
+ `X \== Y` is the same as `not(X == Y)`

Given the following database 

```prolog 
jedi(luke).
jedi(yoda).
help2(X,Y) :- jedi(X), jedi(Y), X \= Y.
help3(X,Y) :- jedi(X), X \= Y, jedi(Y).
help4(X,Y) :- X \= Y, jedi(X), jedi(Y).
```

What is the result of the following queries 

```prolog 
help2(X,Y).
help3(X,luke).
help3(X,Y).
help4(X,Y).
help4(luke,yoda).
```
