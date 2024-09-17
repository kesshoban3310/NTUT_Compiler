let x = read_line ();;
let number = int_of_string x;;
let fibo n = 
  let fibo_list = ref [1;1;2] in
  for i = 4 to n do
    let fir = List.nth !fibo_list (i-3) in
    let sec = List.nth !fibo_list (i-2) in
    let new_val = fir + sec in
      fibo_list := !fibo_list @ [new_val]
  done;
  let len = List.length !fibo_list in
  List.nth !fibo_list (len-1)

let () = 
  let res = fibo number in
  Printf.printf "The number of fibonacci seq is %d\n" res