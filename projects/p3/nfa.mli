(* IMPORTANT: YOU MAY NOT MODIFY THIS FILE!
 * OUR TESTS USE THE ORIGINAL VERSION.
 * YOUR CODE WILL NOT COMPILE IF YOU CHANGE THIS FILE. *)

(* The nfa type is opaque to the end-user, as you must make your own implementation choice *)
type nfa_t
type transition = int * char option * int
type stats = {num_states : int; num_finals : int; outgoing_counts : (int * int) list}

val next : unit -> int

(* These are the signatures of functions you must implement *)
val make_nfa : int -> int list -> transition list -> nfa_t
val e_closure : nfa_t -> int list -> int list
val move : nfa_t -> int list -> char -> int list
val accept : nfa_t -> string -> bool
val stats : nfa_t -> stats

(* These do not need to be implemented, but will need to be to use the graphviz integration *)
val get_start : nfa_t -> int
val get_finals : nfa_t -> int list
val get_transitions : nfa_t -> transition list
