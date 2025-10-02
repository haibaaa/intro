# Intro

- **Made in 1972** → logic programming language
- **Interpreted garbo**
- If you need any form of efficiency → _this is not it_ (primarily made to be
  _expressive_)
- Interactive mode: the **Python shell** equivalent
- **Consulted code** = loaded from a file
- Lines beginning with `?-` can be typed in interactive mode

---

# Weird Shit

### Core Concepts

- **Predicate** → `subprogram`
  - Represents the _state of the world_
  - Must start with a lowercase letter, or be enclosed in `' '`

- **Goal** → `command`
  - Tries to make a state of the world come true

- **Fact** → `predicate`
  - Simplest form

- **Variables** → `YourRegularVar`
  - Anything starting with a **capital letter**
  - (The sheer stupidity of this heap of ass is astounding)

---

### Operators & Symbols

- `.` → **EOL** (_for whatever fucking reason_)
- `;` → **OR operator** (_also used to get the next result of a query_)
- `,` → **AND operator** (_yeah…_)
- `%` → **Comments** (_single-line only_)
- `=` → **Unification** (_horseshit_)

---

# Unification

> [!IMPORTANT] some heavy weed may or may not have been involved

A cursed combo of:

- **Unification**
- **Equality**

---

### Usage Rules

- If **both sides bound** → check equality
- If **one side free** → assign the defined value to the undefined
- If **both free** → assignment is remembered for future once either becomes
  bound
