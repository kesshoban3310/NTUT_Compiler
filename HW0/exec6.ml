let arr = List.init 1000001 (fun i -> i)

let rev lst = 
  let rec aux l1 l2 = 
    match l1 with
    | [] -> l2
    | (x :: xs) -> aux xs (x::l2)
  in
  aux lst []

let map fuc lst = 
  let rec aux fuc lst =
    match lst with
    | [] -> []
    | x :: xs -> fuc x :: aux fuc xs
  in
  aux fuc lst
let func1 = fun i -> i+5;;
let func2 = fun i -> i-5;;
let func3 = fun i -> i*5;;
let func4 = fun i -> i/5;;
let func5 = fun i -> i mod 5;;

let () = List.iter (Printf.printf "%d ") (map func3 arr);;
Printf.printf("\n");;
let () = List.iter (Printf.printf "%d ") (rev arr);;

