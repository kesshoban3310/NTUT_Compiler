let string_to_list s =
  let split = String.split_on_char ' ' s in
  List.map int_of_string split
let x = read_line();;
let y = read_line();;
let number = ref (int_of_string y);;
let arr = string_to_list x;;
let find_opt x a = 
  let len = ref (List.length a) in
  let idx = ref (-1) in
  for i = 0 to !len-1 do
    let num = ref (List.nth a i) in
    if num = x then
      begin
        idx := i
      end;
  done;
  !idx
let () = 
  let ans = find_opt number arr in
  if ans = -1 then
    Printf.printf "None.\n"
  else
    Printf.printf "The index of the number in the list is %d.\n" ans