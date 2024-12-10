
type t = { failed : bool; files : string list } [@@deriving yojson]

let has_file (v : t) (options : string list) : string option =
  let children = v.files in
  try
    List.find_map (fun x ->
        let fname = Fpath.(v x |> rem_ext |> filename) in
        if List.mem fname options
        then Some fname
        else None) children
  with Not_found -> None
  
  let has_license (v : t) = has_file v ["LICENSE"; "LICENCE"]
  let has_readme (v : t) = has_file v ["README"; "Readme"; "readme"]
  let has_changelog (v : t) = has_file v ["CHANGELOG"; "Changelog"; "changelog"; "CHANGES"; "Changes"; "changes"]
  