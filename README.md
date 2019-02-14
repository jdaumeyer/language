# Custom Programming Language
### An Innovation Lab Passion Project
The following lists the goals for this project:
* Make a functional programming language
* Definition of functional programming - everything is based on functions within the programming language. 
	Functions in programming are a stored set of commands that usually require data to be inputted to run.
* The language will be demonstrated through a series of examples hosted on a website to show its capabilities. 
	Possibly a small game to further show the performance of the language Guidelines
* Prioritize efficiency and speed while maintaining clean and readable code.
* Readable code without comments. Don’t arbitrarily shorten commands.
* Keep the list of commands as simple as possible to make the language simpler to learn
* Code is treated like data, able to be stored moved and applied.
* Functions are meant to be pure, meaning that we will have to provide a library for standard input and output.
* All data remains constant, It is only changed from functions.

---

### HOW TO READ THIS DOCUMENT
* Code within angle brackets is to be treated as a value which must be filled in by the programmer.
* Lines following the pound symbol (#) are comments and do not affect code execution.
* This document is designed as documentation for those writing code in the language, but will also be used to 
	plan future development. Any listed features may not be added, may be removed, or may be altered at any time.

### FUNCTION SYNTAX
The language is based entirely around blocks of text called functions. Every function will accept a defined number
of parameters, throwing an exception if incorrect data types are presented. Parameters will directly follow the 
function declaration, separated by a single space character.
```
#Example:
<function name> <parameter 1> <parameter 2> <parameter 3> ...
```

### VARIABLE DECLARATION
Variables are a human-readable name that can be assigned to functions for usage multiple times in one program.
Variables can be defined using the process depicted below. For additional usage of the define function,
see the "VANILLA FUNCTIONS" section below.

Functions are defined using the syntax 
```define <variableName> <function>``` 
where variableName defines a new function that can be called as above with the methods in "FUNCTION SYNTAX". In
addition to the standard functions included below in "VANILLA FUNCTIONS", `<function>` can be defined with one of
the below "DATA FUNCTIONS" for data storage and the ability to define multi-line custom functions.

### DATA FUNCTIONS
While these functions can be used anywhere within a program, it is recommended to use them in conjunction with a
defined variable, as demonstrated in "VARIABLE DECLARATION".

 Function		| Syntax								| Description											| Example
----------------|---------------------------------------|-------------------------------------------------------|----------------------------------
int				| `int <value>`							| Creates an integer of given value.					| `define foo int 42` 	
float			| `float <value>`						| Creates a floating-point decimal of given value.		| `define bar float 8.675309`
bool			| `bool <value>`						| Creates a boolean of given value.						| `define far bool false`
string 			| `string <value>`						| Created a string of given value.						| `define boo string "Hello, world!"
array			| `array <length>`						| Creates an array of given length.						| `define fizz array 21`
function		| `function [<params>] :`				| Defines a custom function with n parameters.			| `define buzz function int param1 int param2 :`

In order for the language to forgo order of operations, it is neccesary for variable declarations of custom functions
to be able to determine the number of parameters. This is accomplished through the use of a plier mark `:`, denoting the
end of an infinite parameter sequence. An example exists below in the form of a simple concatenation function.
```
#Example (parens added for clarity):
define TriCat function (string str1) (string str2) (string str3) :
	return + str1 (+ str2 str3)
	
output TriCat "A man, " "a plan, " "a God's 'Nam, "
```
Parameters are accessed through the local variables of `str1`, `str2`, and `str3`, declared before the plier mark above.
Having a return condition is not mandatory, though it is possible. These functions can be used with logic and operator functions. 

### VANILLA FUNCTIONS
Including the data functions above, the following functions are loaded into any program by default. `import` allows for external
library support, essentially adding the referenced file to the current before compile.

 Function		| Syntax								| Description											| Example
----------------|---------------------------------------|-------------------------------------------------------|----------------------------------
 \<variable\>	| `foo`									| Will return the stored value of the variable.			| `foo`
 define			| `define <type> <name> <value>`		| Defines a variable or function (see above).			| `define foo int 12`
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
 if				| `if <boolean>`						| Executes following code block if true.				| `if true`<br>`   output "hi"`
 while			| `while <boolean>	`					| Executes following code block repeatedly until false. | `while true`<br>`   output "hi"`
 for			| `for <runOnce> <boolean> <runEvery>`	| Standard for loop.									| `for (define int i 0) (< i 100) (++ i)` 
 iterate		| `iterate <var> <amount>`				| Adds the given value to the var of type int or float. | `iterate foo 2`
 \+\+			| `++ <var>`							| The equivalent of `iterate <var> 1`					| `++ foo`
 \-\-			| `-- <var>`							| The equivalent of `iterate <var> -1`					| `-- foo`
 toString		| `toString <value>`					| Converts the given value of any type to a string.		| `toString arrayOfAllEnglishWords`
 import			| `import <filename as string>`			| Appends the referenced file to the active program.	| `import "crown_prince.doc.exe"`
 return			| `return <value>`						| Evaluates deepest nested function to equal value.		| `return 42`
 output			| `output <value>`						| Outputs the value to console.							| `output "Hello world!"`
 
### ADDITIONAL SYNTAX
Curly brackets and parenthesis may surround arbitrary code to make it more "human readable".
As the language has no order of operations, these markings are treated as non-characters.
```
#Example:
{ + 1 2 }
if > (+ 1 2) (+ 1 2)
define int foo {- {10 7}) (#This is discouraged but will otherwise have no effect on the code.
)))}){
```

Single line comments are available for developers to provide human-readable code for complex logic.
Good code and good usage of parenthesis will need few if any comments.
```
#Example:
```

Code surrounded in quotation marks will be interpreted as a string. To put quotation marks inside of a string, use `\"`.
```
#Example:
"\"I am a string,\" said the string, which was what he was when he was thinking through that tough thorough thought then."
```

### ARRAY FUNCTIONS
Arrays can be created of arbitrary length by using `define array <arrayName> <length>`. Arrays, 
when called, act as a function expecting one of the following functions to be called.


Array Method			| Definition															| Example
------------------------|-----------------------------------------------------------------------|---------------------------------
`length`				|Returns an integer representing the current size of the array.			|`arr length`
`get <index>`			|Returns value at given index.											|`arr get 0`
`set <index> <value>`	|Sets a given index to the given value.									|`arr set 0 "I'm Pickle Rick"`
`push <value>`			|Sets first index of value void to the given value. If no indexes are void, adds index and sets in that location. Returns index with which value was set.|`arr push "Eleven"` 
```
#Example:
define foo array foo 6
define bar array 0

foo push 82 #void getting replaced
foo push 82
foo push 82
foo push "Lot more than 82 toothpicks there Ray."

bar push void
bar push void
bar push "Ash" #void getting replaced
bar push "Tree"
bar push "Lane"
bar set 3 "Never mind"

output bar get 0
output foo
output bar
```
The above program would output the following. Note the remaining void indexes.
```
Ash
[82,82,82,"Lot more than 82 toothpicks there Ray.",void,void]
["Ash","Tree","Never mind"]
```

### COMPILATION
The language will be compiled using a C based compiler into machine code that can then be run.
This is to ensure that the language runs as fast as possible. However, to get the language started, 
we will be using a Transpiler (Markipiler in American English) likely coded in javascript.

(