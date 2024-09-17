let a = read_line();;
let b = read_line();;
let compare x y =
  let xr = ref (String.length x) in
  let xl = ref 0 in
  let yr = ref (String.length y) in
  let yl = ref 0 in
  let check = ref (xr <= yr) in
  while yl < yr && xl<xr && !check do
    let lc = String.get x !xl in
    let rc = String.get y !yl in
    if lc > rc then
      check := false;
    yl := !yl+1;
    xl := !xl+1;
  done;
  !check
let () = 
  let ans = compare a b in
  if ans then
    Printf.printf "The string %s is smaller than %s." a b
  else 
    Printf.printf "The string %s isn't smaller than %s." a b