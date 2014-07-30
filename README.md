# CoffeeScript Style Guide

This guide establishes a collection of CoffeeScript coding conventions for creating high-quality and easy-to-cooperate CoffeeScript code.

## Code layout

### Optional Commas

Avoid the use of commas before newlines when properties or elements of an Object or Array are listed on separate lines.

```coffeescript
# Yes
foo = [
  'some'
  'string'
  'values'
]
bar:
  label: 'test'
  value: 87

# No
foo = [
  'some',
  'string',
  'values'
]
bar:
  label: 'test',
  value: 87
```

### Indentation

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

### Maximum Line Length

Limit all lines to a maximum of **79 characters** (80 column width).

### Blank Lines

Separate function and class definitions with **a single** blank line.

Separate method definitions inside of a class with a **single** blank line.

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

### Trailing Whitespace

**No trailing whitespace** on any lines.

### Encoding

Please use **UTF-8 without BOM** as source file encoding.

## Whitespace Usages

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

- **Around** binary operators:
  - Logical: `and`, `or`
  - Equallity: `is`, `isnt`
  - Relational: `<`, `>`, `<=`, `>=`
  - Arithmetic: `+`, `-`, `*`, `/`, `%`
  - Augmented assignment: `+=`, `-=`

    ```coffeescript
    foo > bar # Yes
    foo>bar # No
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

## Braces Usage

braces in object literal is **not recommended**.

```coffeescript
# Yes
foo = name: 'Max', age: 11
foo = name: 'Max'

# Yes
kids =
  brother:
    name: 'Max'
    age:  11
  sister:
    name: 'Ida'
    age:  9

# No
foo = {name: 'Max', age: 11}
foo = {name: 'Max'}

# No
kids = {
  brother: {
    name: 'Max'
    age:  11
  }
  sister: {
    name: 'Ida'
    age:  9
  }
}
```

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

### Functions
Comments on head of functions should indicate the usage and the definitions of params:

```coffeescript
# Say hello to customer
# @param {String} name of customer
# @return {String} welcoming message
sayHello = (customer) -> "Hello, #{customer}"
```

Annotation types:

- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation

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

Do not use parentheses when function can be easily read

```coffeescript
# Yes
require 'util'
foo 'a', 'b'
bar = new Bar
foo bar
foo 1, ->

# No
require('util')
foo('a', 'b')
foo(new Bar())
foo(1, (->))
```

## Strings

Use single quote `''` whenever possible

```coffeescript
# Yes
foo = 'bar'
foo = bar: 'baz'

# No
foo = "bar"
foo = bar: "baz"
```

Use double quote `""` as string interpolation

```coffeescript
# Yes
"this is an #{adjective} string"

# No
"this is an " + adjective + " string"
```

## Conditionals

Use `true` instead of `yes`

```coffeescript
# Yes
obj =
  added: true

# No
obj =
  added: yes
```

Favor `unless` over `if` for negative conditions.

```coffeescript
# Yes
unless foo
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
foo = bar ? true : false
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
unless array.length

# No
if array.length is 0
if array.length isnt 0
```

## Looping and Comprehensions

Take advantage of comprehensions whenever possible:

```coffeescript
# Yes
result = item.name for item in array

# No
results = []
for item in array
  results.push item.name
```

To filter array:

```coffeescript
result = item for item in array when item.name is "test"
```

To iterate over object:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

## Inheritance

Always use coffeescript's class inheritance for sub-classing instead of using extend-alike method provided by various JS libraries:

```coffeescript
# Yes
class foo extends bar

# No
foo = extends(bar,...)
```

Use coffeescript's **super** in overriden methods to invoke parent method instead of explicitly calling parent's method, simply use ```super``` when no explicit params modification is required:

```coffeescript
# Yes
class bar
  baz: ->
    ...

class foo extends bar
  baz: ->
    super
    ...

# No
class bar
  baz : ->
    ...

class foo extends bar
  baz : ->
    bar.prototype.baz.apply(this, arguments)
    ...

```

## Module Imports

If using a module system (CommonJS Modules, AMD, etc.), `require` statements should be placed on separate lines.

```coffeescript
# Yes
Backbone = require('backbone')
{Schema, Model} = require('mongoose')
```

These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

## Module Exports

```coffeescript
# Yes
# class
class A
  foo: -> 'bar'

module.exports = A

# functions
moduleName = module.exports
moduleName.foo = -> 'bar'

# No
# class
module.exports = class A
  foo: -> 'bar'

# functions
exports.foo = -> 'bar'
```

## Miscellaneous Preferences

Other syntax preferences over the original JavaScript forms:

- Use `and` instead of `&&`
- Use `or` instead of `||`
- Use `is` instead of `==`
- Use `not` instead of `!`
- Use `or=` should be used when possible:

  ```coffeescript
  temp or= {} # Yes
  temp = temp || {} # No
  ```
- Use shorthand notation (`::`) for accessing an object's prototype:

  ```coffeescript
  Array::slice # Yes
  Array.prototype.slice # No
  ```

- Use `@property` instead of `this.property`.

  ```coffeescript
  return @property # Yes
  return this.property # No
  ```

  However, avoid the use of **standalone** `@`:

  ```coffeescript
  return this # Yes
  return @ # No
  ```

- Avoid `return` where not required, unless the explicit return increases clarity.

- Use splats (`...`) when working with functions that accept variable numbers of arguments:

  ```coffeescript
  console.log(args...) # Yes
  (a, b, c, rest...) -> # Yes
  ```

## Variance
The contents of this guide is originated from [polarmobile/coffeescript-style-guide](https://github.com/polarmobile/coffeescript-style-guide), with various additions and modifies, with references to the following style guides:
 * [CoffeeScript](http://www.coffeescript.org/)
 * [CoffeeLint](http://www.coffeelint.org/)
 * [idiomatic.js](https://github.com/rwldrn/idiomatic.js)
