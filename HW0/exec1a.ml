let x = read_line ();;
let number = int_of_string x;;
let fact n = 
  let ans = ref 1 in
  for i = 1 to n do
    ans := !ans * i
  done;
  !ans

let () = 
  let res = fact number in
  Printf.printf "The fact of number %d is %d\n" number res