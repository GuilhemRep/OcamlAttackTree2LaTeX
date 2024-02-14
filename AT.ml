(************************************************************************************************************************

Ce module sert à faire des manipulations sur des arbres binaires de recherche, puis à générer un code tikz
au format qtree qui représente l'arbre obtenu.

************************************************************************************************************************)


type at = Empty | Node of (string * at list)


let empty () =
  Empty

let init s =
  Node (s, [])

let add_son t1 t2 = match t2 with
  Empty -> t1
| Node (s, l)->Node (s,t1::l)

let add_son_list l t = match t with
    Empty -> Node ("?", l)
  | Node (s, l')->Node (s,l@l')


let pprint at print = 
  let rec aux at = match at with
    Empty -> print_string " $\\bullet $ " 
    |Node (s, l) -> (print_string ("[.") ;
      print s ;
      print_string(" ") ;
      List.iter aux l;
      print_string " ] ")
    in
      print_string "\\Tree " ; aux at ; print_newline()
