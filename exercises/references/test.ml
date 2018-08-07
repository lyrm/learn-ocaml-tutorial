open Test_lib
open Report

(**)
(*let exercise_1 =
  grade_ref [%ty: int] "forty_two" forty_two 42
 *)

let exercise_1 =
  Section ([Text "Ref: "; Code "forty_two"] ,
           test_ref [%ty: int] forty_two 42)
 
  
let exercise_2 =
  grade_ref [%ty: int] "x" x (!y)
   

   
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ; exercise_2 ]
