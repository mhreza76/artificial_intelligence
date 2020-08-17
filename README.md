# artificial_intelligence
AI_course
Prolog is a logic language that is particularly suited to programs that involve symbolic or non-numeric computation.
For this reason, it is a frequently used language in Artificial Intelligence where manipulation of symbols and inference about them is a common task.
# Simple Facts
In Prolog we can make some statements by using facts. Facts either consist of a particular item or a relation between items. For example we can represent the fact that it is sunny by writing the program:
sunny.
We can now ask a query of Prolog by asking
?- sunny.
?- is the Prolog prompt. To this query, Prolog will answer yes. sunny is true because (from above) Prolog matches it in its database of facts.
Facts have some simple rules of syntax. Facts should always begin with a lowercase letter and end with a full stop.
The facts themselves can consist of any letter or number combination, as well as the underscore _ character.
However, names containing the characters -,+,*,/, or other mathematical operators should be avoided.
# Examples of Simple Facts

Here are some simple facts about an imaginary world. /* and */ are comment delimiters.

```prolog
john_is_cold.                          /* john is cold */
raining.                               /* it is raining */
john_Forgot_His_Raincoat.              /*  john forgot his raincoat */
fred_lost_his_car_keys.                /* fred lost is car keys */
peter_footballer.                      /* peter plays football */
```

These describe a particular set of circumstances for some character john. We can interrogate this database of facts, by again posing a query. For example: {note the responses of the Prolog interpreter are shown in italics}

### queries
```prolog
?-john_Forgot_His_Raincoat.
true
?- raining.
true
?- foggy.
false
```

The first two queries succeed since they can be matched against facts in the database above. However, foggy fails (since it cannot be matches) and Prolog answers no since we have not told it this fact.
# Simple Fact Exercises
```prolog
blue_box.
red_box.
green_circle.
blue_circle.
orange_triangle.
```
Again indicate whether you think the goal will succeed or not by answering yes or no as prompted.
### queries
```prolog
?-green_circle.
?-circle_green.
?-red_triangle.
?-red_box.
?-orange_Triangle.
```
# Facts with Arguments
More complicated facts consist of a relation and the items that this refers to. These items are called arguments. Facts can have arbitrary number of arguments from zero upwards. A general model is shown below:
#### relation(<argument1>,<argument2>,....,<argumentN>)

Relation names must begin with a lowercase letter
```prolog
likes(john,mary).
```
The above fact says that a relationship likes links john and mary. This fact may be read as either john likes mary or mary likes john. This reversibility can be very useful to the programmer, however it can also lead to some pitfalls. Thus you should always be clear and consistent how you intend to interpret the relation and when.

Finally, remember names of the relations are defined by you. With the exception of a few relations that the system has built into it, the system only knows about relations that you tell it about.

# Facts with Arguments Examples 1
An example database. It details who eats what in some world model.
```prolog
eats(fred,oranges).                           /* "Fred eats oranges" */

eats(fred,t_bone_steaks).                     /* "Fred eats T-bone steaks" */

eats(tony,apples).                            /* "Tony eats apples" */

eats(john,apples).                            /* "John eats apples" */

eats(john,grapefruit).                        /* "John eats grapefruit" */
```
#### If we falsew ask some queries we would get the following interaction:
### queries
```prolog
?- eats(fred,oranges).         /* does this match anything in the database? */

true                           /* true, matches the first clause in the database */

?- eats(john,apples).          /*  do we have a fact that says john eats apples? */

true                            /* yes we do, clause 4 of our eats database */

?- eats(mike,apples).          /* how about this query, does mike eat apples 

false                             /* falset according to the above database. */

?- eats(fred,apples).          /* does fred eat apples */

false                            /* again no, we don't know whether fred eats apples */
```

# Facts with Arguments Examples 2
Let us consider another database. This time we will use the predicate age to indicate the ages of various individuals.

