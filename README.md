This module is a helper class to process Spintax strings.

> {Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {Smith|Williams|Davis}


# Usage


```
var spintax = getModel('spintax@spintax');
var strData = "{Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {Smith|Williams|Davis}!";

var spinned = spintax.spin(strData);
```

This code will output a random spun string generated:

> Hola to you, Ms. Williams!
