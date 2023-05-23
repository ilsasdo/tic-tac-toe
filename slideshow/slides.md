---
Elm

---

Features

1. solo costanti
2. solo funzioni
3. zero side-effects
4. Elm Architecture
5. Zero errori di runtime
6. Obbligo di avere tutti i rami descritti
7. No nulls
8. No loops


---

Basics

1. Operazioni: `1 + 2`
2. Stringhe: `"foo" ++ "bar"`
3. Liste: `[1, 2, 3, 4]`
4. Records: `type alias Persona = { nome: "Enrico", cognome: "Sasdelli" }`
5. Tipi: `type GameStatus = WaitingToStart | Playing | GameOver`
6. Funzioni:
   ```
   sum: Int -> Int -> Int
   sum a b =
       a + b
   ```


---

Dichiarare una funzione in elm:

```elm

sum: Int -> Int -> Int
sum a b =
    a + b
    
```

---