```prolog
age(john,32).                 /*  John is 32 years old */

age(agnes,41).                /*  Agnes is 41 */

age(george,72).               /*  George is 72 */

age(ian,2).                   /*  Ian is 2 */

age(thomas,25).               /*  Thomas is 25 */
```

#### If we falsew ask some queries we would get the following interaction:
### queries
```prolog
?- age(ian,2).           /* is Ian 2 years old? */

true                      /* yes, matches against the fourth clause of age */

?-agnes(41).            /* for some relation agnes are they 41  */

false                       /* No.   In the database above we only know about the relation */ 

                         /*  age, not about the relation agnes, so the query fails */

?- age(ian,two)          /* is Ian  two years old? */

false                      /* No.  two and 2 are not the same and therefore don't match */

```

# Variables and Unification
How do we say something like "What does Fred eat"? Suppose we had the following fact in our database:

```prolog
eats(fred,mangoes).
```
How do we ask what fredeats. We could type in something like
### queary
```prolog
?- eats(fred,what).
```
However Prolog will say no. The reason for this is that what does not match with mangoes. In order to match arguments in this way we must use a Variable. The process of matching items with variables is known as unification. Variables are distinguished by starting with a capital letter. Here are some examples:
#### X         /* a capital letter */
#### VaRiAbLe  /* a word - it be made up or either case of letters */
#### My_name   /* we can link words together via '_' (underscore) */

Thus returning to our first question we can find out what fred eats by typing
### queary
```prolog
?- eats(fred,What).

What=mangoes

true
```
As a result of this query, the variable What has matched (or unified) with mangoes. We say that the variable What now has the binding mangoes. When we pose a query, if the query is successful, Prolog prints both the variable and the variable name, as we see above.

# Variable Examples 1
```prolog
loves(john,mary).

loves(fred,hobbies).
```

#### Now let's look at some simple queries using variables
### queries
```prolog
?- loves(john,Who).      /* Who does john love? */

Who=mary                 /* yes , Who gets bound to mary */

true                      /*  and the query succeeds*/

?- loves(arnold,Who)     /* does arnold love anybody */

false                       /* no,  arnold doesn't match john or fred */

?- loves(fred,Who).      /* Who does fred love */

Who = hobbies            /*  Note the to Prolog Who is just the name of a variable, it */

true                      /* semantic connotations are not picked up, hence  Who unifies */

                         /* with hobbies */

```

# Variable Examples 2
Here are some more difficult object/variable comparisons. Consider the following database showing a library of cassette tapes. Notice the final argument to tape, which is the name of a favourite song from the album.
```prolog
tape(1,van_morrison,astral_weeks,madam_george).

tape(2,beatles,sgt_pepper,a_day_in_the_life).

tape(3,beatles,abbey_road,something).

tape(4,rolling_stones,sticky_fingers,brown_sugar).

tape(5,eagles,hotel_california,new_kid_in_town).
```
#### Let's now look at some queries.
### quaeries
```prolog
?- tape(5,Artist,Album,Fave_Song).             /* what are the contents of tape 5 */

Artist=eagles

Album=hotel_california

Fave_Song=new_kid_in_town

true

?- tape(4,rolling_stones,sticky_fingers,Song).  /* find just  song */

Song=brown_sugar                        /* which you like best from the album */
```

# Rules
So far we have looked at how to represent facts and to query them. Now we move on to rules. Rules allow us to make conditional statements about our world. Each rule can have several variations, called clauses. These clauses give us different choices about how to perform inference about our world. Let's take an example to make things clearer.
Consider the following
'All men are mortal':
We can express this as the following Prolog rule
```prolog
mortal(X) :-

        human(X).
```
The clause can be read in two ways (called either a declarative or a procedural interpretation). The declarative interpretation is "For a given X, X is mortal if X is human." The procedural interpretation is "To prove the main goal that X is mortal, prove the subgoal that X is human."
# Rules 2:>
To continue our previous example, lets us define the fact 'Reza is human' so that our program now looks as follows:
```prolog
mortal(X) :-
        human(X).
human(reza).
```
#### If we now pose the question to Prolog
### quaeries
```prolog
?- mortal(reza).
```
The Prolog interpreter would respond as follows:
true

