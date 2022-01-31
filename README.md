# vifs

vim file search

opens in a vim terminal all desired files from path having results from a search query


## usage

```
vifs <search regexp> <include file regex>
```

sure there are plugins that do this but this is just another simple/lightweight command line tool giving exactly what you want.

under the hood it:

-  does a recursive grep on the path, optional including files by regex
-  parses and collates the results into a string
-  feeds this to vim and priming the session to tabulate the search term

so just tap the "n" key and enjoi

### feedback is welcome in the git issues

### license gplv3 Copyright (c) 2021 George Carder georgercarder@gmail.com
