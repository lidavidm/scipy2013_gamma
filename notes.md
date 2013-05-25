# Background

# Live

## Uses

What I could say, using SymPy tutorial/talk as an example

- What if the user wants to play with these examples?

1. Copy-and-paste into a terminal. This is annoying. She would have to
   delete all the >>> blocks manually, get rid of example output, etc...

   We could improve this by adding a button to do this for her, or...

2. Leverage SymPy Live. Click a button, and the terminal appears in the
   browser.

Nice features:

- LaTeX output
- Tab completion (present in normal shell too)
- Save a session as a URL

Create a demo session here, building off of Sphinx


## Implementation

## How we handle it

---

## Sphinx

# Gamma

## Features

Integrals

---

Trig

---

Graph

Why it's slow: currently code is structured so that all data has to be
loaded before graphs will render. Unfortunately for this particular
expression trying to get the integral/series expansion is quite slow.

---

Numerical

## Implementation

- Implicit parsing