Why was this? Well in order to sFolve the query ?- mortal(reza)., we used the rule we saw previously. This said that in order to prove someone mortal, we had to prove them to be human. Thus from the goal Prolog generates the subgoal of showing human(reza).
In the above example we were able to match human(reza) against the database described at the top of this card. In Prolog we say that the subgoal succeeded, and as a result the overall goal succeeded. We know when this happens because Prolog prints yes.

# Rules 3:
We can also use variables within queries. For example, we might wish to see if there is somebody who is mortal. This is done by the following line.
### query
```prolog
?- mortal(P).
```
The Prolog interpreter responds.
```prolog
P = socrates
```
This means that Prolog was able to prove the goal by binding the variable P to reza. This was done by again proving someone was mortal by proving the subgoal that they were human. Prolog thus asked if there was any P that was human. This matches against the clause human(reza) thereby binding P to reza. This binding is then passed back to the parent goal, and the results in the printout we saw above.

# Rules 4

Sometimes we may wish to specify alternative ways of proving a particular thing. This we can do by using different rules and facts with the same name. For example, we can represent the sentence 'Something is fun if its a red car or a blue bike or it is ice cream' as follows:

```prolog
fun(X) :-                      /* an item is fun if */ 

        red(X),                /* the item is red */

        car(X).                /* and it is a car */

fun(X) :-                      /*  or an item is fun if */

        blue(X),               /* the item is blue */

        bike(X).               /* and it is a bike */

fun(ice_cream).                /* and ice cream is also fun. */

```
This program says that we have three ways of finding out if something is fun. Something is fun if it is a red and a car or blue and a bike, or if it is ice cream. These three options are represent in Prolog by three clauses of the predicate fun. Just like we saw for pure facts, Prolog will start from the first clause (beit a rule or fact) of fun and try that. If that does not succeed, we try the next clause. We only fail when we run out of rules or facts to try.

### Examples 1
```prolog
fun(X) :-
        red(X),
        car(X).
fun(X) :-
        blue(X),
        bike(X).
car(vw_beatle).
car(ford_escort).
bike(harley_davidson).
red(vw_beatle).
red(ford_escort).
blue(harley_davidson).
```
Above is both our previous program for finding fun items and facts describing some red and blue items and some cars and bikes. Let's now use the above program and see if a harley_davidson is fun. To do this we can ask Prolog the following question.

### query
```prolog
?- fun(harley_davidson).                  /* to which Prolog will reply */

true                                     /* to show the program succeeded */
```
To execute this query, Prolog will first see if harley_davidson is red, however only vw_beatles and ford_escorts are defined as being red. Hence the query red(harley_davidson) will fail. This means that the first clause of fun will fail. As a result, we now try the second clause of fun. This will mean that we will attempt the subgoals blue(harley_davidson) and bike(harley_davidson). Both these goals match facts in the database. As a result fun succeeds as we saw above.

# Examples 2
```prolog
fun(X) :-
        red(X),
        car(X).
fun(X) :-
        blue(X),
        bike(X).
car(vw_beatle).
car(ford_escort).
bike(harley_davidson).
red(vw_beatle).
red(ford_escort).
blue(harley_davidson).
```
We can also ask our program to find fun items for us. To do this we can pose the following question.
### query
```prolog

?- fun(What).
```
To which Prolog will reply 
#### To see multiple answers press "Spacebar"
```prolog
What=vw_beatle,
What=ford_escort,
What=harley_davidson.
```

```prolog
likes(Person1,Person2):-
    hobby(Person1,Hobby),
    hobby(Person2,Hobby).
hobby(john,fishing).
hobby(tom,fishing).
hobby(reza,travelling).
hobby(niloy,travelling).
hobby(munny,photography).
```
### querys
```prolog
?- likes(john,tom).
true

?- likes(john,reza).
false

?- likes(john,W)
W = john ;
W = tom.

?- hobby(W,fishing).
W = john ;
W = tom
```

