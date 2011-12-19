# CoffeeScript Style Guide

This guide presents a collection of best-practices and coding conventions for the [CoffeeScript][coffeescript] programming language.

This guide is intended to be community-driven, and contributions are highly encouraged.

Please note that this is a work-in-progress: there is much more that can be specified, and some of the guidelines that have been specified may not be deemed to be idiomatic by the community (in which case, these offending guidelines will be modified or removed, as appropriate).

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

<a name="code_layout"/>
## Code layout

<a name="tabs_or_spaces"/>
### Tabs or Spaces?

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

<a name="maximum_line_length"/>
### Maximum Line Length

Limit all lines to a maximum of 79 characters.

<a name="blank_lines"/>
### Blank Lines

Separate top-level function and class definitions with a single blank line.

Separate method definitions inside of a class with a single blank line.

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

<a name="trailing_whitespace"/>
### Trailing Whitespace

Do not include trailing whitespace on any lines.

<a name="encoding"/>
### Encoding

UTF-8 is the preferred source file encoding.

<a name="module_imports"/>
## Module Imports

If using a module system (CommonJS Modules, AMD, etc.), `require` statements should be placed on separate lines.

    require 'lib/setup'
    Backbone = require 'backbone'

These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

<a name="whitespace"/>
## Whitespace in Expressions and Statements

Avoid extraneous whitespace in the following situations:

- Immediately inside parentheses, brackets or braces

          ($ 'body') # Yes
          ( $ 'body' ) # No

- Immediately before a comma

          console.log x, y # Yes
          console.log x , y # No

Additional recommendations:

- Always surround these binary operators with a **single space** on either side

    - assignment: `=`
    - augmented assignment: `+=`, `-=`, etc.
    - comparisons: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
    - arithmetic operators: `+`, `-`, `*`, `/`, etc.

    - _(Do not use more than one space around these operators)_

              # Yes
              x = 1
              y = 1
              fooBar = 3

              # No
              x      = 1
              y      = 1
              fooBar = 3

- Do not use spaces around the `=` sign when used to indicate a default parameter value

          test: (param=null) -> # Yes
          test: (param = null) -> # No

<a name="comments"/>
## Comments

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.

If a comment is short, the period at the end can be omitted.

<a name="block_comments"/>
### Block Comments

Block comments generally apply to some (or all) code that follows them, and are indented to the same level as that code.  Each line of a block comment starts with a `#` and a single space (unless it is indented text inside the comment).

Paragraphs inside of block comments are separated by a line containing a single `#`.

    # This is a block comment. Note that if this were a real block
    # comment, we would be actually describing the proceeding code.
    #
    # This is the second paragraph of the same block comment. See
    # previous paragraph.

    init()
    start()
    stop()

<a name="inline_comments"/>
### Inline Comments

Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).

All inline comments should start with a `#` and a single space.

The use of inline comments should be limited, because their existence is typically a sign of a code smell.

Do not use inline comments when they state the obvious:

    # No
    x = x + 1 # Increment x

However, inline comments can be useful in certain scenarios:

    # Yes
    x = x + 1 # Compensate for border

<a name="naming_conventions"/>
## Naming Conventions

Use camelCase to name all classes, modules/mixins, methods, variables, etc.

For constants, use all uppercase with underscores:

      CONSTANT_LIKE_THIS

Methods and variables that are intended to be "private" should begin with a leading underscore:

      _privateMethod: ->

(The _official_ CoffeeScript convention is camelCase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)

<a name="functions"/>
## Functions

_(These guidelines also apply to the methods of a class.)_

When declaring a function that takes arguments, always use a single space after the closing parenthesis of the arguments list:

    foo = (arg1, arg2) -> # Yes
    foo = (arg1, arg2)-> # No

Do not use parentheses when declaring functions that take no arguments:

    bar = -> # Yes
    bar = () -> # No

In cases where method calls are being chained and the code does not fit on a single line, each call should be placed on a separate line and indented by one level (i.e., two spaces), with a leading `.`.

    [1..3]
      .map((x) -> x*x)
      .concat([10..12])
      .filter((x) -> x < 11)
      .reduce((x, y) -> x + y)

When calling functions, omit the parentheses on the final method call in a chain. For example:

    baz 12

    foo(4).bar 8

You will sometimes see parentheses used to group functions (instead of being used to group function parameters). An example of using this style (hereafter referred to as the "function grouping style"):

    ($ '#selektor').addClass 'klass'

This is in contrast to:

    $('#selektor').addClass 'klass'

The correct way to apply the function grouping style when chaining is to use it for the initial call only:

    ($ '#selektor').addClass('klass').hide() # Yes
    ($ '#selektor').(addClass 'klass').hide() # No

**If this function grouping style is adopted for a particular project, be consistent with its usage.**

<a name="strings"/>
## Strings

Use string interpolation instead of string concatenation:

    "this is an #{adjective} string" # Yes
    "this is an " + adjective + " string" # No

Prefer single quoted strings (`''`) instead of double quoted (`""`) strings, unless features like string interpolation are being used for the given string.

<a name="conditionals"/>
## Conditionals

Favor `unless` over `if` for negative conditions.

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

Multi-line if/else clauses should use indentation:

      # Yes
      if true
        ...
      else
        ...

      # No
      if true then ...
      else ...

<a name="looping_and_comprehensions"/>
## Looping and Comprehensions

Take advantage of comprehensions whenever possible:

    # Yes
    result = (item.name for item in array)

    # No
    results = []
    for item in array
      results.push item.name

To filter:

      result = (item for item in array when item.name is "test")

To iterate over the keys and values of objects:

      object = one: 1, two: 2
      alert("#{key} = #{value}") for key, value of object

<a name="#extending_native_objects"/>
## Extending Native Objects

Do not modify native objects.

For example, do not modify `Array.prototype` to introduce `Array#forEach`.

<a name="exceptions"/>
## Exceptions

Do not suppress exceptions.

<a name="annotations"/>
## Annotations

Use annotations when necessary to describe a specific action that must be taken against the indicated block of code.

Write the annotation on the line immediately above the code that the annotation is describing.

The annotation keyword should be followed by a colon and a space, and a descriptive note.

    # FIXME: The client's current state should *not* affect payload processing.
    resetClientState()
    processPayload()

If multiple lines are required by the description, indent subsequent lines with two spaces:

    # TODO: Ensure that the value returned by this call falls within a certain
    #   range, or throw an exception.
    analyze()

Annotation types:

- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation

If a custom annotation is required, the annotation should be documented in the project's README.

<a name="miscellaneous"/>
## Miscellaneous

`and` is preferred over `&&`.

`or` is preferred over `||`.

`is` is preferred over `==`.

`not` is preferred over `!`.

`or=` should be used when possible:

      temp or= {} # Yes
      temp = temp || {} # No

Prefer shorthand notation (`::`) for accessing an object's prototype:

      Array::slice # Yes
      Array.prototype.slice # No

Prefer `@property` over `this.property`.

Avoid `return` where not required, unless the explicit return increases clarity.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

      console.log args... # Yes

      (a, b, c, rest...) -> # Yes

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
