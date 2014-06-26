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
        * [Optional Commas](#optional_commas)
        * [Object declaration](#object_declaration)
        * [Encoding](#encoding)
    * [Whitespace in Expressions and Statements](#whitespace)
    * [Comments](#comments)
        * [Block Comments](#block_comments)
        * [Inline Comments](#inline_comments)
    * [Naming Conventions](#naming_conventions)
    * [Javascript-specific classes](#js_specific_classes)
    * [Promises](#promises)
    * [Functions](#functions)
    * [Strings](#strings)
    * [Conditionals](#conditionals)
    * [Extending Native Objects](#extending_native_objects)
    * [Exceptions](#exceptions)
    * [Ember](#ember)
        * [Module Imports](#module_imports)
        * [Computed properties & observer syntax](#computed_properties_observer)
        * [Overriding Ember.Object-methods](#overriding_ember_object_methods)
        * [Define abbreviations](#define_abbreviations)
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

Separate method definitions inside of a class with a single blank line. Don't separate `Ember.computed`-properties by blank lines, group them by topic:

```coffeescript
DRIVING_AGE_US = 16
RUNTASTIC_AGE  = 13
gte            = Ember.computed.gte
not            = Ember.computed.not

Ember.Object.extend
  
  # Yes
  allowedToDrive: gte('age', DRIVING_AGE_US)
  notAllowedToDrive: not('allowedToDrive')
  
  allowedRegistration: gte('age', RUNTASTIC_AGE)
 
  # No
  allowedToDrive: gte('age', DRIVING_AGE_US)

  notAllowedToDrive: not('allowedToDrive')
  allowedRegistration: gte('age', RUNTASTIC_AGE)
```  

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

<a name="trailing_whitespace"/>
### Trailing Whitespace

Do not include trailing whitespace on any lines.

<a name="optional_commas"/>
### Optional Commas

Use commas in arrays and avoid them on properties of objects.

```coffeescript
# Yes
foo = [
  'some',
  'string',
  'values'
]

bar:
  label: 'test'
  value: 87
  options: 100

# No
foo = [
  'some'
  'string'
  'values'
]

bar:
  label: 'test',
  value: 87,
  options: 100
```

Pass an array to a function:

```coffeescript
mergedColors = mergeColors([
  red,
  blue,
  green
])
```

<a name="object_declaration"/>
### Object declaration

When an object declaration fits in a single line use 'inline-style': 
```coffeescript
bar = { name: 'xy', age: 10 } # Yes

# No
bar = 
   name: 'xy'
   age: 10
```

Unless objects are nested:
```coffeescript   
article =
  body: 'I am the body'
  author: 
   name: 'Author'
   age: 20
```

<a name="encoding"/>
### Encoding

UTF-8 is the preferred source file encoding.

<a name="whitespace"/>
## Whitespace in Expressions and Statements

Avoid extraneous whitespace in the following situations:

- Immediately inside parentheses or brackets

 ```coffeescript
 $('body') # Yes
 $( 'body' ) # No
 
 ["red", "blue"] # Yes
 [ "red", "blue" ] # No
 ```

- Immediately before a comma

 ```coffeescript
 console.log(x, y) # Yes
 console.log(x , y) # No
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

    - Always align multiple variable assignments:

        ```coffeescript
        # Yes
        x      = 1
        y      = 1
        fooBar = 3
        
        # No
        x = 1
        y = 1
        fooBar = 3
        ```

<a name="comments"/>
## Comments

Document your code following this style: [Biscotto](https://github.com/atom/biscotto)

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

If a comment is short, the period at the end can be omitted.

<a name="block_comments"/>
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

<a name="inline_comments"/>
### Inline Comments

Don't use inline comments. Use properly named functions instead.

```coffeescript
# Yes
compensateForBorder = (borderPx, offset) ->
  borderPx + offset

x = compensateForBorder(x, 1)

# No
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

Methods that are intended to be "private" should begin with a leading underscore:

```coffeescript
_privateMethod: ->
```

Use a leading `$` for jQuery elements or collections: 
```coffeescript
$element = $('#element')
```

<a name="js_specific_classes" />
## Javascript-specific classes
Use additional JS-specific classes to seperate logic and styling. Use following naming conventions:
  * Choose meaningful class names
  * If a 'styling' class already exists, prefix it with 'js-'
  * If the element has no 'styling' class, choose your own with 'js-' prefix

```coffeescript
<div class='image-wrapper js-image-wrapper' />
```
<a name="promises" />
## Promises
Always use promises (`RSVP.Promise`, `Ember.RSVP.Promise`).
For `ajax` calls use the `ic-ajax` library ([ic-ajax](https://github.com/instructure/ic-ajax)).

```coffeescript
success = (data) ->
 # ... handle success ...

error = ->
 # ... handle error ...

ic.ajax.request(url)
 .then(success, error)
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
power = (value) ->
   value * value

add = (prev, current) ->
   prev + current
   
[1..3]
  .map(power)
  .concat([10..12])
  .reduce(add)
```

When calling functions, always use parentheses:

```coffeescript
baz(12) # Yes
baz 12 # No

brush.ellipse({ x: 10, y: 20 }) # Yes
brush.ellipse x: 10, y: 20 # No

print(inspect(value)) # Yes
print inspect value # No
```

Always use named functions instead of anonymous ones:
```coffeescript
# Yes
power = (value) ->
  value * value

[1..3].map(power)

# No
[1..3].map( (value) -> value * value) 
```
If you need access to a specific scope in a named function, use function.bind: 
```coffeescript
class Test
  handleSuccess: (data) ->
    # ... handle success ...
   
  handleError: (error) ->
    # ... handle error ...
  
  queryRecords: ->
    success = @handleSuccess.bind(@)
    error   = @handleError.bind(@)
    ic.ajax.request(url)
      .then(success, error)
```
<a name="strings"/>
## Strings

Use string interpolation instead of string concatenation:

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
```

Use following style for inline javascript-templates: 
```coffeescript
"""
  <div id='test'>
    Hello
  </div>
"""
```

Prefer single quoted strings (`''`) instead of double quoted (`""`) strings, unless features like string interpolation are being used for the given string.

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

When an `if...else` clause fits in a single line:
```coffeescript
color = if true then 'green' else 'blue' # Yes

if true then color = 'green' else color = 'blue' # No
```

Multi-line `if...else` clauses should use indentation:

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

When an `if` clause fits in a single line: 
```coffeescript
# Yes
doSomething() if true

# No
if true
  doSomething()
```

<a name="extending_native_objects"/>
## Extending Native Objects

Do not modify native objects.

For example, do not modify `Array.prototype` to introduce `Array#forEach`.

<a name="exceptions"/>
## Exceptions

Do not suppress exceptions.

<a name="ember"/>
## Ember

<a name="module_imports"/>
### Module Imports 

If using a module system (CommonJS Modules, AMD, ES6-Modules, etc.), `import` statements should be placed on separate lines.

```coffeescript
`import Ember from 'ember';`
`import RSVP from 'rsvp';`
`import SliderMixin from '../mixins/slider-mixin';`

controller = Ember.ArrayController.extend SliderMixin,
  # ...controller code goes here ...
  
`export default controller;`
```
These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

<a name="computed_properties_observer"/>
### Computed properties & observer syntax

Use a single space between parentheses and function-arrow on `Ember`-computed properties and observers.

```coffeescript
Ember.Object.extend
  
  fullName: ( ->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')

  lastNameDidChange: ( ->
    console.log('I just married! lol')
  ).observes('lastName')
```  

Always use `Ember.computed` instead of custom computed properties where possible: 
```coffeescript
DRIVING_AGE_US = 16
gte = Ember.computed.gte
not = Ember.computed.not

Ember.Object.extend

  # Yes
  allowedToDrive: gte('age', DRIVING_AGE_US)
  notAllowedToDrive: not('allowedToDrive')
  
  # No
  allowedToDrive: ( ->
    @get('age') >= DRIVING_AGE_US
  ).property('age')
  
  notAllowedToDrive: ( ->
    !@get('allowedToDrive')
  ).property('allowedToDrive')
```  

<a name="overriding_ember_object_methods"/>
### Overriding Ember.Object-methods

Instead of overriding the built-in `Ember.Object`-methods, use the `on`-syntax.
```coffeescript
Ember.Component.extend

  # Yes
  setupEventListener: ( ->
    # ... setup event listeners ...
  ).on('didInsertElement')
  
  # No
  didInsertElement: ->
    @_super()
    # ... setup event listeners ...

Ember.Object.extend

  # Yes
  fetchData: ( ->
    # ... init Ember.Object ...
  ).on('init')
  
  # No
  init: ->
    @_super()
    # ... init Ember.Object ...
```  

<a name="define_abbreviations" />
### Define abbreviations

Always define abbreviations for 'long' `Ember`-functions:
```coffeescript
# Yes
attr  = DS.attr
equal = Ember.computed.equal

DS.Model.extend
  age: attr('number')
  gold: attr('string')
  isGoldUser: equal('gold', 'Gold')
  
# No
DS.Model.extend
  age: DS.attr('number')
  gold: DS.attr('string')
  isGoldUser: Ember.computed.equal('gold', 'Gold')
```

Define property/observer-functions for code that can be used mulitple times for different 'properties' or 'observers':
```coffeescript
# Yes
METRES_IN_KM = 1000

kilometerInMeter = (distance) ->
  ( ->
    @get(distance) * METRES_IN_KM
  ).property(distance)

notifyEveryKilometer = (distance) ->
  ( ->
     # ... notifiy ....
  ).observes(distance)

Ember.ObjectController.extend
  distancePerDayInMeter: kilometerInMeter('distancePerDayInKm')
  distancePerWeekInMeter: kilometerInMeter('distancePerWeekInKm')
  
  distancePerDayObserver: notifyEveryKilometer('distancePerDayInKm')
  distancePerWeekObserver: notifyEveryKilometer('distancePerWeekInKm')
  
# No
METRES_IN_KM = 1000

Ember.ObjectController.extend
  distancePerDayInMeter: ( ->
    @get('distancePerDayInKm') * METRES_IN_KM
  ).property('distancePerDayInKm')
  
  distancePerWeekInMeter: ( ->
    @get('distancePerWeekInKm') * METRES_IN_KM
  ).property('distancePerWeekInKm')
  
  distancePerDayObserver: ( ->
    # ... notify ....
  ).observes('distancePerDayInKm')
  
  distancePerWeekObserver: ( ->
    # ... notify ....
  ).observes('distancePerWeekInKm')
```  
 
<a name="miscellaneous"/>
## Miscellaneous

`&&` is preferred over `and` .

`||` is preferred over `or`.

`==` is preferred over `is`.

`!` is preferred over `not`.

To make sure a namespace exists use the `?` operator: 
```coffeescript
@rt = @rt ? {}
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

Always use `@` instead of `this`:

```coffeescript
return @ # Yes
return this # No
```

Avoid `return` where not required.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

```coffeescript
console.log(args...) # Yes

(a, b, c, rest...) -> # Yes
```

Use constants for improved readability:
```coffeescript
# Yes
METRES_IN_KM = 1000

convertKmToMeter = (km) ->
  km * METRES_IN_KM

# No
convertKmToMeter = (km) ->
  km * 1000
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
