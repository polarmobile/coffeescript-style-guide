#CoffeeScript Style Guide

* [Custom Rules](#rules)
* [How To Use](#howto)


This Style Guide is based on this [one](./README_2.md)

<a name="rules"></a>
## Custom linter rules
Differences from the default CoffeeScript linter are
```
{
  "arrow_spacing": {
    "level": "warn"
  },
  "no_trailing_whitespace": {
    "level": "warn"
  },
  "max_line_length": {
    "value": 120,
    "level": "warn"
  },
  "indentation": {
    "value": 4
  },
  "colon_assignment_spacing": {
    "level": "error",
    "spacing": {
      "left": 0,
      "right": 1
    }
  },
  "no_empty_param_list": {
    "level": "warn"
  },
  "space_operators": {
    "level": "warn"
  }
}
```

<a name="howto"></a>
## How to use in a project

Add as a dev dependency
```
npm i --dev @ttab/coffeescript-style
```
or
```
yarn add -d @ttab/coffeescript-style
```

Add a local `coffeelint.json` file in the root folder on your project that extends this linter config
```
{
    "extends": "@ttab/coffeescript-style"
}
```

Add a script in `package.json`
```
"scripts": {
    "lint": "coffeelint ./**/*.coffee",
}
```

Run the linter with
```
npm run lint
```
or
```
yarn lint
```
