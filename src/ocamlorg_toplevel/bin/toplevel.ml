open Js_of_ocaml

let _ =
  Js.export
    "myToplevel"
    (object%js
       method start worker = Ocamlorg_toplevel.Toplevel.run (Js.to_string worker)
    end)
