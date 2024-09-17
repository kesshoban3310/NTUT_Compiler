let x = read_line();;
let check_palindome n =
  let r = ref ((String.length n)-1) in
  let l = ref 0 in
  let chk = ref true in
  while l < r && !chk do
    let lc = String.get n !l in
    let rc = String.get n !r in
    if lc <> rc then
      chk := false;
    l := !l+1;
    r := !r-1;
  done;
  !chk
let () = 
  let ans = check_palindome x in
  if ans then
    Printf.printf "The string is a Palindrome."
  else 
    Printf.printf "The string isn't a Palindrome."