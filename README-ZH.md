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
    * [注解](#annotations)
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

如果修改的代码有相关注释，也应当对注释进行更新，总之，注释应当和代码功能保持一致。

注释的第一个单词应当大写，除非第一个单词必须使用小写字母。

如果注释内容很少，结尾的内容可以省略

<a name="block_comments"/>
### 块级注释

块级注释应当写在所要解释的代码块之前。

每行块级注释都应当用`#`和一个空格作为开头，并且应当和所要注释的代码保持同样的缩进。

块级注释由仅包含`#`的那行行进行分段。

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
### 行内注释

行内注释应当紧跟所要注释的代码语句之后，如果行内注释内容特别短，可以直接和语句写在一行内（通常在注释前多加一个空格）。

所有的行内注释都应当由一个`#`号和一个空格作为开头。

应当尽量限制行内注释的数量，因为他们看起来很像一行代码。

不要去描述那些显而易见的代码运行结果。

```coffeescript
  # No
  x = x + 1 # Increment x
```

而应当着重描述代码的运行逻辑。

```coffeescript
  # Yes
  x = x + 1 # Compensate for border
```

<a name="naming_conventions"/>
## 命名

使用 `camelCase` （驼峰式）的格式去命名所有的变量、方法和对象属性。

使用 `CamelCase` 去命名所有的类 _(这种风格参照了`PascalCase`, `CamelCaps`, 以及 `CapWords`, 在[other alternatives][camel-case-variations]中有描述.)_

_（CoffeeScript的**官方**命名方式是camelcase，这是为了尽可能的和javascript协作，详情可以参照[这里][coffeescript-issue-425]。）_

对于常量，命名需要使用大写字母和下划线。

```coffeescript
CONSTANT_LIKE_THIS
```
对于私有的函数和变量在开头应当用下划线标注。

```coffeescript
_privateMethod: ->
```

<a name="functions"/>
## 函数

_(这些规则同样适用于类的定义)_

当声明的函数中有参数列表，每个参数之间应当也有一个空格进行间隔。

```coffeescript
foo = (arg1, arg2) -> # Yes
foo = (arg1, arg2)-> # No
```

当声明的函数不需要参数，不要插入额外的括号。

```coffeescript
bar = -> # Yes
bar = () -> # No
```

如果需要进行多次链式调用，不要将他们写在一起，每次调用都应当独立成行，并用两个空格进行缩进，用`.`开头。

```coffeescript
[1..3]
  .map((x) -> x * x)
  .concat([10..12])
  .filter((x) -> x < 11)
  .reduce((x, y) -> x + y)
```

当调用方法时，为了保持代码的可读性，尽可能的省略不必要的括号。记住一点，"可读性"是主观的，下面的例子，是社区认为处理省略括号比较恰当的方式。

```coffeescript
baz 12

brush.ellipse x: 10, y: 20 # Braces can also be omitted or included for readability

foo(4).bar(8)

obj.value(10, 20) / obj.value(20, 10)

print inspect value

new Tag(new Value(a, b), new Arg(c))
```

有时候，你会发现括号被用来进行函数分组（而不是进行参数分组）。例如使用这种风格。

```coffeescript
($ '#selektor').addClass 'klass'

(foo 4).bar 8
```

这和这种风格不一致:

```coffeescript
$('#selektor').addClass 'klass'

foo(4).bar 8
```
当使用链式调用函数时，一些这种风格的实现更倾向于只在第一次调用的时候使用函数分组。

```coffeescript
($ '#selektor').addClass('klass').hide() # Initial call only
(($ '#selektor').addClass 'klass').hide() # All calls
```
这里不推荐使用函数分组，但是，**如果某个项目使用函数分组，也请和项目保持一致，使用函数分组的风格**

<a name="strings"/>
## 字符串

在字符串中插入变量而不要手动拼接字符串:

```coffeescript
"this is an #{adjective} string" # 正确
"this is an " + adjective + " string" # 错误
```

除非需求是插入双引号，尽可能的使用单引号 (`''`) 而不是双引号 (`""`) 字符串,.

<a name="conditionals"/>
## 条件

使用 `unless` 而不是 `if` 处理期望条件不成立的情况.

但是不要使用 `unless...else`, 而使用 `if...else`:

```coffeescript
  # 正确
  if true
    ...
  else
    ...

  # 错误
  unless false
    ...
  else
    ...
```

多行的 if/else 应当独立成行并使用缩进:

```coffeescript
  # 正确
  if true
    ...
  else
    ...

  # 错误
  if true then ...
  else ...
```

<a name="looping_and_comprehensions"/>
## 循环

尽可能的使用omprehensions进行遍历:

```coffeescript
  # 正确
  result = (item.name for item in array)

  # 错误
  results = []
  for item in array
    results.push item.name
```

处理筛选:

```coffeescript
result = (item for item in array when item.name is "test")
```

遍历键值对:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="extending_native_objects"/>
## 扩展类

不要修改原来的类

例如不要修改`Array.prototype`上的方法去实现`Array#forEach`功能。

<a name="exceptions"/>
## 异常

不要总是忽略异常.

<a name="annotations"/>
## 注解

如果为了说明一个动作执行的原因，应当使用注解

将注释写在所要描述的代码片段之前

注解的关键字应当由一个＃和空格以及一个描述性的单词作为开头。

```coffeescript
  # FIXME: The client's current state should *not* affect payload processing.
  resetClientState()
  processPayload()
```

如果描述有很多行，后续内容用两个空格进行缩进。

```coffeescript
  # TODO: Ensure that the value returned by this call falls within a certain
  #   range, or throw an exception.
  analyze()
```

注解类型:

- `TODO`: 标注今后会添加的方法和功能
- `FIXME`: 标注需要被修复的代码
- `OPTIMIZE`: 标注造成性能瓶颈亟须优化的代码
- `HACK`: 标注可疑地或是精巧的代码
- `REVIEW`: 标注需要对实现需要进行确认的代码

如果需要自定义注解类型，注解应当记录的项目的README文件中。

<a name="miscellaneous"/>
## 其他

使用`and`替代`&&`.

使用`or`替代`||`.

使用`is`替代`==`.

使用`not`替代`!`.

尽可能使用`or=`:

```coffeescript
temp or= {} # 正确
temp = temp || {} # 错误
```

使用(`::`)调用项目的原型链:

```coffeescript
Array::slice # 正确
Array.prototype.slice # 错误
```

使用`@property`替代`this.property`

```coffeescript
return @property # 正确
return this.property # 错误
```

但是要避免**独立**使用 `@`:

```coffeescript
return this # 正确
return @ # 错误
```

除非返回结果显而易见，不需要避免使用`return`。

当函数有非常多个参数时，使用splats (`...`) :

```coffeescript
console.log args... # 正确

(a, b, c, rest...) -> # 正确
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
