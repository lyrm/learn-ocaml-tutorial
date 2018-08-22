open Test_lib
open Report

(* Trivial example with grade_variable *)
let exercise_0 =
  grade_variable [%ty: int] "forty_two" 42
  
(* More classical example with grade_variable_against_solution *)
let exercise_1 =
  grade_variable_against_solution [%ty: float] "norm"
  
(* Example with grade_variable_property *)
let exercise_2 =
  grade_variable_property [%ty: side] "s"  
    (
      fun s ->
      match s with
      | Right -> if vect.x > 0. then 
                   [ Message ([ Text "Expected value"] , Success 1) ]
                 else if vect.x = 0. then 
                   [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Middle" ; Text "."] , Informative) ]
                 else
                   [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Left" ; Text "."] , Informative) ]
      | Left -> if vect.x < 0. then 
                  [ Message ([ Text "Expected value"] , Success 1) ]
                else if vect.x = 0. then 
                  [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Middle" ; Text "."] , Informative) ]
                 else
                   [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Right" ; Text "."] , Informative) ]
      | Middle -> if vect.x = 0. then 
                  [ Message ([ Text "Expected value"] , Success 1) ]
                else if vect.x > 0. then 
                  [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Right" ; Text "."] , Informative) ]
                 else
                   [ Message ([ Text "Wrong value"] , Failure) ;
                     Message ([ Text "The answer should "; Code "Left" ; Text "."] , Informative) ]
    )
  
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_0 ; exercise_1 ; exercise_2 ]
