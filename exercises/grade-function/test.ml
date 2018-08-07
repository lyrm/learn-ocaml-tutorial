open Test_lib
open Report

(* The exercise to grade *)
let exercise_1 =
  grade_function_1_against_solution
    [%ty: int -> int] (* Type of the tested function *)
    "identity"        (* identifier of the tested function *)
    ~gen:0            (* number of automatically generated tests *)
    [0]               (* List of tested inputs *)


let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ] (* List of exercises *)
