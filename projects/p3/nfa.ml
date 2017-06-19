(* CMSC 330 / Spring 2017 / Project 4 *)
(* Name: ?? *)

type transition = int * char option * int
type stats = {num_states : int; num_finals : int; outgoing_counts : (int * int) list}

let get_next_gen () =
  let x = ref 0 in
  (fun () -> let r = !x in x := !x + 1; r)

let next = get_next_gen ()

(* YOUR CODE BEGINS HERE *)

type nfa_t = bool (* Must put your own type here! *)

let make_nfa ss fs ts = failwith "Unimplemented"

let e_closure m l = failwith "Unimplemented"

let move m l c = failwith "Unimplemented"

let accept m s = failwith "Unimplemented"

let stats m = failwith "Unimplemented"

let get_start m = failwith "Does not need to be implemented - see doc"
let get_finals m = failwith "Does not need to be implemented - see doc"
let get_transitions m = failwith "Does not need to be implemented - see doc"
