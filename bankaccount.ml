open Tk

open Printf

let balance = ref 0  (* 残高 *)

let add_balance x = balance := !balance + x  (* 残高を更新する *)

(* ウィジェットを作る *)
  
let top = openTk()  (* アプリ全体のウィンドウ *)

let tv_balance = Textvariable.create ()  (* ラベルに表示する文字 *)

let label1 = Label.create top ~textvariable:tv_balance ~relief: `Raised

let print_balance tv =
    if !balance < 0 then (closeTk(); exit 0)
    else
        let s = sprintf "残高は%8d 円です" !balance in
        Textvariable.set tv s

let bot_frame = Frame.create top

let entry = Entry.create bot_frame
and label2 = Label.create bot_frame ~text:"円"
and rb_frame = Frame.create bot_frame

let tv_button = Textvariable.create ()

let radiobuttons = 
    List.map
    (fun (t, a) ->
        Radiobutton.create rb_frame ~text:t ~value:a ~variable:tv_button)
    [("を預金する", "Deposit");
    ("を引き出す", "Withdraw")]

let action entry tv_but tv_bal () =
    let y = int_of_string (Entry.get entry) in
    match Textvariable.get tv_but with
    "Deposit" -> add_balance y; print_balance tv_bal
    | "Withdraw" -> add_balance (-y); print_balance tv_bal
    | _ -> failwith "Cannot happen"

let button = Button.create bot_frame
    ~text:"実行"
    ~command:(action entry tv_button tv_balance)

    (* ウィジェット配置と初期化 *)

let () = pack radiobuttons ~side:`Top;

(* coe -- どんなwidgetでも any widget という同じ型に変換してくれる。 *)
pack [coe entry; coe label2; coe rb_frame; coe button] ~side:`Left;

pack [coe label1; coe bot_frame] ~side:`Top;

print_balance tv_balance;

mainLoop()
        