#### We used Person1 and Person2 as a veriable, likes will be true when two persons hobby will be same.

# Search
## Backtracking
Suppose that we have the following database
```prolog
eats(fred,pears).

eats(fred,t_bone_steak).

eats(fred,apples).     
```

### query
```prolog
?- eats(fred,What).
```
#### outputs
```prolog
What = pears ;
What = t_bone_steak ;
What = apples.
```
#### to see multiple answers we have to press "spacebar"

# Backtracking in Rules
We can also have backtracking in rules. For example consider the following program.
```prolog
hold_party(X):-
    birthday(X),
    happy(X).
birthday(tom).
birthday(fred).
birthday(reza).
happy(mary).
happy(jane).
happy(reza).
```
If we now pose the query
### query
```prolog
?- hold_party(Who).
```
####  output
```prolog
Who = reza .
```
In order to solve the above, Prolog first attempts to find a clause of birthday, it being the first subgoal of birthday. This binds X to tom. We then attempt the goal happy(tom). This will fail, since it doesn't match the above database. As a result, Prolog backtracks. This means that Prolog goes back to its last choice point and sees if there is an alternative solution. In this case, this means going back and attempting to find another clause of birthday. This time we can use clause two, binding X to fred. This then causes us to try the goal happy(fred). Again this will fail to match our database. As a result, we backtrack again. This time we find clause three of birthday, and bind X to reza, and attempt the goal happy(reza). This goal matches against clause 3 of our happy database. As a result, hold_party will succeed with X=reza.

# Search Example 1
```prolog
<!-- clause 1 -->
fun(X) :-
        red(X),
        car(X).

<!-- clause 2 -->
fun(X) :-
        blue(X),
        bike(X).
<!-- database of red items -->
red(apple_1).
red(block_1).
red(car_27).
<!-- database of cars  -->
car(desoto_48).
car(edsel_57).
```
## Explanation of above code blocks how works.

Let's now ask what is a fun item. To do this we first must enter the following query
```prolog
?- fun(What).
```
We first attempt to prove something is fun. To do this we have two clauses of fun that we can use.
Using the first clause, we can now look to see if we can find some red object

First let's retrieve a red object from the red database

```prolog
/* database of red items */
red(apple_1).      first choice
red(block_1).
red(car_27).
```

The first red item that we find is apple_1. This gives us the instantiation X=apple_1. Next we have to see if this is a car, so we ask the question car(apple_1). Does this match with our existing database of facts about cars?

```prolog
/* database of cars */
car(desoto_48).
car(edsel_57).
```

The answers is that it will not. apple_1 will not match with desoto_48 or with edsel_57. So what do we do next? In such cases, Prolog backtracks in order to find another solution. Thus we go back to the red database, and see if we can find another possible solution. In this case we can

```prolog
red(apple_1).  
red(block_1).      second choice
red(car_27).
```

We can use the next clause and see if block_1 is a red car.

Returning to our cars database, again block_1 will not match against desoto_48 or with edsel_57. In this case we must backtrack a second time to see if there is another red item that we can find. This time we find the third clause in the database, and use that.

```prolog
red(apple_1).    
red(block_1).
red(car_27).     third choice 
```

We now attempt the car goal again, but this time for car_27. Now recall what we said earlier about the dangers of over estimating the powers of Prolog. Prolog will try to match the goal car(car_27) against the database

```prolog
car(desoto_48).
car(edsel_57).
```

This will fail. car_27 does not match with either desoto_48 or edsel_57. Although the programmer probably meant car_27 to mean car number 27 to be a car, Prolog has no way of gleaning this intended semantics, and fails the call based on a simple pattern match.
Well, what do we do now. The first step is to go back and see if there are any more possible red items. Well we have now exhausted all three choices, hence there are no more red items to choose from. Given that there are no more possible ways that we could satisfy clause 1, we now more on to clause 2, as we see on the next card.

#### we checked first clause have no matching between red car. now prolog will start finding matches between blue bike (as like as first clause).



