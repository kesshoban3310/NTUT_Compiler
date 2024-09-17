let a = read_line();;
let b = read_line();;
let factor x y =
  let xr = ref (String.length x) in
  let xl = ref 0 in
  let yr = ref (String.length y) in
  let yl = ref 0 in
  let check = ref (xr <= yr) in
  let lencheck = ref false in
  let counter = ref 0 in
  while yl < yr && xl < xr && !check do
    let lc = String.get x !xl in
    let rc = String.get y !yl in
    if lc = rc then
      counter := !counter +1
    else
      counter := 0;
    if counter = xr then
      begin
        check := false;
        lencheck := true
      end;
    yl := !yl+1;
    xl := !xl+1;
  done;
  !lencheck
let () = 
  let ans = factor a b in
  if ans then
    Printf.printf "The string %s is a factor in %s." a b
  else 
    Printf.printf "The string %s isn't a factor in %s." a b