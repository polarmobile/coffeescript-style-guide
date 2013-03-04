# CoffeeScript Style Guide

This guide establishes a collection of CoffeeScript coding conventions for teambition dev team to create high-quality and easy-to-cooperte code.

## Variance
The contents of this guide is originated from [polarmobile/coffeescript-style-guide](https://github.com/polarmobile/coffeescript-style-guide), with various additions and customization, with references to the following style guides:
 * [CoffeeScript](http://www.coffeescript.org/)
 * [CoffeeLint](http://www.coffeelint.org/)
 * [idiomatic.js](https://github.com/rwldrn/idiomatic.js)

## Table of Contents
  * [Code Layout](#code_layout)
    * [Indentation](#indentation)
    * [Maximum Line Length](#maximum_line_length)
    * [Blank Lines](#blank_lines)
    * [Trailing Whitespace](#trailing_whitespace)
    * [Encoding](#encoding)
  * [Whitespaces](#whitespace)
    * [General](#whitespace_general)
    * [Alignment](#whitespace_alignment)
  * [New Line](#newline)
  * [Comments](#comments)
  * [Variable Naming](#naming_conventions)
  * [Functions](#functions)
  * [Strings](#strings)
  * [Conditionals](#conditionals)
  * [Looping and Comprehensions](#looping_and_comprehensions)
  * [Type Coercions](#coercion)
  * [Other Preferences](#other_preferences)
  * [Exceptions](#exceptions)
  * [Module Imports](#module_imports)
  * [Extending Native Objects](#extending_native_objects)

<a name="code_layout"/>
## Code layout

<a name="indentation"/>
### Indentation

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

<a name="maximum_line_length"/>
### Maximum Line Length

Limit all lines to a maximum of **79 characters** (80 column width).

<a name="blank_lines"/>
### Blank Lines

Separate function and class definitions with **a single** blank line.

Separate method definitions inside of a class with a **single** blank line.

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

<a name="trailing_whitespace"/>
### Trailing Whitespace

**No trailing whitespace** on any lines.

<a name="encoding"/>
### Encoding

Please use **UTF-8 without BOM** as source file encoding.

<a name="whitespace"/>
## Whitespace Usages

<a name="whitespace_general">
### General

Term ___whitespace___ term implies a **single space** on either hand side, multiple extraneous whitespaces should be always **avoided**. Whether or not to use whitespaces **variants** in different scopes:

**USE** whitespace in the following situations:

- **Around** assignments `=`, including:

  - Variable definition

      ```coffeescript
      foo = "bar"   # Yes
      foo="bar"   # No
      ```
  - Function declairation

     ```coffeescript
     # Yes
     foo = (bar, baz) -> 
     # No
     foo = (bar, baz) -> 
      ...
     ```
  - Default parameter value(s) in a function declaration

     ```coffeescript
     test: (param = null) # Yes
     test: (param=null) # No
     ```
- Immediately **after** a comma `,` or colon `:`

    ```coffeescript
       console.log x, y # Yes

       [foo, bar, baz] # Yes
       [foo,bar,baz] # No

       for foo, bar in Baz  # Yes

       foo = bar: baz # Yes
       foo = bar:baz  # No
    ```
- **Before and after** function indicator arrow `->` or `=>`

    ```coffeescript
       foo = (bar) -> console.log bar   # Yes
       
       # The after space is not required if function body is onto the next line
       foo = (bar) ->      
        console.log bar

    ```
- **Around** JavaScript binary operators:
  - Logical: `&&`, `||`
  - Equallity: `==`, `===`, `!==`
  - Relational: `<`, `>`, `<=`, `>=`
  - Bitwise: `&`, `|`, `^`, `<<`, `>>`, `>>>`
  - Arithmetic: `+`, `-`, `*`, `/`, `%`
  - Augmented assignment: `+=`, `-=`

  
    ```coffeescript
    foo = bar && baz || qux -> # Yes

    foo = bar&&baz||qux -> # No
    ```

**NO** whitespace in the following situations:

  - Immediately inside ALL parentheses, brackets or braces

    ```coffeescript
      foo(foo, bar) # Yes
      foo( foo,bar )  # No

      [foo, bar]  # Yes
      [ foo, bar ]  # No

      {foo: bar}  # Yes
      { foo: bar }  # No

    ```

<a name="whitespace_alignment">
### Alignment

Use Alignment **in only** the following consequences:

- Dependencies
  ```coffeescript
      # Yes
      coffeeScript = require "coffee-script"
      foo          = require "foo"

      # No
      coffeeScript = require "coffee-script"
      foo = require "foo"

    ```
- Routes
  ```coffeescript
    # Yes
    'MVName'            : 'render'
    'MVName|_MVObjectId': 'refreshData'

    # No
    'MVName': 'render'
    'MVName|_MVObjectId': 'refreshData'

You can install the **Alignment** package in Sublime Text Editor to make alignment quickly.

<a name="newline"/>
## New Line

Keep simple statement in a single line.
```coffeescript
  # Yes
  square = (x) -> x * x
  date = if friday then sue else jill
  buy() while supply > demand
```
Multi-line clauses should always open new line.

```coffeescript
  # Yes
  if true
    foo()
  else
    bar()
    baz()

  # No
  if true then foo()
  else
    bar()
    baz()
```

<a name="braces"/>
## Braces Usage
 - Always **use** braces with single-line object literal.
  ```coffeescript
    # Yes
    foo = {name: 'Max', age: 11}
    foo = {name: 'Max'}

    # No
    foo = name: 'Max', age: 11
    foo = name: 'Max'
  ```
 - Always **omit** braces with multi-line object literal.
  ```coffeescript
    # Yes
    kids =
      brother:
        name: 'Max'
        age:  11
      sister:
        name: 'Ida'
        age:  9    

    # No
    kids = 
    {
      brother:
      {
        name: "Max"
        age:  11
      }
      sister:
      {
        name: "Ida"
        age:  9
      }
    }
  ```

<a name="comments"/>
## Comments

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.

If a comment is short, the period at the end can be omitted.

### Inline Comments

Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).

All inline comments should start with a `#` and a single space.

The use of inline comments should be limited, because their existence is typically a sign of a code smell.

Do not use inline comments when they state the obvious:

```coffeescript
  # No
  x = x + 1 # Increment x
```

However, inline comments can be useful in certain scenarios:

```coffeescript
  # Yes
  x = x + 1 # Compensate for border
```


### Block Comments

Block comments apply to the block of code that follows them.

Each line of a block comment starts with a `#` and a single space, and should be indented at the same level of the code that it describes.

Paragraphs inside of block comments are separated by a line containing a single `#`.

```coffeescript
  # This is a block comment. Note that if this were a real block
  # comment, we would actually be describing the proceeding code.
  #
  # This is the second paragraph of the same block comment. Note
  # that this paragraph was separated from the previous paragraph
  # by a line containing a single comment character.

  init()
  start()
  stop()
```

### Annotations

Use annotations when necessary to describe a specific action that must be taken against the indicated block of code.

Write the annotation on the line immediately above the code that the annotation is describing.

The annotation keyword should be followed by a colon and a space, and a descriptive note.

```coffeescript
  # FIXME: The client's current state should *not* affect payload processing.
  resetClientState()
  processPayload()
```

If multiple lines are required by the description, indent subsequent lines with two spaces:

```coffeescript
  # TODO: Ensure that the value returned by this call falls within a certain
  #   range, or throw an exception.
  analyze()
```

Annotation types:

- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation

<a name="naming_conventions"/>
## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes.

For constants, use all uppercase with underscores:

```coffeescript
CONSTANT_LIKE_THIS
```

Methods and variables that are intended to be "private" should begin with a leading underscore:

```coffeescript
_privateMethod: ->
```

<a name="functions"/>
## Functions

_(These guidelines also apply to the methods of a class.)_

Do not use parentheses when declaring functions that take no arguments:

```coffeescript
bar = -> # Yes
bar = () -> # No
```

In cases where method calls are being chained and the code does not fit on a single line, each call should be placed on a separate line and indented by one level (i.e., two spaces), with a leading `.`.

```coffeescript
[1..3]
  .map((x) -> x * x)
  .concat([10..12])
  .filter((x) -> x < 11)
  .reduce((x, y) -> x + y)
```

In functions calls, omit parentheses only if it **maintains readability**:

```coffeescript
# Yes
baz 12
print inspect value

```
Otherwise, use parentheses for clarity:

```coffeescript
# Yes
foo(bar, new Baz(qux))

# No
foo bar, new Baz qux
```

When ambiguility exists in function calls, that requires explicit parentheses: always **group function parameters**, instead of grouping function calls.

```coffeescript
# Yes
$('#selektor').addClass 'klass'
obj.value(10, 20) / obj.value(20, 10)


# No
($ '#selektor').addClass 'klass'
(obj.value 10, 20) / (obj.value 20, 10)
```

<a name="strings"/>
## Strings
 - Prefer single quote `''` whenever possible
  ```coffeescript
  # Yes
  foo = 'bar' 
  foo = {bar: 'baz'}

  # No
  foo = "bar"
  foo = {bar: "baz"}
  ```
 - Use double quote `""` as string interpolation

  ```coffeescript
  "this is an #{adjective} string" # Yes
  "this is an " + adjective + " string" # No
  ```

<a name="conditionals"/>
## Conditionals

Favor `unless` over `if` for negative conditions.

```coffeescript
  # Yes
  uless foo
    ...

  # No
  if !foo
    ...
```

Instead of using `unless...else`, use `if...else`.

```coffeescript
  # Yes
  if true
    ...
  else
    ...

  # No
  unless false
    ...
  else
    ...
```

Favor if expression over ternary `? .. : ..` for conditional assignment.

```coffeescript
  # Yes
  foo = if bar then true else false

  # No
  foo = bar? true : false
```

Favor existential operator `?` to check for variable existence and nullity.

```coffeescript
  # Yes
  if foo? then bar
  foo = bar?.baz
  foo ?= bar

  # No
  if foo is null or foo is undefined then bar
  if bar then foo = bar.baz
  if foo is null then foo = bar
```

Favor truthy/falsy check for variable existence and nullity.

```coffeescript
  # Yes
  if array.length
  if !array.length

  # No
  if array.length is 0
  if array.length isnt 0
```
<a name="looping_and_comprehensions"/>
## Looping and Comprehensions

Take advantage of comprehensions whenever possible:

```coffeescript
# Yes
result = (item.name for item in array)

# No
results = []
for item in array
  results.push item.name
```

To filter array:

```coffeescript
result = (item for item in array when item.name is "test")
```

To iterate over object:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="coercion"/>
## Type Coercions

Convert to Number type with preceeding `+`

```coffeescript
foo = '1'
bar = +foo  # Yes
bar = Number foo   # No
```
Convert to Boolean type with preceeding `!!`

```coffeescript
foo = ''
bar = !!foo  # Yes
bar = Boolean foo   # No
```

Convert to String type with appending `+''`

```coffeescript
foo = 1
bar = foo + ''  # Yes
bar = String foo   # No
```

<a name="other_preferences"/>
## Miscellaneous Preferences

Other syntax preferences over the original JavaScript forms:

`and` is preferred over `&&`.

`or` is preferred over `||`.

`is` is preferred over `==`.

`not` is preferred over `!`.

`or=` should be used when possible:

```coffeescript
temp or= {} # Yes
temp = temp || {} # No
```

Prefer shorthand notation (`::`) for accessing an object's prototype:

```coffeescript
Array::slice # Yes
Array.prototype.slice # No
```

Prefer `@property` over `this.property`.

```coffeescript
return @property # Yes
return this.property # No
```

However, avoid the use of **standalone** `@`:

```coffeescript
return this # Yes
return @ # No
```

Avoid `return` where not required, unless the explicit return increases clarity.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

```coffeescript
console.log args... # Yes

(a, b, c, rest...) -> # Yes
```

<a name="exceptions"/>
## Exceptions

Do not suppress exceptions.

```coffeescript
# No
try somethingWrong() catch error
```  

<a name="module_imports"/>
## Module Imports

If using a module system (CommonJS Modules, AMD, etc.), `require` statements should be placed on separate lines.

```coffeescript
require 'lib/setup'
Backbone = require 'backbone'
```
These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

<a name="#extending_native_objects"/>
## Extending Native Objects

**DO NOT** modify native objects.

For example, do not modify `Array.prototype` to introduce `Array#forEach`.
