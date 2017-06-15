(*
 * Discussion 05 - Map, Fold, Variant Types
 *)

(**************************)
(* Review of Map and Fold *)
(**************************)

(* Implement map *)
let rec map f l = failwith "unimplemented :("


(* Implement fold *)
let rec fold f a l = failwith "unimplemented :("


(* Write a function that multiplies every element of a list by n *)
let multiply l n = failwith "unimplemented :("


(* Returns the sum of the squares of every integer in the list *)
let squaresum l = failwith "unimplemented :("


(* Return a list containing true for all even and false for all odd *)
let all_evens l = failwith "unimplemented :("


(* Returns true if all the elements in the list sum to an even number *)
let even_sum l = failwith "unimplemented :("



(**************************************)
(* User Defined Variants - Example 1  *)
(**************************************)
type shape = Square of float | Rectangle of float * float | Circle of float

(* Return the area of the shape *)
let area s = failwith "unimplemented :("

(* Return the sum of the area of all the shapes in the list - Use map or fold *)
let total_area (l:shape list) = failwith "unimplemented :("

(* How to use this *)
let sqr = Square 5.0;;
let rect = Rectangle (3.0,4.0);;
let circ = Circle 1.0;;



(**************************************)
(* User Defined Variants - Example 2  *)
(**************************************)
type 'a linkedlist = Node of ('a * 'a linkedlist) | EndNode

(*
 * insert l x : 'a linkedlist -> 'a -> 'a linkedlist
 *      Inserts x at the end of linkedlist l
 *)
let rec insert l x = failwith "unimplemented :("

(*
 * size l : 'a linkedlist -> int
 *      Returns the size of list l
 *)
let rec size l = failwith "unimplemented :("


(*
 * map f l : ('a -> 'b) -> 'a linkedlist -> 'b linkedlist
 *      Returns the parameter list l with the function f
 *      having been applied to each element
 *)
let rec ll_map f l = failwith "unimplemented :("


(*
 * fold f a l : ('a -> 'b -> 'a) -> 'a -> 'b linkedlist -> 'a
 *      Accumulates the list l with starting value a
 *      using function f
 *)
let rec ll_fold f a l = failwith "unimplemented :("

(*
 * Reverse a linked list - hint: fold and ll_fold are useful
 *)
let rec reverse l = failwith "unimplemented :("

(**************************************)
(* User Defined Variants - For A Card *)
(**************************************)

(*
 * Create a type to represent a card's suit
 * - There are four suits: Hearts, Diamonds, Clubs, Spades
 *)

(* YOUR CODE HERE *)


(*
 * Create a type to represent a card's rank
 * - 0-8  correspond to 2 through 10
 * - 9-12 correspond to Jack, Queen, King, Ace
 *)

(* YOUR CODE HERE *)


(*
 * Create a type to represent the card
 * - A card should be a tuple of its rank and suit, with rank first
 *)

(* YOUR CODE HERE *)


(*
 * Function to determine if a card is valid (rank is between 0 and 12)
 * - Use failwith if the card is invalid
 * - Return the card if it is valid
 *)

(* YOUR CODE HERE *)


(*
 * Function to create a card
 * - Input: The Rank (2 through 14, user does not know our implementation)
 * - Input: The suit
 *)

(* YOUR CODE HERE *)


(*
 * Function that returns a string representation of the rank
 * - Input: The card's rank (NOT the entire card)
 * - Return "J" for Jack, "Q" for Queen, "K" for King, "A" for Ace
 *)

(* YOUR CODE HERE *)


(*
 * Function that returns a string representation of the suit
 * - Input: The card's suit (NOT the entire card)
 *)

(* YOUR CODE HERE *)


(*
 * Function that returns a string representation of the card
 * - Input: A card
 * - Return: <rank> of <suit> (for example, A of Spades)
 *)

(* YOUR CODE HERE *)
