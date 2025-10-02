# intro

- made in 1972: logic programming language
- interpreted garbo
- if you need any form of efficiency this is not it primarily made to be "expressive"
- there is the interactive mode: "python shell"
- consulted code: loaded from a file
- lines that begin with ?- can be typed in interactive mode

# weird shit

> [predicate]:  ```subprogram```        - represents the state of the world
  - must start with {lower case letter}
> [goal]:       ```command```           - tries to make a state world come true
> [fact]:       ```predicate```         - of the simplest form
> [variables]:  ```your regular vars``` - {anything with a capital letter}
  - the sheer stupidity of this heap of ass is astounding

> [.] :         ```EOL```           - for whatever fucking reason
> [;] :         ```OR operator```   - also to get the next result of a query
> [,] :         ```AND operator```  - yeah
> [%] :         ```comments```      - single line comments
> [=] :         ```unification```   - horseshit

## unification
> [!IMPORTANT] some heavy weed may or may not have been involved
 - a combination of:
   - unification
   - equality
> [!INFO] usage 
 - if both are bound(i.e defined):      [check equality] 
 - if one side is free(i.e undefined):  [assgin to the undef the value of def] 
 - if both are free:                    [assignment is remembered for future if either one ends up bound]

