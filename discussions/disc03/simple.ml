(*
THIS ASSUMES YOU ALREADY HAVE OCAML INSTALLED. IF YOU DO NOT, GO TO THE
CLASS WEBSITE FOR INSTALLATION GUIDANCE.

In order to load the functions of this simple ocaml program into top-level
follow these instructions:
1. Open up a terminal
2. cd into the directory with this file (or whatever other program you want)
3. type 'ocaml' (this will open a top level)
4. type '#use "simple.ml";;' (or the name or your program)
		* any command you type will need to end with ';;'
5. you should see the following appear in your terminal:
		val add : int -> int -> int = <fun>
		val minus : int -> int -> int = <fun>
		val mult : int -> int -> int = <fun>
		val div : int -> int -> int = <fun>
		val square : int -> int = <fun>
		val pow : int -> int -> int = <fun>
		val fib : int -> int = <fun>
6. this means that all these functions have successfully loaded into toplevel
and you can now use them. For example, 'add 1 3;;' will result in 'int = 4'
7. you can use this to try out the functions you write manually to see if they
work. you should utilize this as well as OUnit tests to code and debug.
*)

(*Takes in 2 parameters and adds them*)
let add x y = x + y

(*Incorrect minus*)
let minus x y = x + y

(*Takes in 2 parameters and multiplies them*)
let mult x y = x * y

(*Takes in 2 parameters and divides the first by the second*)
let div x y = if y = 0 then -1 else x/y

(*Takes in 1 parameter and squares it*)
let square x = x*x

(*Takes in 2 parameters and returns the result of the first taken
  to the power of the second*)
let pow x y = int_of_float((float_of_int x)**(float_of_int y))

(*Given a number n, finds the nth number in the fibonacci sequence*)
let rec fib n =
  if n < 2 then 1 else fib (n - 1) + fib (n - 2)
