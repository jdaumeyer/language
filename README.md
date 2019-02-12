# Custom Programming Language
### An Innovation Lab Passion Project
## Goal
* Make a functional programming language
* Definition of functional programming - everything is based on functions within the programming language. Functions in programming are a stored set of commands that usually require data  to be inputted to run.
* The language will be demonstrated through a series of examples hosted on a website to show its capabilities. Possibly a small game to further show the performance of the language
Guidelines
* Prioritize efficiency and speed while maintaining clean and readable code.
* Readable code without comments. Don’t arbitrarily shorten commands. If command is shortened than an original version that does the same.
* Keep the list of commands as simple as possible to make the language simpler to learn
* Code is treated like data, able to be stored moved and applied.
* Functions are meant to be pure, meaning that we will have to provide a library for standard input and output.
* All data remains constant, It is only changed from functions.
## Syntax
### Basic Structure:
Function precedes the parameters. This way the program will run faster on stack memory systems.
```
Example:
+ 1 2         // Adds 1 and 2
Fibonacci 5   // Calculates the 5th Fibonacci number
```
        
Curly Brackets surround all code in order to make it  easier on the compiler to separate code in order to determine what to run when
```
Example:
{ + 1 2 }
if > 1 2 + 1 2
```
### Data Types:
The list of data types is able to be kept so small due to data having a dynamically created size. Instead of having a hard cap on the size of a variable, the language will look at the variable’s value and give it the size needed. This however is a fixed size as all variables are immutable.

Type     | Description                                |Example
---------|--------------------------------------------|-----------------------------------------
Integers | Basic numbers dynamically allocated size   | `int = foo <integer>`
Strings  |Plain Text                                  | `string = bar <string without quotes>`
Booleans | True or false                              | `boolean = fizz <reserved word true/false>`
Floats   | Decimal Numbers                            | `float = buzz <decimal>`
Arrays   | A list of any of the above data types      | `array = names <length>`

### Operators:
   Follows the format
   `<operator> <value1> <value2>`
   
Opperator                                                   | Effect
------------------------------------------------------------|---------------------------------------------------
Assignment (=)                                              | This operator is special as it doesn’t return anything (all others do).<br>Value1 is the variable name<br>Value2 is the value to assign.
Addition (+)                                                |Value1 is an integer, string, boolean, float, or array.<br>For strings it appends the data to the string<br>Value2 is the same, but must match the type of Value1.
Subtraction (-)                                             |
Multiplication (*)                                          |
Division (/)                                                |
Modulus (%)                                                 |
Less Than / Greater Than (<) (>)                            |
Less Than or Equal To / Greater Than or Equal To (<=) (>=)  |
### Keywords:
Kept down to just the basics to make the language a lot easier to learn and keep it from becoming too verbose. In the future more keywords may need to be added but these should be kept to the absolute minimum. If it’s possible, instead of adding a new keyword it is preferable to add the functionality into a standard library. 

Keyword       | Description
--------------|-------------------------------------------------
function (f)  | Defines a function
if (i)        | Comparison statement, only runs code if the provided boolean is true
do (d)        | Do code while a condition is true
true (t)      | Evaluates to true, is accepted by conditionals
false (f)     | Evaluates to false, is rejected by conditionals
undefined (u) | Used when a variable is declared but not assigned a value.
int (n)       | Declares an integer variable
string (s)    | Declares a string variable
float (p)     | Declares a float
bool (b)      | Declares a boolean
array (a)     | Declares an array
import (m)    | During compilation, appends the selected file to the top of the source code
return (r)    | Returns a value as the output of a function

### Compilation
The language will be compiled, using a C based compiler, into machine code that can then be run. This is to ensure that the language runs as fast as possible. However, to get the language started, we will be using what’s called a transpiler. Which essentially takes our language and puts it into another, likely C. 

### Standard Library Functions
These are functions that are built into the language. They are useable in every program without having to be imported. This means that they are basic functions that are used for simple operations.

Function          | Effect
------------------|------------------------------------------
add x y           | Adds x and y together
subtract x y      | Subtracts y from x
multiply x y      | Multiplies x by y
divide x y        | Dividex x by y
iterate x         | returns the value of x + 1
compare x y       | compares x and y. `true` if they are equal, `false` if not
output x          | prints x to the terminal







