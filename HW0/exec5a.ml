let string_to_list s =
  let split = String.split_on_char ' ' s in
  List.map int_of_string split
let x = read_line();;
let arr = string_to_list x;;
let cal_square x =
  x * x
let square_sum a = 
  let len = ref (List.length a) in
  let sum = ref 0 in
  for i = 0 to !len-1 do
    let num = ref (List.nth a i) in
    let sq = cal_square !num in
    sum := !sum + sq;
  done;
  !sum
let () = 
  let ans_sum = square_sum arr in
  Printf.printf "The sum of the list is %d.\n" ans_sum
