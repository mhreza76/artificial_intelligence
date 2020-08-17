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

### quearies
```prolog
?-john_Forgot_His_Raincoat.
yes
?- raining.
yes
?- foggy.
no
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
### quearies
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
#### If we now ask some queries we would get the following interaction:
### quearies
```prolog
?- eats(fred,oranges).         /* does this match anything in the database? */

yes                           /* yes, matches the first clause in the database */

?- eats(john,apples).          /*  do we have a fact that says john eats apples? */

yes                            /* yes we do, clause 4 of our eats database */

?- eats(mike,apples).          /* how about this query, does mike eat apples 

no                             /* not according to the above database. */

?- eats(fred,apples).          /* does fred eat apples */

no                            /* again no, we don't know whether fred eats apples */
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

#### If we now ask some queries we would get the following interaction:
### quearies
```prolog
?- age(ian,2).           /* is Ian 2 years old? */

yes                      /* yes, matches against the fourth clause of age */

?-agnes(41).            /* for some relation agnes are they 41  */

no                       /* No.   In the database above we only know about the relation */ 

                         /*  age, not about the relation agnes, so the query fails */

?- age(ian,two)          /* is Ian  two years old? */

no                      /* No.  two and 2 are not the same and therefore don't match */

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

yes
```
As a result of this query, the variable What has matched (or unified) with mangoes. We say that the variable What now has the binding mangoes. When we pose a query, if the query is successful, Prolog prints both the variable and the variable name, as we see above.

# Variable Examples 1
```prolog
loves(john,mary).

loves(fred,hobbies).
```

#### Now let's look at some simple queries using variables
### quearies
```prolog
?- loves(john,Who).      /* Who does john love? */

Who=mary                 /* yes , Who gets bound to mary */

yes                      /*  and the query succeeds*/

?- loves(arnold,Who)     /* does arnold love anybody */

no                       /* no,  arnold doesn't match john or fred */

?- loves(fred,Who).      /* Who does fred love */

Who = hobbies            /*  Note the to Prolog Who is just the name of a variable, it */

yes                      /* semantic connotations are not picked up, hence  Who unifies */

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

yes

?- tape(4,rolling_stones,sticky_fingers,Song).  /* find just  song */

Song=brown_sugar                        /* which you like best from the album */

yes      
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
yes

Why was this? Well in order to solve the query ?- mortal(reza)., we used the rule we saw previously. This said that in order to prove someone mortal, we had to prove them to be human. Thus from the goal Prolog generates the subgoal of showing human(socrates).
In the above example we were able to match human(reza) against the database described at the top of this card. In Prolog we say that the subgoal succeeded, and as a result the overall goal succeeded. We know when this happens because Prolog prints yes.

