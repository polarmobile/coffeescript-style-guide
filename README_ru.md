# Правила оформления кода на CoffeeScript

В этих правилах представлена коллекция лучших практик и соглашений по написанию кода на языке программирования [CoffeeScript][coffeescript].

Предпологается, что эти правила будут разрабатываться при участии сообщества и Ваш вклад крайне приветствуется.

Пожалуйста, учтите, что эти правила находятся в процессе разработки: есть еще много тонкостей, которые стоит обозначить, а так же некоторые из правил могут оказаться неподходящими по мнению сообщества (в таком случае эти правила стоит изменить или удалить).

## Источники вдохновения

При написании этих правил я обращал внимание на некоторые известные существующие сборники правил для других языков программирования и прочие ресурсы. В частности:

- [PEP-8][pep8]: Style Guide for Python Code
- Bozhidar Batsov's [Ruby Style Guide][ruby-style-guide]
- [Google's JavaScript Style Guide][google-js-styleguide]
- [Common CoffeeScript Idioms][common-coffeescript-idioms]
- Thomas Reynolds' [CoffeeScript-specific Style Guide][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [code review][spine-js-code-review] of [Spine][spine-js]
- The [CoffeeScript FAQ][coffeescript-faq]

## Содержание

* [Стилевые правила CoffeeScript](#guide)
    * [Форматирование кода](#code_layout)
        * [Табуляция или пробелы?](#tabs_or_spaces)
        * [Максимальная длина строки](#maximum_line_length)
        * [Пустые строки](#blank_lines)
        * [Пробелы в конце строк](#trailing_whitespace)
        * [Кодировка](#encoding)
    * [Импорт модулей](#module_imports)
    * [Пробелы в выражениях](#whitespace)
    * [Комментарии](#comments)
        * [Блочные комментарии](#block_comments)
        * [Строчные комментарии](#inline_comments)
    * [Соглашения по именованию](#naming_conventions)
    * [Функции](#functions)
    * [Строки](#strings)
    * [Условия](#conditionals)
    * [Циклы и итераторы](#looping_and_comprehensions)
    * [Расширение стандартных объектов](#extending_native_objects)
    * [Исключения](#exceptions)
    * [Аннотации](#annotations)
    * [Прочее](#miscellaneous)

<a name="code_layout"/>
## Форматирование кода

<a name="tabs_or_spaces"/>
### Табуляция или проблеы?

Используйте **только пробелы**, по **2 пробела** на один уровень вложенности. Никогда не используйте пробелы и табуляцию одновременно.

<a name="maximum_line_length"/>
### Максимальная длина строки

Ограничивайте длину всех строк 79 символами.

<a name="blank_lines"/>
### Пустые строки

Обособляйте функции верхнего уровня вложенности и объявления классов единичной пустой строкой.

Обособляйте определения методов внутри классов единичной пустой строкой.

Используйте единичную пустую строку для разделения кода внутри методов и функций, если это улучшит читабельность (например, для разбиения логических кусков кода).

<a name="trailing_whitespace"/>
### Пробелы в конце строк

Никогда не оставляйте пробелы в конце строк

<a name="encoding"/>
### Кодировка

UTF-8 является наиболее предпочтительной кодировкой.

<a name="module_imports"/>
## Импорт модулей

Если Вы используете систему модулей (CommonJS Modules, AMD, etc.), выражения `require` должны находится на разных строках.

```coffeescript
require 'lib/setup'
Backbone = require 'backbone'
```
Группируйте эти выражения в следующем порядке:

1. Импорт стандартных библиотек _(если существуют)_
2. Импорт сторонних библиотек
3. Импорт локльных файлов _(специфичных для данного проекта)_

<a name="whitespace"/>
## Пробелы в выражениях

Избегайте излишнего использования пробелов, например в таких случаях:

- Сразу после открывающейся и перед закрывающейся скобками

    ```coffeescript
       ($ 'body') # Yes
       ( $ 'body' ) # No
    ```

- Перед запятой

    ```coffeescript
       console.log x, y # Yes
       console.log x , y # No
    ```

Дополнительные рекомендации:

- Всегда обособляйте следующие операторы **единичным пробелом** с обеих сторон

    - присваивание: `=`

        - _Это так же касается значений по умолчанию в объявлении функции _

           ```coffeescript
           test: (param = null) -> # Yes
           test: (param=null) -> # No
           ```

    - присваивания с инкрементом(декрементом): `+=`, `-=`, и т.д.
    - сравнения: `==`, `<`, `>`, `<=`, `>=`, `unless`, и т.д.
    - арифметические опреаторы: `+`, `-`, `*`, `/`, и т.д.

    - _(Не используйте более одного пробела вокруг этих операторов)_

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
## Комментарии

Ваши комментарии всегда должны быть в актуальном состоянии. При внесении изменений в код, не забывайте обновлять и комментарии.

Желательно писать такой код, который не нуждается в комментариях.

Первое слово комментария начинается с заглавной буквы (кроме случаев, если первое слово - имя переменной или метода, начинающееся с маленькой буквы).

Если комментарий короткий, то точку в конце можно опустить.

<a name="block_comments"/>
### Блочные комментарии

Блочные комментарии применяются(описывают) блок кода, следующий за ними.

Каждая строка комментария начинается с символа `#` и одного пробела, и должна находится на одном уровне вложенности с блоком кода, который она описывает.

Параграфы внутри блочного комментария разделяются строкой, содержащей лишь один символ `#`.

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
### Строчные комментарии

Строчные комментарии располагаются строго над выражением, которое они описывают. Если комментарий достаточно короткий, то его можно поместить на ту же строку с выражением, отделив одним пробелом от окончания выражения.

Все строчные комментарии начинаются с символа `#` и одного пробела.

Использование однострочных комментариев следует ограничивать, така как они - признак появления душка у вашего кода.

Не используйте однострочные комментарии, если они описывают очевидное:

```coffeescript
  # No
  x = x + 1 # Increment x
```

Однако, иногда в них может быть смысл:

```coffeescript
  # Yes
  x = x + 1 # Compensate for border
```

<a name="naming_conventions"/>
## Соглашения по именованию

Используйте `camelCase` нотацию для именования всех переменных, методов и свойств объектов.

Используйте `CamelCase` нотацию для именования всех классов. _(Этот стиль так же обычно называется `PascalCase`, `CamelCaps`, или `CapWords`, среди [других альтернатив][camel-case-variations].)_

_(**Официальное** соглашение по именованию в CoffeeScript - `camelCase`. Подробнее можно прочитать [здесь][coffeescript-issue-425].)_

Для констант используйте все заглавные буквы и символы подчёркивания:

```coffeescript
CONSTANT_LIKE_THIS
```

Приватные методы и переменные должны начинаться с символа подчёркивания:

```coffeescript
_privateMethod: ->
```

<a name="functions"/>
## Функции

_(Эти правила так же применяются для методов классов)_

При определении функции всегда ставьте один пробел после закрывающей скобки агрументов:

```coffeescript
foo = (arg1, arg2) -> # Yes
foo = (arg1, arg2)-> # No
```

Не используйте скобки, определяя функцию, не принимающую аргумнетов:

```coffeescript
bar = -> # Yes
bar = () -> # No
```

В случаях, когда вызов методов идёт по цепочке (chaining) и код не помещается на одной строке, каждый вызов должен быть расположен на одной строке и начинаться с символа `.`. Все вызовы располагаются на 1 уровень вложенности глубже первой строки выражения.

```coffeescript
[1..3]
  .map((x) -> x * x)
  .concat([10..12])
  .filter((x) -> x < 11)
  .reduce((x, y) -> x + y)
```

При вызове функции всегда выбирайте использовать скобки или нет, основываясь на лучшей читабельности. Читабельность - понятие субъективное, для этого ниже перечислены случаи, в которых использования или опускание скобок считается сообществом приемлимым:

```coffeescript
baz 12

brush.ellipse x: 10, y: 20 # Фигурные скобки тоже можно опускать

foo(4).bar(8)

obj.value(10, 20) / obj.value(20, 10)

print inspect value

new Tag(new Value(a, b), new Arg(c))
```

Иногда вы можете встретить использование скобок для группировки функций. Примеры таких использований:

```coffeescript
($ '#selektor').addClass 'klass'

(foo 4).bar 8
```

Пример в другом стиле:

```coffeescript
$('#selektor').addClass 'klass'

foo(4).bar 8
```

В случаях, когда вызовы методов идут друг за другом (chaining), адепты этого стиля форматирования могут предпочесть использовать скобки для группировки функций только для первого вызова:

```coffeescript
($ '#selektor').addClass('klass').hide() # Initial call only
(($ '#selektor').addClass 'klass').hide() # All calls
```

Использования стиля группировки функций не рекомендовано, **хотя если в каком-то проекте такой стиль используется, то будте аккуратны с его использованием**.

<a name="strings"/>
## Строки

Всегда используйте интерполяцию строк вместо конкатенации:

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
```

Используйте для строк одинарные кавычки (`''`) вместо двойных (`""`) в случаях, когад вам не требуется интерполяция строк.

<a name="conditionals"/>
## Условия

Лучше использовать `unless`, чем `if` для отрицательных условий.

Вместо использования конструкции `unless...else`, используйте `if...else`:

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

Многострочные блоки if/else должны иметь дополнительный уровень вложенности:

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
## Циклы и итераторы

Используйте итераторы когда это возможно:

```coffeescript
  # Yes
  result = (item.name for item in array)

  # No
  results = []
  for item in array
    results.push item.name
```

В случае фильтрации:

```coffeescript
result = (item for item in array when item.name is "test")
```

Для итерации по ключам и значениям объекта:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="#extending_native_objects"/>
## Расширение стандартных объектов

Не делайте этого.

Например, не расширяйте `Array.prototype` методом `Array#forEach`.

<a name="exceptions"/>
## Исключения

Не избегайте использования исключений.

<a name="annotations"/>
## Aннотации

Используйте аннотации, если вам необходимо описать, что следует в дальнейшем сделать со следующим блоком кода:

Аннотацию следует разместить непосредственно перед блоком кода, к которому она относится.

После ключевого слова заметки ставиться двоеточие, затем пишется описание.

```coffeescript
  # FIXME: The client's current state should *not* affect payload processing.
  resetClientState()
  processPayload()
```

Если для заметки требуется несколько строк, добавьте уровень вложенности для второй и последующих строк.

```coffeescript
  # TODO: Ensure that the value returned by this call falls within a certain
  #   range, or throw an exception.
  analyze()
```

Заметки:

- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation

Если вам требуются собственные типа заметок, не забудте их указать в документации к проекту.

<a name="miscellaneous"/>
## Прочее

`and` лучше `&&`.

`or` лучше `||`.

`is` лучше `==`.

`not` лучше `!`.

`or=` следует использовать когда возможно:

```coffeescript
temp or= {} # Yes
temp = temp || {} # No
```

Используйте сокращенную запись (`::`) для доступа к прототипу объекта:

```coffeescript
Array::slice # Yes
Array.prototype.slice # No
```

Используйте `@property` вместо `this.property`.

```coffeescript
return @property # Yes
return this.property # No
```

Однако, избегайте использования **одного знака** `@`:

```coffeescript
return this # Yes
return @ # No
```

Избегайте использования `return`, кроме случаев когда вам необходимо явно указать на это.

Используйте (`...`) когда определяете функцию, принимающую различное число аргументов:

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
