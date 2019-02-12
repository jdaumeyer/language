# Custom Programming Language
### An Innovation Lab Passion Project
## Goal
* Make a functional programming language
* Definition of functional programming - everything is based on functions within the programming language. Functions in programming are a stored set of commands that usually require data to be inputted to run.
* The language will be demonstrated through a series of examples hosted on a website to show its capabilities. Possibly a small game to further show the performance of the language
Guidelines
* Prioritize efficiency and speed while maintaining clean and readable code.
* Readable code without comments. Don’t arbitrarily shorten commands.
* Keep the list of commands as simple as possible to make the language simpler to learn
* Code is treated like data, able to be stored moved and applied.
* Functions are meant to be pure, meaning that we will have to provide a library for standard input and output.
* All data remains constant, It is only changed from functions.

### FUNCTIONS
The language is based entirely around blocks of text called functions. Every function will accept a defined number of parameters,
throwing an exception if incorrect data types are presented. Parameters will directly follow the function declaration, separated
by a single space character.

```
Example:
<function name> <parameter 1> <parameter 2> <parameter 3> ...
```

Functions even include seemingly basic instructions such as operators (seen below).
Function precedes the parameters. This way the program will run faster on stack memory systems.

```
Example:
+ 1 2         // Adds 1 and 2
Fibonacci 5   // Calculates the 5th Fibonacci number
```

Curly brackets and parenthesis may surround arbitrary code to make it more "human readable".
As the language has no order of operations, these markings are treated as non-characters.

```
Example:
{ + 1 2 }
if > (+ 1 2) (+ 1 2)
define int foo {- {10 7}) (This is discouraged but will otherwise have no effect on the code.)
```

A list of most basic functions is included for reference below:

 Function		| Syntax								| Description											| Example
----------------|---------------------------------------|-------------------------------------------------------|----------------------------------
 \<variable\>	| `foo`									| Will return the stored value of the variable.			| `foo`
 define			| `define <type> <var> <value>`			| Defines a variable or function.						| `define int foo 12`
 =				| `= <var> <value>`						| Assigns a value to an existing variable of same type.	| `= foo 42`
 \+				| `+ <value1> <value2>`					| Adds or concatenates values depending on data type.	| `+ "S" "winter" #returns Wummer`<br>`+ 9 10 #returns 21`
 \-				| `- <value1> <value2>`					| Subtracts values of type int or float.				| `- 9 10 #returns -1`
 \*				| `* <value1> <value2>`					| Multiplies values of type int or float.				| `* 6 9 #returns 42`
 /				| `/ <value1> <value2>`					| Divides values of type int or float, truncating ints. | `/ 99 100 #returns 0`
 %				| `% <value1> <value2>`					| Divides values of type int and returns the remainder. | `% 99 100 #returns 1`
 \<				| `< <value1> <value2>`					| Is value1 less than value2, both of same type?		| `< 9 10 #returns true`
 \>				| `> <value1> <value2>`					| Is value1 greater than value2, both of same type?		| `> 9 10 #returns false`
 \<= or \>=		| `[see above]`							| Same as above, but returns true if values are equal.	| `<= 1 1 #returns true`
 ==				| `== <value1> <value2>`				| False unless vars are same type and value.			| `== 82 "Lot more than 82 toothpicks, Ray."`
 if				| `if <boolean> :`						| Executes following code block if true.				| `if true :`<br>`    output "hi"`
 while			| `while <boolean> :`					| Executes following code block repeatedly until false. | `while true :`<br>`    output "hi"`
 import			| `import <filename as string>`			| Appends the referenced file to the active program.	| `import "crown_prince.doc.exe"
 return			| `return <value>`						| Evaluates deepest nested function to equal value.		| `return 42`
 iterate		| `iterate <var> <amount>`				| Adds the given value to the var of type int or float. | `iterate foo 1`
 \+\+			| `++ <var>`							| The equivalent of `iterate <var> 1`					| `++ foo`
 \-\-			| `-- <var>`							| The equivalent of `iterate <var> -1`					| `-- foo'
 toString		| 'toString <value>`					| Converts the given value of any type to a string.		| `toString arrayOfAllEnglishWords`
 output			| `output <value>`						| Outputs the value to console.							| `output "Hello world!"`
 
### Data Types:
The list of data types is able to be kept so small due to data having a dynamically created size. Instead of having a hard cap on the size of a variable, the language will look at the variable’s value and give it the size needed. This however is a fixed size as all variables are immutable.

Data Type	|Type     | Description                               		 			|Example
------------|---------|-------------------------------------------------------------|-----------------------------------------
int 		|Integers | Basic numbers dynamically allocated size, defaults to 0.	| `define int foo 42`
string		|Strings  | Plain Text, defaults to ""									| `define string bar "Hello world!"`
bool		|Booleans | True or false, defaults to false							| `define bool fizz false`
float		|Floats   | Decimal Numbers, defaults to 0.0							| `define float buzz 8.675309`
array		|Arrays   | A list of arbitrary functions, defaults to length 0			| `define array fuzz 10`

### Compilation
The language will be compiled, using a C based compiler, into machine code that can then be run. This is to ensure that the language runs as fast as possible. However, to get the language started, we will be using what’s called a transpiler. Which essentially takes our language and puts it into another, likely C. 