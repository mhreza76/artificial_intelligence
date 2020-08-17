fun_a(X) :-
    red_a(X),
    car_a(X).
fun_b(X) :-
    blue_a(X),
    bike_a(X).
% car(vw_beatle).
car_a(ford_escort).
bike_a(harley_davidson).
% red(vw_beatle).
red_a(ford_escort).
blue_a(harley_davidson).
    
likes(Person1,Person2):-
    hobby(Person1,Hobby),
    hobby(Person2,Hobby).
hobby(john,fishing).
hobby(tom,fishing).
hobby(reza,travelling).
hobby(niloy,travelling).
hobby(munny,photography).

eats(fred,pears).
eats(fred,t_bone_steak).
eats(fred,apples).

hold_party(X):-
    birthday(X),
    happy(X).
birthday(reza).
birthday(hasib).
birthday(daud).
happy(reza).
happy(alexa).


a(X):-
    b(X),
    c(X),
    d(X).
a(X):-
    c(X),
    d(X).
a(X):-
    d(X).
b(a).
b(1).
b(2).
b(3).
c(3).
c(4).
d(10).
d(11).
