let string_to_list s =
  let split = String.split_on_char ' ' s in
  List.map int_of_string split
let x = read_line();;
let arr = string_to_list x;;
let split lst = 
  let mid = (List.length lst)/2 in
    let rec aux i acc lst =
      match lst with
      | [] -> (List.rev acc, [])  (* 當列表為空時反轉 acc *)
      | hd :: tl ->
          if i = mid then (List.rev acc, lst)
          else aux (i + 1) (hd :: acc) tl  (* 將 hd 加入 acc *)
    in
    aux 0 [] lst

let rec merge lst rst = 
  match(lst,rst) with
  | ([],_) -> rst
  | (_,[]) -> lst
  | (h1::t1,h2::t2) ->
    if(h1 <= h2) then
      h1 :: (merge t1 rst)
    else
      h2 :: (merge lst t2)

let rec sort lst = 
  if List.length lst <= 1 then lst  (* 基本情況 *)
  else
    let (lt,rt) = split lst in
    let res = merge (sort lt) (sort rt) in
    res

let () =
    let ans = sort arr in
    List.iter (fun x -> Printf.printf "%d " x) ans;