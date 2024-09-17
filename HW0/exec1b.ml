let x = read_line ();;
let number = int_of_string x;;
let bn_bit_pos n = 
  let last = ref n in
  let ans = ref 0 in
  while !last > 0 do
    ans := !ans + !last land 1;
    last := !last / 2;
  done;
  !ans

let () = 
  let res = bn_bit_pos number in
  Printf.printf "The number of bits equal to 1 is %d\n" res