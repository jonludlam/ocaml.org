type 'a node = { node : 'a; children : 'a node list }

and sidebar_node =
  { url : string option; kind : string option; content : string }

and tree = sidebar_node node

and t = tree list [@@deriving of_yojson]

let has_file (v : t) (options : string list) : string option =
  let children = (List.hd v).children in
  try
    List.find_map (fun x ->
      match x.node.url with 
      | None -> None | Some x ->
        let fname = Fpath.(v x |> rem_ext |> filename) in
        if List.mem fname options
        then Some fname
        else None) children
  with Not_found -> None

