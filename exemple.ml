let () =
let x = AT.init "$x$" in
let g = (AT.add_son_list [x ; x] (AT.init "$g$")) in
let f = (AT.add_son_list [x ; x ; x] (AT.init "$f$")) in
let t = ref (AT.init "$t$") in
t := (AT.add_son_list [g ; g ; f ;g] (!t)) ;

AT.pprint (!t) print_string ;

AT.test_arity (!t) [("$x$",0);("$f$",3);("$g$",2)] ;
