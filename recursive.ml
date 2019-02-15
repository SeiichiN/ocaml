(* 再帰 *)

let rec fact n = (* n の階乗 *)
    if n = 1 then 1 else fact (n-1) * n;;

(* n番目のフィボナッチ数 *)
let rec  fib n =
    if n = 1 || n = 2
    then 1
    else fib(n - 1) + fib(n - 2);;

(*  効率が悪いので改善する *)
let rec fib_pair n =
    if n = 1
    then (1, 0)
    else
        let (i, j) = fib_pair (n - 1) in
        (i + j, i);;

let fib n = 
    let (i, _) = fib_pair n in 
    i;;

let fib n = 
    let rec fib_pair n =
        if n = 1
    then (1, 0)
    else
        let (i, j) = fib_pair (n - 1) in
        (i + j, i) 
        in
    let (i, _) = fib_pair n in 
    i;;

(* ユークリッドの互除法 *)
(*
ふたつの自然数 m と n の最大公約数を求める。ただし、m <= n
m = n の場合は、m が最大公約数。
m <> n の場合は、n - m と m の最大公約数。
*)
let rec maxyaku (m, n) =
    if m = n
    then m
    else
      if (m > n)
      then
        maxyaku(m - n, n)
      else
        maxyaku(n - m, m);;

  (*  TEST  *)
let test10 = maxyaku (100, 25) = 25;;
let test11 = maxyaku (20, 20) = 20;;
let test12 = maxyaku (45, 12) = 3;;

  (* 組み合わせ *)
  (*
m個のなかからn個選び出す組み合わせの数 mCn は、
mCn = mPn / n!
すなわち、
mPn = m! / (m - n)!  --> これを n! で割る。
たとえば、5C2 なら、
5P2 = 5! / (5-2)! = 5*4*3*2*1 / 3*2*1 = 20
5C2 = 5P2 / n! なので、20 / 2*1 = 10
答え、10通り
   *)
  (*
以下のように、再帰的に定義できる。
nC0 = nCn = 1
nCm = (n-1)Cm + (n-1)C(m-1)
ただし、0 <= m < n
   *)
  (* colabo: (int, int) => int *)
let rec colabo (n, m) =
  if m = 0 || n = m
  then 1
  else
    colabo ((n - 1), m) + colabo ((n - 1), (m - 1));;

  (* TEST *)
let test21 = colabo(5, 2) = 10;;
let test22 = colabo(10, 2) = 45;;
let test23 = colabo(10, 4) = 210;;

  (* 相互再帰 *)
let rec even n = (* n は正の整数 *)
  if n = 0
  then true
  else odd(n - 1)
and odd n =
  if n = 0
  then false
  else even(n - 1);;

  (* TEST *)
let test31 = even 6 = true;;
let test32 = odd 14 = false;;
  
             
                               
  

