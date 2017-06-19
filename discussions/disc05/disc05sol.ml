(*
 * Discussion 05 - Map, Fold, Variant Types
 *)

(**************************)
(* Review of Map and Fold *)
(**************************)

(* Implement map *)
let rec map f l = match l with
  |[] -> []
  |h::t -> (f h)::(map f t)
;;


(* Implement fold *)
let rec fold f a l = match l with
  |[] -> a
  |h::t -> fold f (f a h) t;
;;


(* Write a function that multiplies every element of a list by n *)
let multiply l n = map (fun h -> n*h) l;;


(* Returns the sum of the squares of every integer in the list *)
let squaresum l = fold (fun a h -> a + h*h) 0 l;;


(* Return a list containing true for all even and false for all odd *)
let all_evens l = map (fun h -> if h mod 2 = 0 then true else false) l;;


(* Returns true if all the elements in the list sum to an even number *)
let even_sum l =
  let sum = fold (fun a h -> a + h) 0 l in
  if sum mod 2 = 0 then true else false;;



(**************************************)
(* User Defined Variants - Example 1  *)
(**************************************)
type shape = Square of float | Rectangle of float * float | Circle of float

(* Return the area of the shape *)
let area s = match s with
  | Square l -> l *. l
  | Rectangle (l,w) -> l *. w
  | Circle r -> 3.14 *. r *. r
;;

(* Return the sum of the area of all the shapes in the list - Use map or fold *)
let total_area (l:shape list) = fold (fun a h -> a +. area h) 0. l;;

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
let rec insert l x = match l with
  | EndNode -> Node (x,EndNode)
  | Node (v, n) -> Node (v, insert n x)
;;

(*
 * size l : 'a linkedlist -> int
 *      Returns the size of list l
 *)
let rec size l = match l with
  | EndNode -> 0
  | Node (n1,n2) -> 1 + size n2
;;


(*
 * map f l : ('a -> 'b) -> 'a linkedlist -> 'b linkedlist
 *      Returns the parameter list l with the function f
 *      having been applied to each element
 *)
let rec ll_map f l = match l with
  | EndNode -> EndNode
  | Node (n1,n2) -> Node ((f n1), ll_map f n2)
;;


(*
 * fold f a l : ('a -> 'b -> 'a) -> 'a -> 'b linkedlist -> 'a
 *      Accumulates the list l with starting value a
 *      using function f
 *)
let rec ll_fold f a l = match l with
  | EndNode -> a
  | Node (n1,n2) -> ll_fold f (f a n1) n2
;;

(*
 * Reverse a linked list - hint: fold and ll_fold are useful
 *)
let rec reverse l =
  let reversed_list = ll_fold (fun a h -> h::a) [] l in
  fold (fun a h -> insert a h) EndNode reversed_list;;

(**************************************)
(* User Defined Variants - For A Card *)
(**************************************)

(*
 * Create a type to represent a card's suit
 * - There are four suits: Hearts, Diamonds, Clubs, Spades
 *)
type suit = Hearts | Diamonds | Clubs | Spades

(*
 * Create a type to represent a card's rank
 * - 0-8  correspond to 2 through 10
 * - 9-12 correspond to Jack, Queen, King, Ace
 *)
type rank = int

(*
 * Create a type to represent the card
 * - A card should be a tuple of its rank and suit, with rank first
 *)
type card = rank * suit

(*
 * Function to determine if a card is valid (rank is between 0 and 12)
 * - Use failwith if the card is invalid
 * - Return the card if it is valid
 *)
let valid_card (card:card) =
  if fst card < 0 || fst card > 12 then
    failwith "Invalid Card"
  else card

(*
 * Function to create a card
 * - Input: The Rank (2 through 14, user does not know our implementation)
 * - Input: The suit
 *)
let create_card r s :card =
  if r >=2 && r <= 14 then (r-2,s) else failwith "Invalid Rank"


(*
 * Function that returns a string representation of the rank
 * - Input: The card's rank (NOT the entire card)
 * - Return "J" for Jack, "Q" for Queen, "K" for King, "A" for Ace
 *)
let rank_to_string (r:rank) = match r with
  |x when x >= 0 && x < 9 -> string_of_int (x+2)
  |9 -> "J"
  |10 -> "Q"
  |11 -> "K"
  |12 -> "A"
  |_ -> failwith "Invalid Rank"

(*
 * Function that returns a string representation of the suit
 * - Input: The card's suit (NOT the entire card)
 *)
 let suit_to_string (s:suit) = match s with
  | Hearts -> "Hearts"
  | Diamonds -> "Diamonds"
  | Clubs -> "Clubs"
  | Spades -> "Spades"

(*
 * Function that returns a string representation of the card
 * - Input: A card
 * - Return: <rank> of <suit> (for example, A of Spades)
 *)
let card_to_string ((r,s):card) = rank_to_string r ^ " of " ^ suit_to_string s
