# OCaml
June 7, 2017

## Administrative
- Project 1 due Friday
- Quiz today on Ruby

## OCaml Review

### PL Concepts

OCaml is a functional, statically typed, explicitly declared language
```ocaml
(* We have to explicitly declare variables using 'let' *)
(* Notice that we don't have to specify the type *)
let x = 1;;
let y = "Hello, World";;
let z = [1.0; 2.0; 3.0];;
```

### Types

Everything in OCaml has a type
```ocaml
(* int, float, string *)
1;;
1.0;;
"Hello";;

(* int list, float list, string list *)
[1; 2; 3];;
[1.0; 2.0; 3.0];;
["H"; "E"; "L"; "L"; "O"];;

(* int list list *)
[[1; 2; 3]; [4; 5; 6]];;
```

### Lists

OCaml lists can only contain one type
```ocaml
(* good *)
[1; 2; 3];;

(* not good *)
[1; 2; 3.0];;
```

Lists are added to using colons
```ocaml
(* This creates a list equal to [1] *)
(* You will use this operator a lot in your code *)
1::[];;
```

OCaml lists are linked lists; you cannot index them. Every list has a head and a reference to a tail. This means there is only one way to work with them: RECURSION.
```ocaml
(* Told you :: was useful *)
let rec addToEnd v l = match l with
  |[] -> [v]
  |h::t -> h::(addToEnd v t)
;;
```

### Functions

OCaml functions are created like variables
```ocaml
(* Creating a variable *)
let varName = 0;

(* Creating a function *)
let functionName param1 param2 = param1 + param2;;

(* Creating a recursive function *)
let rec recName p1 = if (p1 = 0) then 0 else 1 + recName (p1 - 1);;
```

OCaml functions also have types
```ocaml
(* The function below has the following type. Why? *)
(* int -> int -> int *)
let functionName param1 param2 = param1 + param2;;

(* Why is this functions type different? *)
(* float -> float -> float *)
let functionName param1 param2 = param1 +. param2;;

(* What even is a 'a? *)
(* 'a -> 'a -> bool *)
let equal a b = if (a = b) then true else false;;
```

You'll see more of this next week

### Pattern Matching

OCaml has a feature that allows you to match data by structure
```ocaml
(* Match parameter x with an empty list and return 0 *)
let f x y = match x with [] -> 0
```

You'll primarily be matching on lists, and there are some important match structures to know.
```ocaml
let f lst = match lst with
  |[] -> (* matches an empty list *)
  |[h] -> (* matches the last, or only, element of a list *)
  |h::[] -> (* matches the last, or only, element of a list *)
  |h1::h2::t -> (* matches the first two elements *)
  |h::_ -> (* matches the head and discards the tail *)
  |_::t -> (* discards the head and matches the tail *)
;;
```

## Putting It All Together
```ocaml
(* A function that takes two ints and adds them together *)
let add a b = a + b;;

(* A function that takes two parameters and checks if they are equal *)
let equal a b = if a = b then true else false;;

(* A function that returns every other element of a list *)
let rec everyOther lst = match lst with
  |[] -> []
  |[h] -> [h]
  |h1::h2::tail -> h1::(everyOther tail)
;;

(* A function the returns every other even element of a list *)
let rec everyOtherEven lst = match lst with
  |[] -> []
  |[_] -> []
  |h1::h2::tail -> h2::(everyOtherEven tail)
;;

(* Returns true if the list contains the passed in element *)
let rec contains lst ele = match lst with
  |[] -> false
  |h::t -> if h = ele then true else contains t ele
;;
```
