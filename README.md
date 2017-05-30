This module is a helper class to process Spintax strings.

> {Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {Smith|Williams|Davis}


# Usage


```
var spintax = getModel('spintax@spintax');
var strData = "{Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {Smith|Williams|Davis}";

spintax.spin(strData);
```