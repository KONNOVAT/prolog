implement main
    open core, stdio

class predicates
    pow : (integer A, integer Power, integer Res [out]) determ.
clauses
    pow(0, N, 0) :-
        N > 0,
        !.
    pow(0, _, _) :-
        write("Ошибка"),
        !,
        fail.
    pow(_, 0, 1) :-
        !.
    pow(A, N, Res * A) :-
        pow(A, N - 1, Res).

class predicates
    pow_int : (integer A, integer Power, integer Res [out]) determ.
    pow_rec : (integer A, integer Power, integer CurStep, integer CurRes, integer Res [out]) determ.

clauses
    pow_int(A, Power, Res) :-
        Power > 0,
        pow_rec(A, Power, 0, 1, Res).
    pow_rec(_, Power, Power, Res, Res) :-
        !.
    pow_rec(A, Power, CurStep, CurRes, Res) :-
        pow_rec(A, Power, CurStep + 1, CurRes * A, Res).

clauses
    run() :-
        pow(3, 9, X),
        write(X),
        nl,
        fail.

    run() :-
        pow_int(4, 6, X),
        write(X),
        nl,
        !.

    run().

end implement main

goal
    console::runUtf8(main::run).
