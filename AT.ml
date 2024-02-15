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

let rec find_opt (x :string) l : int option = match l with
| []                -> None
| (y,i)::l when y=x -> Some i
|_::q               -> find_opt x q


let test_arity t l =
  let rec aux t i = match t with
  | Empty -> ()
  | Node (s,tl) -> (
    (match (find_opt s l) with
      | None -> ()
      | Some k -> if (List.length tl) <> k then
        ( print_string "Niveau "; print_int i; print_string ", "; print_string s ; print_string " est d'arité " ; print_int k ; print_string " mais a "; print_int (List.length l) ; print_string " fils." ; print_newline()
  ) else () );
  List.iter (fun x -> aux x (i+1)) tl
  ) in
  aux t 1


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
