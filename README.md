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
