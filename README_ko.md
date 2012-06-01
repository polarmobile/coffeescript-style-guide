<!--# CoffeeScript Style Guide-->
# 커피스크립트 스타일 가이드

<!-- This guide presents a collection of best-practices and coding conventions for the [CoffeeScript][coffeescript] programming language. -->
이 가이드는 [CoffeeScript][coffeescript] 프로그래밍 언어에 대한 모범 사례와 코딩 관례 모음집입니다.

<!-- This guide is intended to be community-driven, and contributions are highly encouraged. -->
이 가이드는 커뮤니티 중심으로 만들어진 것입니다. 참여는 대환영입니다.

<!-- Please note that this is a work-in-progress: there is much more that can be specified, and some of the guidelines that have been specified may not be deemed to be idiomatic by the community (in which case, these offending guidelines will be modified or removed, as appropriate). -->
이 문서는 작업 중이니 주의해주세요: 기술된 것보다는 기술할 게 많으며, 가이드라인의 어떤 항목은 커뮤니티에 의해 가이드라인으로 간주되지 않을 수도 있습니다.(이 경우, 가이드라인은 적절하게 수정되거나 제거될 것 입니다.)

<!--## Inspiration-->
## 영감을 얻은 곳들

<!-- The details in this guide have been very heavily inspired by several existing style guides and other resources. In particular: -->
이 가이드의 내용은 몇가지 가이드와 자료들에서 강한 영감을 받았습니다. 특히:

