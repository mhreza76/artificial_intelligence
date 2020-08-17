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

#### query
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
#### query
?-green_circle.
?-circle_green.
?-red_triangle.
?-red_box.
?-orange_Triangle.
```