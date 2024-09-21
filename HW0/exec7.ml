type 'a seq =
  | Elt of 'a
  | Seq of 'a seq * 'a seq

let (@@) x y = Seq(x, y)

let rec hd seq =
  match seq with
  | Elt x -> x
  | Seq (x,_) -> hd x

let rec tl seq =
  match seq with
  | Elt x -> failwith "Empty List"
  | Seq (x,y) ->
    match x with
    | Elt _ -> y
    | Seq (_,_) -> tl x @@ y

let rec rev seq = 
  match seq with
  | Elt y -> y
  | Seq (x,y) -> (rev x) @@ (rev y)

let rec map fuc seq = 
  match seq with
  | Elt y -> fuc y
  | Seq (x,y) -> (map fuc x) @@ (map fuc y)

let rec mem chk seq = 
  match seq with
  | Elt y -> y = chk
  | Seq (x,y) -> (mem chk x) || (mem chk y)

let rec fold_left fuc acc seq = 
  match seq with
  | Elt x -> fuc acc x
  | Seq (x,y) -> fold_left fuc (fold_left fuc acc x) y

let rec fold_right fuc acc seq = 
  match seq with
  | Elt x -> fuc acc x
  | Seq (x,y) -> fold_right fuc  x (fold_left fuc acc y)

let rec seq2list seq = 
  let rec aux seq1 l2 = 
    match seq1 with
    | Elt x -> x :: l2
    | Seq(x,y) -> aux x (aux y l2)
  in
  aux seq []
let rec count_elements seq =
  match seq with
  | Elt _ -> 1
  | Seq (s1, s2) -> count_elements s1 + count_elements s2

let rec find_opt chk seq =
  let rec aux seq index = 
    match seq with
    | Elt num -> if chk = num then Some index else None
    | Seq (x,y) ->
      match aux x index with
      | Some i -> Some i
      | None -> aux y (index + (count_elements x))
  in
  aux seq 0

let rec nth n seq = 
  if n < 0 || n >= List.length (seq2list seq) then
    None
  else
    let rec aux seq index = 
      match seq with
      | Elt num -> if index = n then Some num else None
      | Seq (x,y) ->
        match aux x index with
        | Some i -> Some i
        | None -> aux y (index + (count_elements x))
    in
    aux seq 0

let example_seq = Seq (Elt 1, Seq (Elt 2, Seq (Elt 3, Elt 4)))

let () = 
  let ans = nth 1 example_seq in
  match ans with
  | Some value -> Printf.printf "The second element of seq is %d.\n" value
  | None -> Printf.printf "The index isn't correct.\n"

(*execrise 1~7 參考Chat GPT*)