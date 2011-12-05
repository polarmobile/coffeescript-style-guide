# CoffeeScript style guide

[CoffeeScript](http://jashkenas.github.com/coffee-script/) is the main client-side language used to write code for Polar Mobile.  This style guide is a list of coding conventions to be followed when writing CoffeeScript code.

## Code layout

### Tabs or spaces?

Never mix tabs and spaces. Use spaces only and use 2 spaces per indentation level.

Code indented with a mixture of tabs and spaces should be converted to using spaces exclusively.

### Maximum line length

Limit all lines to a maximum of 79 characters.

### Blank lines

Separate top-level function and class definitions with a single blank line.

Method definitions inside a class are also separated by a single blank line.

Single blank lines may also be used within methods and functions to indicate logical sections.

### Encoding

UTF-8 is the preferred encoding.

## Requires/exports

If using CommonJS, require statements should be on separate lines:

      require 'lib/setup'
      Backbone = require 'backbone'

Requires should be grouped in the following order:

1.  Third party library requires.
2.  Local application/library specific requires.

Exports should be at the bottom:

      module.exports = App

## Whitespace 

### Expressions and statements

Avoid extraneous whitespace in the following situations.

Immediately inside parentheses, brackets or braces:

      ($ 'body') # Yes
      ( $ 'body' ) # No

Immediately before the open parenthesis that starts an indexing or slicing:

      views['keys'] # Yes
      views ['key'] # No

More than one space around an assignment (or other) operator to align it with another:

      # Yes
      x = 1
      y = 1
      longVariable = 3
      
      # No
      x            = 1
      y            = 1
      longVariable = 3

### Other recommendations

Always surround these binary operators with a single space on either side: assignment `=`, augmented assignment `+=`, `-=` etc..., comparisons `==`, `<`, `>`, `<=`, `>=`, `unless`, etc..., arithmetic operators.

Don't use spaces around the `=` sign when used to indicate a default parameter value:

      test: (param=null) -> # Yes

Don't put conditional and iterator statements on one line if they are multi-clause statements.

## Comments

Comments should be complete sentences.  If a comment is a phrase or sentence, its first word should be capitalized, unless it is an identifier that begins with a lower case letter.

If a comment is short, the period at the end can be omitted.  Block comments generally consist of one or more paragraphs built out of complete sentences, and each sentence should end in a period.

Use two spaces after a sentence-ending period.

### Block comments

Block comments generally apply to some (or all) code that follows them, and are indented to the same level as that code.  Each line of a block comment starts with a # and a single space (unless it is indented text inside the comment).

Paragraphs inside a block comment are separated by a line containing a single #.

### Inline comments

Use inline comments sparingly.

Inline comments are unnecessary and in fact distracting if they state the obvious.

An inline comment is a comment on the line above the statement.  If they are short enough, the can be on the same line as a statement and separated by a space from the statement.  They should start with a # and a single space.

## Naming conventions

Use camel case to name all classes, modules/mixins, methods, variables etc...

For constants, use all uppercase with underscores:

      CONSTANT_LIKE_THIS

There is no concept of private methods in JavaScript/CoffeeScript, methods and variables meant to be private should start with `_`:

      _privateMethod: ->

## Functions/methods

When declaring functions/methods, if it contains arguments, there should be a single space before the opening parenthesis of the arguments list and after the closing parenthesis:

      methodName: (arg1, arg2) -> # Yes
      methodName:(arg1, arg2)-> # No

Functions/methods that take no arguments require no parenthesis before the arrow:

      methodName: -> # Yes
      methodName: () -> # No

Don't use parentheses when calling functions/methods:

      @myfunc 'string'

The general rule is that the final method call in a chain should omit the parentheses:

      elem = ($ '#mySelector').addClass 'testing'

## Strings

Use single quotes `''` instead of double quotes `""` for strings.

## Conditionals

Instead of using `unless...else`, use `if...else`:

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
Multi-line if/elses should use indentation:

      # Yes
      if true
        ...
      else
      
      # No
      if true then ...
      else ...

## Loops and iterators

Instead of using for loops and while loops for iterating through arrays, you should use `for-in` whenever possible:

      result = (item.name for item in array)

and use `for-in-when` for filtering:

      result = (item for item in array when item.name is "test")

If comprehensions get too long, you can split them onto multiple lines:

      for score in [49, 58, 76, 82, 88, 90]
        (if score > 60 then passed else failed).push score

To iterate over objects, use `for-of`:

      object = {one: 1, two: 2}
      alert("#{key} = #{value}") for key, value of object

## Private variables

The `do` keyword should be used to execute functions immediately.  This allows you to encapsulate scope and have private variables:

      # Execute function immediately
      type = do ->
        classToType = {}
        for name in "Boolean Number String Function Array Date RegExp Undefined Null".split(" ")
          classToType["[object " + name + "]"] = name.toLowerCase()
          
        # Return a function
        (obj) ->
          strType = Object::toString.call(obj)
          classToType[strType] or "object"

## Exceptions

If you're doing something non-trivial, feel free to use exceptions.

Custom exceptions may also be used in order to return more descriptive error information.

## Other

CoffeeScript prefers to use parentheses to group methods, rather than group method parameters. For example, jQuery `$` without a parenthesis:

      ($ '#mySelector') # Yes
      $('#mySelector') # No

You should use `...` to de-structure an array and pass it as multiple arguments to a method:

      console.log args...

`or` is preferred over `||`, and `and` is preferred over `&&`

`is` is preferred over `==`

`or=` should be used when possible:

      temp or= {} # Yes
      temp = temp || {} # No

If accessing prototype, a shortcut is `::`:

      Array:slice # Yes
      Array.prototype.slice # No