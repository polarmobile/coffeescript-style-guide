# CoffeeScript Style Guide

This is a HuzuTech-local version of the canonical [CoffeeScript style guide](https://github.com/polarmobile/coffeescript-style-guide) created by [polarmobile](https://github.com/polarmobile).

## Inspiration

The details in this guide have been very heavily inspired by several existing style guides and other resources. In particular:

- [PEP-8][pep8]: Style Guide for Python Code
- Bozhidar Batsov's [Ruby Style Guide][ruby-style-guide]
- [Google's JavaScript Style Guide][google-js-styleguide]
- [Common CoffeeScript Idioms][common-coffeescript-idioms]
- Thomas Reynolds' [CoffeeScript-specific Style Guide][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [code review][spine-js-code-review] of [Spine][spine-js]
- The [CoffeeScript FAQ][coffeescript-faq]

## Table of Contents

* [The CoffeeScript Style Guide](#guide)
    * [Code Layout](#code_layout)
        * [Tabs or Spaces?](#tabs_or_spaces)
        * [Maximum Line Length](#maximum_line_length)
        * [Blank Lines](#blank_lines)
        * [Trailing Whitespace](#trailing_whitespace)
        * [Encoding](#encoding)
    * [Module Imports](#module_imports)
    * [Whitespace in Expressions and Statements](#whitespace)
    * [Comments](#comments)
        * [Block Comments](#block_comments)
        * [Inline Comments](#inline_comments)
    * [Naming Conventions](#naming_conventions)
    * [Functions](#functions)
    * [Strings](#strings)
    * [Conditionals](#conditionals)
    * [Looping and Comprehensions](#looping_and_comprehensions)
    * [Extending Native Objects](#extending_native_objects)
    * [Exceptions](#exceptions)
    * [Annotations](#annotations)
    * [Miscellaneous](#miscellaneous)
    * [Gotchas and Best Practices](#gotchas_and_best_practices)
        * [Calling Methods](#calling_methods)
        * [Fat and Thin Arrows](#fat_and_thin_arrows)
        * [Closures in Loops](#closures_in_loops)

<a name="code_layout"/>
## Code layout

<a name="tabs_or_spaces"/>
### Tabs or Spaces?

Use **spaces only**, with **4 spaces** per indentation level. Never mix tabs and spaces.

<a name="maximum_line_length"/>
### Maximum Line Length

Limit all lines to a maximum of 120 characters.

<a name="blank_lines"/>
### Blank Lines

Separate top-level function and class definitions with a single blank line.

Separate method definitions inside of a class with a single blank line.

SPARINGLY use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

<a name="trailing_whitespace"/>
### Trailing Whitespace

Do not include trailing whitespace on any lines.

<a name="encoding"/>
### Encoding

UTF-8 is the preferred source file encoding.

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

<a name="whitespace"/>
## Whitespace in Expressions and Statements

Avoid extraneous whitespace in the following situations:

- Immediately inside parentheses, brackets or braces

    ```coffeescript
       ($ 'body') # Yes
       ( $ 'body' ) # No
    ```

- Immediately before a comma

    ```coffeescript
       console.log x, y # Yes
       console.log x , y # No
    ```

Additional recommendations:

- Always surround these binary operators with a **single space** on either side

    - assignment: `=`

        - _Note that this also applies when indicating default parameter value(s) in a function declaration_

           ```coffeescript
           test: (param = null) -> # Yes
           test: (param=null) -> # No
           ```

    - augmented assignment: `+=`, `-=`, etc.
    - comparisons: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
    - arithmetic operators: `+`, `-`, `*`, `/`, etc.

    - _(Assignment operators can be aligned on the operator if this makes the code more readable)_

        ```coffeescript
           x      = 1
           y      = 1
           fooBar = 3
           
           x     : 1
           y     : 1
           fooBar: 3
        ```

<a name="comments"/>
## Comments

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

Comments should be written as sentences -- so the first word should be capitalised (unless referring to a variable that begins with a lower-case letter), and they should end with a full stop.

We use [CODO](https://github.com/HuzuTech/codo) to autogenerate documentation from comments.

<a name="block_comments"/>
### Block Comments

Block comments should be used sparingly -- generally at the head of a file, to specify a license or other metadata.

```coffeescript
  ### 
  This is a block comment. It should introduce a large grouping of code (e.g. a class),
  and should not be used for general commenting unless it's crucial to draw attention to 
  the comment.
  ###

  init()
  start()
  stop()
```

<a name="inline_comments"/>
### Inline Comments

Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).

All inline comments should start with a `#` and a single space.

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

<a name="naming_conventions"/>
## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives][camel-case-variations].)_

_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)_

For constants, use all uppercase with underscores:

```coffeescript
CONSTANT_LIKE_THIS
```

<a name="functions"/>
## Functions

_(These guidelines also apply to the methods of a class.)_

When declaring a function that takes arguments, always use a single space after the closing parenthesis of the arguments list:

```coffeescript
foo = (arg1, arg2) -> # Yes
foo = (arg1, arg2)-> # No
```

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

When calling functions, choose to omit or include parentheses in such a way that optimizes for readability. Keeping in mind that "readability" can be subjective, the following examples demonstrate cases where parentheses have been omitted or included in a manner that the community deems to be optimal:

```coffeescript
baz 12

brush.ellipse x: 10, y: 20 # Braces can also be omitted or included for readability

foo(4).bar(8)

obj.value(10, 20) / obj.value(20, 10)

print inspect value

new Tag(new Value(a, b), new Arg(c))
```

<a name="strings"/>
## Strings

Use string interpolation instead of string concatenation:

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
```

Prefer double quoted strings (`""`) over single quoted (`''`) strings.

<a name="conditionals"/>
## Conditionals

Favor `unless` over `if` for negative conditions.

Instead of using `unless...else`, use `if...else`:

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

Multi-line if/else clauses should use indentation:

```coffeescript
  # Yes
  if true
    ...
  else
    ...

  # No
  if true then ...
  else ...
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

To filter:

```coffeescript
result = (item for item in array when item.name is "test")
```

To iterate over the keys and values of objects:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="miscellaneous"/>
## Miscellaneous

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

Avoid `return` where not required, unless the explicit return increases clarity.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

```coffeescript
console.log args... # Yes

(a, b, c, rest...) -> # Yes
```

<a name="gotchas_and_best_practices"/>
## Gotchas and Best Practices

<a name="calling_functions"/>
### Calling Functions

When calling a function with no arguments *remember to include the parenthesis*.

```coffeescript
@function   # Hours of fruitless debugging
@function() # Passing tests
```

<a name="fat_and_thin_arrows"/>
### Fat and Thin Arrows

The 'Fat Arrow' (`=>`) operator is syntactic sugar to bind `this` to the entity creating the function (where `this` would otherwise refer to the function itself). This is very useful when creating anonymous functions in the context of class methods:

```coffeescript
example: (otherClass) ->
    otherClass.bind "event", =>
        @anotherMethod
```

The Fat Arrow should *not*, in normal circumstances, be used to declare class methods:

```coffeescript
example: (otherClass) => # no

example: (otherClass) -> # yes
```

One extraordinary circumstance may be that the class method in question is intended to be referred to by function name elsewhere:

```coffeescript
example: (otherClass) =>
    @anotherMethod()
    
otherExample: (otherClass) ->
    otherClass.bind "event", @example
```

This should be used very sparingly. There are better alternatives, the most obvious being to declare an anonymous function and bind there:

```coffeescript
example: (otherClass) ->
    @anotherMethod()
    
otherExample: (otherClass) ->
    otherClass.bind "event", => @example()
```

When this is difficult (e.g. when an event must be programmatically unbound), use an ad-hoc named function:

```coffeescript
example: (otherClass) ->
    @anotherMethod()
    
otherExample: (otherClass) ->
    namedFunction = => @example()
    otherClass.bind "event", namedFunction
```

<a name="closures_in_loops"/>
## Closures in Loops

CoffeeScript fixes many of Javascript's scoping issues, but it nevertheless IS effectively Javascript, and inherits Javascript's overall scoping strategy: function scoping.

Unlike, for example, Java, Javascript does not use block scoping:

```coffeescript
for i in [1, 2, 3, 4]
    otherClass.bind "event", -> console.log i

otherClass.trigger "event"
```

In the above example, four events are bound to `otherClass`. We might expect that each event would log, respectively, 1, 2, 3 and 4 to the console. In fact, *all four events will log the number 4*. This is because the Javascript scoping rules do not lead to the creation of a new variable `i` on each iteration of the loop; rather, `i` is 'hoisted' to the beginning of its parent function, as we can see in the Javascript compiled from the above:

```javascript
(function() {
  var i, _i, _len, _ref;

  _ref = [1, 2, 3, 4];
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    i = _ref[_i];
    otherClass.bind("event", function() {
      return console.log(i);
    });
  }

  otherClass.trigger("event");

}).call(this);
```

The variable `i` is declared at the head of the function, and maintains its scope through that function. When we 'close' over `i` in the function bound to `event`, we create a reference to the scope in which `i` exists. So, when `event` is triggered, the value of `i` will be logged to the console; and presuming `event` is triggered after the last iteration of the loop, the value of `i` will be 4.

The way to avoid this awkward behaviour is to leverage Javascript's function scoping. Variables *passed into* a function are given their own scope within that function, so presuming we create and execute a function at each iteration of the loop, we can use that function's independent scope to isolate our variable. CoffeeScript makes it simple to create an immediately-executing function using the `do` keyword:

```coffeescript
for i in [1, 2, 3, 4]
    do (i) ->
        otherClass.bind "event", -> console.log i

otherClass.trigger "event"
```

This version of the code will result in four separate events being bound, which will log, respectively, 1, 2, 3 and 4. We pass the variable `i` as an argument to the anonymous function created using the `do` keyword, resulting in a new scope being created for `i` on each iteration of the loop. See the compiled Javascript:

```javascript
(function() {
  var i, _fn, _i, _len, _ref;

  _ref = [1, 2, 3, 4];
  _fn = function(i) {
    return otherClass.bind("event", function() {
      return console.log(i);
    });
  };
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    i = _ref[_i];
    _fn(i);
  }

  otherClass.trigger("event");

}).call(this);
```


[coffeescript]: http://jashkenas.github.com/coffee-script/
[coffeescript-issue-425]: https://github.com/jashkenas/coffee-script/issues/425
[spine-js]: http://spinejs.com/
[spine-js-code-review]: https://gist.github.com/1005723
[pep8]: http://www.python.org/dev/peps/pep-0008/
[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[google-js-styleguide]: http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml
[common-coffeescript-idioms]: http://arcturo.github.com/library/coffeescript/04_idioms.html
[coffeescript-specific-style-guide]: http://awardwinningfjords.com/2011/05/13/coffeescript-specific-style-guide.html
[coffeescript-faq]: https://github.com/jashkenas/coffee-script/wiki/FAQ
[camel-case-variations]: http://en.wikipedia.org/wiki/CamelCase#Variations_and_synonyms
