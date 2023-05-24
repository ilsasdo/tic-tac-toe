---
Elm

---

Features

1. solo costanti
2. solo funzioni
3. zero side-effects
4. Elm Architecture
5. Zero errori di runtime
6. Ogni If deve avere il suo Else
7. No nulls
8. No loops


---

Basics

1. Operazioni: `1 + 2 == 3`
2. Stringhe: `"foo" ++ "bar"`
3. Liste: `[1, 2, 3, 4] ++ [5, 6, 7]`, `List.member 3 [1, 2, 3] == True`
4. Tuple: `(1, 2)`, `Tuple.first (1, 2) == 1`
5. Records: `type alias Persona = { nome: "Enrico", cognome: "Sasdelli" }`
6. Tipi: `type GameStatus = WaitingToStart | Playing | GameOver`
7. Maybe: 
8. Funzioni:
   ```elm
   sum: Int -> Int -> Int
   sum a b =
       a + b
   ```
9. Operazioni sulle funzioni `|>` e `>>`
10. Partial Application
11. Pattern Matching

---

Dichiarare una funzione in elm:

```elm

sum: Int -> Int -> Int
sum a b =
    a + b
    
```

---
