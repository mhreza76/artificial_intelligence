% Facts.
% Facts should always begin with a lowercase letter and end with a full stop, mathematical operators should be avoided.

tomsRedCar.
blue_box.
red_box.
green_circle.
blue_circle.
orange_triangle.
fred_lost_his_car_keys.

% Facts with Argument.      Relation names must begin with a lowercase letter
marry(john).
likes(john,mary).


% Variables and Unification
% Variables are starting with a capital letter. The process of matching items with variables is known as unification.
eats(john,oranges).             % query eats(john,What)
loves(john,mary).

tape(1,van_morrison,astral_weeks,madam_george).
tape(2,beatles,sgt_pepper,a_day_in_the_life).
tape(3,beatles,abbey_road,something).
tape(4,rolling_stones,sticky_fingers,brown_sugar).
tape(5,eagles,hotel_california,new_kid_in_town).
% query tape(3,Artist,Album,Fave_Song).

% Rules
mortal(X) :-
    human(X).
human(reza).
human(hasib).
human(daud).


fun(X) :-
    bike(X),
    car(X).
fun(X) :-
    blue(X),
    red(X).
bike(ducati).   %Sub rules all values must be same to satisfy main rule.
car(ducati).
blue(color).
red(color).
fun(ice_cream).