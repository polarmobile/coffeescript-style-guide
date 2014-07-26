# CoffeeScript 风格指南

这份文档包含了一系列[CoffeeScript][coffeescript]编程语言的最佳实战。

希望能有更多的人一起做贡献，不断丰富文档。

请知晓，这是一个仍然在编写的项目：一些内容可能不符合社区习惯，这些内容会根据实际情况修改或删除。

## 灵感

这份文档的灵感来自与许多风格指南，例如：

- [PEP-8][pep8]: Style Guide for Python Code
- Bozhidar Batsov's [Ruby Style Guide][ruby-style-guide]
- [Google's JavaScript Style Guide][google-js-styleguide]
- [Common CoffeeScript Idioms][common-coffeescript-idioms]
- Thomas Reynolds' [CoffeeScript-specific Style Guide][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [code review][spine-js-code-review] of [Spine][spine-js]
- The [CoffeeScript FAQ][coffeescript-faq]

## 目录

* [风格指南](#guide)
    * [代码布局](#code_layout)
        * [制表符和空格](#tabs_or_spaces)
        * [最大行长](#maximum_line_length)
        * [空行](#blank_lines)
        * [留白的捷径](#trailing_whitespace)
        * [可选的逗号](#optional_commas)
        * [编码](#encoding)
    * [模块引入](#module_imports)
    * [声明、表达式中的空格](#whitespace)
    * [注释](#comments)
        * [块级注释](#block_comments)
        * [行内注释](#inline_comments)
    * [命名](#naming_conventions)
    * [函数](#functions)
    * [字符串](#strings)
    * [条件](#conditionals)
    * [循环](#looping_and_comprehensions)
    * [扩展](#extending_native_objects)
    * [异常](#exceptions)
    * [注](#annotations)
    * [其他](#miscellaneous)

<a name="code_layout"/>
## 代码布局

<a name="tabs_or_spaces"/>
### 制表符还是空格？

建议**只使用空格键**，每 **2个空格** 作为一个缩进级别，不要混用制表符和空格键。

<a name="maximum_line_length"/>
### 最大行长

每行最多包含79个字符

<a name="blank_lines"/>
### 空行

顶层函数和类声明语句后应空一行。

在类中的函数声明语句后也应当空一行。

在方法或函数内头尾各空一行可以提高代码的可读性。（例如，为了勾勒出代码逻辑部分）

<a name="trailing_whitespace"/>
### 留白的捷径

在任意行不要直接引入留白捷径。

<a name="optional_commas"/>
### 可选的逗号

在对象属性或者元素定义，以及需要多行定义的数组中，尽量避免使用逗号。

```coffeescript
# 正确
foo = [
  'some'
  'string'
  'values'
]
bar:
  label: 'test'
  value: 87

# 错误
foo = [
  'some',
  'string',
  'values'
]
bar:
  label: 'test',
  value: 87
```

<a name="encoding"/>
### 编码

建议使用UTF-8进行源文件编码

<a name="module_imports"/>
## 模块引入

如果使用模块结构（例如CommonJs 模块 AMD 等）,`require`语句应当独立成行。

```coffeescript
require 'lib/setup'
Backbone = require 'backbone'
```
模块引入语句应当更具如下顺序进行分组：

1. 标准库 _(如果引入了标准库)_
2. 第三方库
3. 本地库 _(如果引入了本地库)_

<a name="whitespace"/>
## 声明、表达式中的空格

在下述情况中，避免使用额外的空格

- 在括号中

    ```coffeescript
       ($ 'body') # 正确
       ( $ 'body' ) # 错误
    ```

- 逗号前

    ```coffeescript
       console.log x, y # 正确
       console.log x , y # 错误
    ```

额外建议:

- 在下列操作符两边加上 **一个空格**

    - 赋值: `=`

        - _定义默认参数的时候也是这样

           ```coffeescript
           test: (param = null) -> # 正确
           test: (param=null) -> # 错误
           ```

    - 运算操作: `+=`, `-=`, etc.
    - 比较操作: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
    - 四则运算: `+`, `-`, `*`, `/`, etc.

    - _(不要用多余一个的空格去包围操作符)_

        ```coffeescript
           # 正确
           x = 1
           y = 1
           fooBar = 3

           # 错误
           x      = 1
           y      = 1
           fooBar = 3
        ```

<a name="comments"/>
## 注释

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.

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

<a name="naming_conventions"/>
## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives][camel-case-variations].)_

_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)_

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

You will sometimes see parentheses used to group functions (instead of being used to group function parameters). Examples of using this style (hereafter referred to as the "function grouping style"):

```coffeescript
($ '#selektor').addClass 'klass'

(foo 4).bar 8
```

This is in contrast to:

```coffeescript
$('#selektor').addClass 'klass'

foo(4).bar 8
```

In cases where method calls are being chained, some adopters of this style prefer to use function grouping for the initial call only:

```coffeescript
($ '#selektor').addClass('klass').hide() # Initial call only
(($ '#selektor').addClass 'klass').hide() # All calls
```

The function grouping style is not recommended. However, **if the function grouping style is adopted for a particular project, be consistent with its usage.**

<a name="strings"/>
## Strings

Use string interpolation instead of string concatenation:

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
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

<a name="extending_native_objects"/>
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

If a custom annotation is required, the annotation should be documented in the project's README.

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
