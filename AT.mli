    type at = Empty | Node of (string * at list)

    (** [empty ()] creates  an empty tree *)
    val empty : unit -> at

    (** [init x] creates [Node (x, [])]  *)
    val init : string -> at

    (** [add_son t1 t2] adds [t1] to the list of sons of [t2] *)
    val add_son : at -> at -> at

    (** [add_son_list l t] adds the list [l] to the list of sons of [t] *)
    val add_son_list : at list -> at -> at 

    (** [pprint t print] prints [t] in the tikz-qtree format for LaTeX, 
    with the auxilliary printing function [print]. *)
    val pprint : at -> (string -> 'a) -> unit