(*
This is a simple test file for the simple.ml program. In order to run these
tests follow these steps.

1. open terminal and cd into the folder with simple.ml and simple_tests.ml
2. type
'ocamlfind ocamlc -package oUnit -linkpkg -o simple simple.ml simple_tests.ml'
      *for projects we wil provide you with a makefile which will deal with
       the compilation. this example is too simple to warrant a makefile
       so this is the command to manually compile.
3. this should generate a bunch of files, one of which will be called 'simple'
4. type './simple' into the terminal. this will run the tests.

* you will notice that one of the tests fails. go look at the simple.ml file to
  see what is wrong with the function that fails.
*)

open OUnit2
open Simple

let test_add ctxt =
  assert_equal 15 (add 10 5);
  assert_equal (-5) (add 0 (-5))

let test_minus ctxt =
  assert_equal 5 (minus 10 5);
  assert_equal 0 (minus 5 5)

let suite =
  "tests" >::: [
    "add" >:: test_add;
    "minus" >:: test_minus
  ]

let _ = run_test_tt_main suite
