(*
 * Discussion 04 - Higher Order Functions
 *)


(*************** Review of Lists ***************)

(*
 * get_last l : 'a option list -> 'a option
 *    Get the last element of list l
 *)
let rec get_last l = match l with
  |[] -> None
  |[h] -> Some h
  |_::t -> get_last t
;;

(*
 * append l n : 'a list -> 'a list -> 'a list
 *     Appends n to the end of list l
 *)
let rec append l n = match l with
  |[] -> n
  |h::t -> h::(append t n)
;;

(*
 * reverse l : 'a list -> 'a list
 *    Reverse a list (there are many ways to do this)
 *)
let rec reverse l = match l with
  |[] -> []
  |h::t -> let reversed = reverse t in append reversed [h]
;;

let rec reverse l =
  let rec aux acc ls = match ls with
    |[] -> acc
    |h::t -> aux (h::acc) t in aux [] l
;;

(*
 * is_palindrome l : 'a list -> bool
 *    Return true if l is a palindrome
 *)
let rec is_palindrome l = (l = reverse l);;


(*************** Using Tuples ***************)

(*
 * We can use tuples to represent edges in a graph
 * For example, (1,2) is an edge from node 1 to node 2
 * By creating a (int * int) list we can represent a graph
 *)

(*
 * tup_dests g n : (int * int) list -> int -> int list
 *    Return a list of all the nodes that n has an edge to
 *)
let rec tup_dests g n = match g with
  |[] -> []
  |(a,b)::t -> if a = n then b::tup_dests t n else tup_dests t n
;;

(*
 * tup_source g n : (int * int) list -> int -> int list
 *    Return a list of all the nodes that have an edge to n
 *)
 let rec tup_source g n = match g with
  |[] -> []
  |(a,b)::t -> if b = n then a::tup_source t n else tup_source t n
;;

(*
 * Example of how to use this
 *)
tup_dests [(1,2);(1,3);(2,3)] 1;;
tup_source [(1,2);(1,3);(2,3)] 3;;


(*************** Using Records ***************)

type edge = { src: int; dst: int };;

(*
 * dests g n : edge list -> int -> int list
 *    Return a list of all the nodes that n has an edge to
 *)
let rec dests g n = match g with
  |[] -> []
  |h::t -> if h.src = n then h.dst::(dests t n) else dests t n
;;

(*
 * source g n : edge list -> int -> int list
 *    Return a list of all the nodes that have an edge to n
 *)
let rec source g n = match g with
  |[] -> []
  |h::t -> if h.dst = n then h.src::(source t n) else source t n
;;

(*
 * Example of how to use this
 *)
 let e1 = { src = 1; dst = 2 };;
 let e2 = { src = 1; dst = 3 };;
 let e3 = { src = 2; dst = 3 };;

 dests [e1;e2;e3] 1;;
 source [e1;e2;e3] 3;;


(*************** Using Map ***************)

(*
 * map f l : ('a -> 'b) -> 'a list -> 'b list
 *    Implement map as taught in class.
 *    Map applies a function to every element of a list
 *)
let rec map f l = match l with
  |[] -> []
  |h::t -> (f h)::(map f t)
;;

(*
 * double l : 'a list -> 'a list
 *    Double every element of a list
 *)
let double l = map (fun a -> a*2) l;;

(*
 * is_even l : int list -> bool list
 *    Replace even elements with true odd elements with false
 *)
let is_even l = map (fun a -> if a mod 2 = 0 then true else false) l;;

(*
 * is_factor l : int list -> bool list
 *    If an element is a factor of the last element, then true
 *    If an element is not a factor of the last element, then false
 * e.g. [1;2;4;7;14;28] = [true;true;true;true;true;true]
 * e.g. [1;2;3;4;5] = [true;false;false;false;true]
 *)
let is_factor l =
  let last = match get_last l with
    | None -> 0
    | Some l -> l
  in
  map (fun a -> if last mod a = 0 then true else false) l
;;


(*************** Using Fold ***************)

(*
 * fold f a l -> ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a
 *    Implement fold as taught in class
 *      - f: Takes the accumulator and head of the list
 *      - a: The accumulator
 *      - l: The list
 *)
let rec fold f a l = match l with
  |[] -> a
  |h::t -> fold f (f a h) t
;;

(*
 * sum l : 'int list -> int
 *    Return the sum of all the elements in a list
 *)
let sum l = fold (fun a h -> a + h) 0 [1;2;3];;

(*
 * length l : 'a list -> int
 *    Return the length of l
 *)
let length l = fold (fun a h -> 1 + a) 0 l;;

(*
 * contains l ele : 'a list -> 'a -> bool
 *    Return true if l contains ele
 *)
let contains l ele = fold (fun a h -> if h = ele then true else a || false) false l;;

(*
 * Reverse a list (again)
 *)
let reverse l = fold (fun a h -> h::a) [] l;;