<!--
- [PEP-8][pep8]: Style Guide for Python Code
- Bozhidar Batsov's [Ruby Style Guide][ruby-style-guide]
- [Google's JavaScript Style Guide][google-js-styleguide]
- [Common CoffeeScript Idioms][common-coffeescript-idioms]
- Thomas Reynolds' [CoffeeScript-specific Style Guide][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [code review][spine-js-code-review] of [Spine][spine-js]
- The [CoffeeScript FAQ][coffeescript-faq]
-->
- [PEP-8][pep8]: 파이썬 코드를 위한 스타일 가이드
- Bozhidar Batsov 의 [루비 스타일 가이드][ruby-style-guide]
- [구글의 자바스크립트 스타일 가이드][google-js-styleguide]
- [공통 커피스크립트 특성][common-coffeescript-idioms]
- Thomas Reynolds' [커피스크립트 명세 스타일 가이드][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [코드 리뷰][spine-js-code-review] of [Spine][spine-js]
-  [커피스크립트 FAQ][coffeescript-faq]

<!--## Table of Contents-->
## 목차

<!--
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
-->
* [커피 스크립트 스타일 가이드](#guide)
    * [코드 레이아웃](#code_layout)
        * [탭? 스페이스?](#tabs_or_spaces)
        * [한 줄의 최대 길이](#maximum_line_length)
        * [빈 줄](#blank_lines)
        * [줄끝의 공백](#trailing_whitespace)
        * [인코딩](#encoding)
    * [모듈 불러오기](#module_imports)
    * [표현식, 구문에서의 공백](#whitespace)
    * [주석 달기](#comments)
        * [블록 주석](#block_comments)
        * [한줄 주석](#inline_comments)
    * [이름 규칙](#naming_conventions)
    * [함수](#functions)
    * [문자열](#strings)
    * [분기](#conditionals)
    * [Looping and Comprehensions](#looping_and_comprehensions)
    * [Native Objects 확장하기](#extending_native_objects)
    * [예외 처리](#exceptions)
    * [어노테이션](#annotations)
    * [그밖에](#miscellaneous)

<a name="code_layout"/>
<!--## Code layout-->
## 코드 레이아웃

<a name="tabs_or_spaces"/>
<!--### Tabs or Spaces?-->
### 탭? 스페이스?

<!--Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.-->
한 번 들여쓸 때에는 **두 칸**의 **스페이스(공백) 만**을 사용하세요. 절대로 탭(tab)과 스페이스를 섞어서 쓰지 마세요.

<a name="maximum_line_length"/>
<!--### Maximum Line Length-->
### 한 줄의 최대 길이

<!--Limit all lines to a maximum of 79 characters.-->
한 줄에 쓸 수 있는 최대 문자개수는 79개입니다.

<a name="blank_lines"/>
<!--### Blank Lines-->
### 빈 줄

<!--Separate top-level function and class definitions with a single blank line.-->
top-level 함수와 클래스를 정의한 것 사이는 빈 줄을 하나 띄워서 구분해 주세요.

<!--Separate method definitions inside of a class with a single blank line.-->
클래스 안에서 메서드를 정의할 때에는, 중간에 빈 줄을 하나 띄워서 구분해 주세요.

<!--Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).-->
가독성을 높이기 위해 필요한 경우에는, 메서드나 함수를 정의하는 본문 안에서는 빈줄 하나를 써 주세요. (예를 들면, )

<a name="trailing_whitespace"/>
<!--### Trailing Whitespace-->
### 줄끝의 공백

<!--Do not include trailing whitespace on any lines.-->
어떤 줄에도 끝에 공백을 넣지 마세요.

<a name="encoding"/>
<!--### Encoding-->
### 인코딩

<!--UTF-8 is the preferred source file encoding.-->
UTF-8 이 기본 소스 파일 인코딩입니다.

<a name="module_imports"/>
<!--## Module Imports-->
## 모듈 불러오기

<!--If using a module system (CommonJS Modules, AMD, etc.), `require` statements should be placed on separate lines.-->
모듈(CommonJS나, AMD등등)을 사용하신다면, `require`구문은 다른 줄과 독립되게 적어주세요.

```coffeescript
require 'lib/setup'
Backbone = require 'backbone'
```
<!--These statements should be grouped in the following order:-->
이 구문은 다음과 같은 순서로 묶여져야 합니다:

<!--
1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_
-->
1. _(표준 라이브러리가 있다면)_표준 라이브러리
2. 외부 라이브러리
3. _(이 앱이나 라이브러리에만 있는)_내부 라이브러리

<a name="whitespace"/>
<!--## Whitespace in Expressions and Statements-->
## 표현식, 구문에서의 공백

<!--Avoid extraneous whitespace in the following situations:-->
다음과 같은 상황에 공백사용을 피해주세요:

<!--- Immediately inside parentheses, brackets or braces-->
- 소중대 괄호를 열고 닫을 때

    ```coffeescript
       ($ 'body') # Yes
       ( $ 'body' ) # No
    ```

<!--- Immediately before a comma-->
- 쉼표 바로 전에

    ```coffeescript
       console.log x, y # Yes
       console.log x , y # No
    ```

<!--Additional recommendations:-->
추가 권장사항:

<!--
- Always surround these binary operators with a **single space** on either side

    - assignment: `=`

        - _Note that this also applies when indicating default parameter value(s) in a function declaration_
-->
- 다음 연산자들은 항상 앞뒤로 **한 칸의 공백**을 두세요.

    - 대입: `=`

        - _주의하세요. 함수 선언부의 인자의 기본값에도 적용됩니다._

           ```coffeescript
           test: (param = null) -> # Yes
           test: (param=null) -> # No
           ```

<!--
    - augmented assignment: `+=`, `-=`, etc.
    - comparisons: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
    - arithmetic operators: `+`, `-`, `*`, `/`, etc.

    - _(Do not use more than one space around these operators)_
-->
    - 확장 대입: `+=`, `-=` 등등.
    - 비교: `==`, `<`, `>`, `<=`, `>=`, `unless` 등등.
    - 산술 연산: `+`, `-`, `*`, `/` 등등.

    - _(한칸 이상의 공백을 이 연산자들에 사용하지 마세요)_

        ```coffeescript
           # Yes
           x = 1
           y = 1
           fooBar = 3

           # No
           x      = 1
           y      = 1
           fooBar = 3
        ```

<a name="comments"/>
<!--## Comments-->
## 주석달기

<!--If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)-->
기존의 주석이 기술하는 코드를 수정하는 경우에는, 새로운 코드를 반영하도록 기존의 주석도 수정해주세요. (이상적으로는, 주석을 달 필요가 없게 코드를 개선해서, 주석을 아예 제거하세요.)

<!--The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.-->
첫번째 단어가 소문자로 시작하는 식별자(identifier)인 경우를 제외하고는, 주석의 첫번째 문자는 대문자로 써주세요.


<!--If a comment is short, the period at the end can be omitted.-->
주석이 짧다면, 끝에 있는 마침표(.)는 생략해도 됩니다.

<a name="block_comments"/>
<!--### Block Comments-->
### 블록 주석

<!--Block comments apply to the block of code that follows them.-->
블록 주석은 주석다음에오는 코드 블럭에 적용됩니다.

<!--Each line of a block comment starts with a `#` and a single space, and should be indented at the same level of the code that it describes.-->
블록 주석의 각 줄은 #와 한칸의 공백으로 시작하고, 설명하려는 코드와 같은 깊이의 들여쓰기를 사용해야 합니다.

<!--Paragraphs inside of block comments are separated by a line containing a single `#`.-->
블록 주석안의 문장은 `#`를 포함하는 한 줄로 구분합니다.

<!--
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
-->
```coffeescript
# 이것은 블록 주석입니다.
#
# 이것은 블록 주석의 두 번째 문단입니다. 이 문단이
# 주석 문자 하나가 있는 줄로 위의 문단과 나누어 졌다는
# 점에 주목하세요.

  init()
  start()
  stop()
```

<a name="inline_comments"/>
<!--### Inline Comments-->
### 한 줄 주석

<!--Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).-->
한 줄 주석은 주석이 설명할 구문의 바로 위에 위치합니다. 한줄 주석이 충분히 짧다면 구문과 같은 줄에 둘수도 있습니다.(구문 끝에서 공백 한칸은 띄어주세요.)

<!--All inline comments should start with a `#` and a single space.-->
모든 한 줄 주석은 `#`와 한칸의 공백으로 시작해야 합니다.

<!--The use of inline comments should be limited, because their existence is typically a sign of a code smell.-->
한 줄 주석은 제한적으로 써야합니다, 왜냐면 한 줄 주석의 존재는 보통 코드 스멜의 징조 거든요.

<!--Do not use inline comments when they state the obvious:-->
뻔히 명시되있는 곳에 한줄 주석을 달지 마세요:

```coffeescript
  # No
  x = x + 1 # Increment x
```

<!--However, inline comments can be useful in certain scenarios:-->
하지만, 한줄 주석은 특정 시나리오에서는 유용합니다:

```coffeescript
  # Yes
  x = x + 1 # Compensate for border
```

<a name="naming_conventions"/>
<!--## Naming Conventions-->
## 이름짓기 규칙

<!--Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.-->
모든 변수와 함수와 오브젝트의 속성은 `camelCase`(소문자로 시작하는)를 사용하세요.

<!--Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives][camel-case-variations].)_-->
모든 클래스에는 `CamelCase`(대문자로 시작하는)를 사용하세요._(이런 식을 또한 `PascalCase`, `CamelCaps`, `CapWords`라고 부르기도 합니다, [다른 대안들][camel-case-variations]참조.)_

<!--_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)_-->
_( **공식적인**커피스크립트의 컨밴션은 camelcase(카멜케이스) 입니다. 왜냐하면 자바스크립트하고 같이 쓰기 쉽거든요. 이 결정에 대해 좀더 자세히 알고 싶으면,  [여기][coffeescript-issue-425]를 보세요.)_

For constants, use all uppercase with underscores:
상수는 대문자와 언더바를 함께 씁니다:

```coffeescript
CONSTANT_LIKE_THIS
```

<!--Methods and variables that are intended to be "private" should begin with a leading underscore:-->
"private" 함수와 변수는 언더바로 시작해야 합니다:

```coffeescript
_privateMethod: ->
```

<a name="functions"/>
<!--## Functions-->
## 함수

<!--_(These guidelines also apply to the methods of a class.)_-->
_(이런 가이드라인들도 클래스 함수에 적용됩니다.)_

<!--When declaring a function that takes arguments, always use a single space after the closing parenthesis of the arguments list:-->
인자를 받는 변수를 선언 할때는, 항상 괄호를 닫고 한칸을 띄우셔야 합니다.

```coffeescript
foo = (arg1, arg2) -> # Yes
foo = (arg1, arg2)-> # No
```

<!--Do not use parentheses when declaring functions that take no arguments:-->
함수가 인자를 받지 않으면 괄호를 사용하지 마세요:

```coffeescript
bar = -> # Yes
bar = () -> # No
```

<!--In cases where method calls are being chained and the code does not fit on a single line, each call should be placed on a separate line and indented by one level (i.e., two spaces), with a leading `.`.-->
함수를 콜할 때 연쇄적으로 호출해서 한 줄에 적기에 적합하지 않은 경우, 각 콜을 다른 줄에 적고 각줄은 한 단계(공백을 쓰신다면 공백 두 칸)들여쓰기를 하시고 `.`으로 시작해주세요.

```coffeescript
[1..3]
  .map((x) -> x * x)
  .concat([10..12])
  .filter((x) -> x < 11)
  .reduce((x, y) -> x + y)
```

<!--When calling functions, choose to omit or include parentheses in such a way that optimizes for readability. Keeping in mind that "readability" can be subjective, the following examples demonstrate cases where parentheses have been omitted or included in a manner that the community deems to be optimal:-->
함수를 콜할때, 가독성을 생각해가며 괄호를 넣거나 빼세요. “가독성”이 주관적일 수도 있다는 걸 유념하세요, 밑의 예제들은 커뮤니티에서 최적이라고 생각하는 방식으로 괄호가 포함되거나 생략되어 있습니다:

```coffeescript
baz 12

brush.ellipse x: 10, y: 20 # Braces can also be omitted or included for readability

foo(4).bar(8)

obj.value(10, 20) / obj.value(20, 10)

print inspect value

new Tag(new Value(a, b), new Arg(c))
```

<!--You will sometimes see parentheses used to group functions (instead of being used to group function parameters). Examples of using this style (hereafter referred to as the "function grouping style"):-->
가끔 (그룹 함수의 파라메터에 사용하는 대신에)그룹 함수에 사용하는 괄호를 볼지도 모르겠네요. 이런 방식의 예입니다.(앞으로 “함수 그룹화 스타일”이라 할께요.)

```coffeescript
($ '#selektor').addClass 'klass'

(foo 4).bar 8
```

<!--This is in contrast to:-->
이렇게 적을수도 있습니다:

```coffeescript
$('#selektor').addClass 'klass'

foo(4).bar 8
```

<!--In cases where method calls are being chained, some adopters of this style prefer to use function grouping for the initial call only:-->
함수 호출이 그룹화 되어있는 경우, 어떤 이는 처음 콜에 대해서만 함수 그룹화 스타일을 사용하는 것이 좋습니다.
```coffeescript
($ '#selektor').addClass('klass').hide() # Initial call only
(($ '#selektor').addClass 'klass').hide() # All calls
```

<!--The function grouping style is not recommended. However, **if the function grouping style is adopted for a particular project, be consistent with its usage.**-->
이 그룹화 스타일은 추천하지 않습니다만, **만약에 함수 그룹화 스타일이 특정 프로젝트에 채용 되었다면, 일관되게 사용해야 합니다.**

<a name="strings"/>
<!--## Strings-->
## 문자열

<!--Use string interpolation instead of string concatenation:-->
문자열 연결(concatenation) 대신 보간(interpolation)을 사용하세요.

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
```

<!--Prefer single quoted strings (`''`) instead of double quoted (`""`) strings, unless features like string interpolation are being used for the given string.-->
문자열에서 보간을 사용하지않는다면, 쌍따옴표(`''`)보다 홀따옴표(`''`)가 좋습니다.

<a name="conditionals"/>
<!--## Conditionals-->
## 분기

<!--Favor `unless` over `if` for negative conditions.-->
부정적인 조건일때는 `if`보다는 `unless`를 쓰세요.

<!--Instead of using `unless...else`, use `if...else`:-->
`unless...else`보다는 `if...else`를 쓰세요:

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

<!--Multi-line if/else clauses should use indentation:-->
여러줄의 if/else의 절은 들여쓰기를 해야합니다:

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

<!--Take advantage of comprehensions whenever possible:-->
가능한 comprehensions 를 활용합니다:

```coffeescript
  # Yes
  result = (item.name for item in array)

  # No
  results = []
  for item in array
    results.push item.name
```

<!--To filter:-->
필터링 하려면:

```coffeescript
result = (item for item in array when item.name is "test")
```

<!--To iterate over the keys and values of objects:-->
오브젝트의 키, 값으로 반복이동하려면:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="#extending_native_objects"/>
<!--## Extending Native Objects-->
## Native Objects 확장하기

<!--Do not modify native objects.-->
native objects는 고치지 마세요.

<!--For example, do not modify `Array.prototype` to introduce `Array#forEach`.-->
예를 들면, `Array.prototype`를 `Array#forEach`로 고치지 마세요.

<a name="exceptions"/>
<!--## Exceptions-->
## 예외 처리

<!--Do not suppress exceptions.-->
예외 처리를 아끼지 마세요.

<a name="annotations"/>
<!--## Annotations-->
## 어노테이션

<!--Use annotations when necessary to describe a specific action that must be taken against the indicated block of code.-->
어노테이션으로 표시된 코드의 블럭이 특정 행동이 필요할 경우 어노테이션을 씁니다.

<!--Write the annotation on the line immediately above the code that the annotation is describing.-->
어노테이션이 설명할 코드의 바로 위에 어노테이션을 적습니다.

<!--The annotation keyword should be followed by a colon and a space, and a descriptive note.-->
어노테이션 키워드 뒤에는 콜론에 한칸을 띄워주고, 설명을 적어야 합니다.

```coffeescript
  # FIXME: The client's current state should *not* affect payload processing.
  resetClientState()
  processPayload()
```

<!--If multiple lines are required by the description, indent subsequent lines with two spaces:-->
만약 설명에 여러 줄이 필요하면, 이어지는 줄은 두 칸 들여쓰기를 합니다:

```coffeescript
  # TODO: Ensure that the value returned by this call falls within a certain
  #   range, or throw an exception.
  analyze()
```

<!--Annotation types:-->
어노테이션 종류:

<!--
- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation
-->
- `TODO`: 나중에 추가되어야할 없는 기능
- `FIXME`: 고쳐져야 할 망가진 코드
- `OPTIMIZE`: 병목 현상이 일어나는 비효율적인 코드
- `HACK`: 수상한(또는 너무 독창적인)코드
- `REVIEW`: 구현을 확인하기위해 리뷰해야하는 코드

<!--If a custom annotation is required, the annotation should be documented in the project's README.-->
그밖의 어노테이션이 필요한 경우에는, 프로젝트의 README파일에 그 어노테이션의 설명이 있어야 합니다.

<a name="miscellaneous"/>
<!--## Miscellaneous-->
## 그 외

<!--`and` is preferred over `&&`.-->
`&&` 표기보다 `and` 표기가 더 좋습니다.

<!--`or` is preferred over `||`.-->
`||` 표기보다 `or` 표기가 더 좋습니다.

<!--`is` is preferred over `==`.-->
`==` 표기보다 `is` 표기가 더 좋습니다.

<!--`not` is preferred over `!`.-->
`!` 표기보다 `not` 표기가 더 좋습니다.

<!--`or=` should be used when possible:-->
가급적이면 `or=` 표현을 권장합니다:

```coffeescript
temp or= {} # Yes
temp = temp || {} # No
```

<!--Prefer shorthand notation (`::`) for accessing an object's prototype:-->
객체의 프로토타입에 접근하기 위한, 속기 표기법 (`::`) 을 사용하는 게 좋습니다:

```coffeescript
Array::slice # Yes
Array.prototype.slice # No
```

<!--Prefer `@property` over `this.property`.-->
`this.property` 표기보다 `@property` 표기가 더 좋습니다.

```coffeescript
return @property # Yes
return this.property # No
```

However, avoid the use of **standalone** `@`:
하지만, `@`를 **단독으로** 쓰지 마세요:

```coffeescript
return this # Yes
return @ # No
```

<!--Avoid `return` where not required, unless the explicit return increases clarity.-->
명시적 반환의 명확성이 증가하지 않는 한,  불필요한 곳에 `return` 표기를 피하세요.

<!--Use splats (`...`) when working with functions that accept variable numbers of arguments:-->
펑션의 인수 갯수가 가변적인 경우에는 스플렛 (`...`) 표기를 사용하세요:

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
