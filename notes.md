# Background

- SymPy: Python CAS/symbolic algebra library
- Web applications: demonstrate the library, help out users
- Others contributed website design, etc

- Experiences
    - Very good about reviewing code & providing feedback

# Live

- Online shell, akin to Python console in browser (+ limitations)

## Uses

- So you're looking at the documentation, and you want to play with the
  examples. Two options:

1. Copy-and-paste into a terminal. This is annoying. You have to delete all
   the >>> blocks manually, get rid of example output, etc...

   We could improve this by adding a button to reformat the block for you,
   or...

2. Leverage SymPy Live. Click a button, and the terminal appears in the
   browser.

- For the main Live shell...
    - Don't need anything installed - play with Python from a Chromebook!
    - Share sessions with others (bug reports, examples)

Nice features:

- LaTeX output - for users who are more familiar with math than Python
- Tab completion (present in normal shell too)
- Save a session as a URL

Demo session?

- Use the mobile interface and zoom in so everyone can see (~ 300%?)
- Use a session URL to save typing time

[URL](http://live.sympy.org/shellmobile?evaluate=expr%20%3D%20x%20%2B%202*y%0A%23--%0Ax%20*%20expr%0A%23--%0Aexpand(x%20*%20expr)%0A%23--%0Aexpr%20%3D%20exp(x*y*z)%0A%23--%0Adiff(expr%2C%20x%2C%20y%2C%20y%2C%20z%2C%20z%2C%20z)%0A%23--%0Aintegrate(diff(expr%2C%20x)%2C%20x)%0A%23--%0A)

(This is based on the new tutorial)

    >>> expr = x + 2*y  # note Live defines x, y for us by default
    >>> x * expr
    >>> expand(x * expr)  # we have LaTeX by default, vs normal console
    >>>                   # Unicode has to be explicitly enabled
    >>> expr = exp(x*y*z)
    >>> diff(expr, x, y, y, z, z, z)
    >>> integrate(_)

## Sphinx Extension

- Other projects: set up Live instance on GAE (probably want to
  s/SymPy/YourProject first)

## Implementation

- Security?

## How we handle it

- Pickle results of each statement...but not everything can be pickled
- Security: GAE is sandboxed, so if someone gets out of the sandbox that's
  Google's problem

# Gamma

Uses

- Clone of Wolfram|Alpha, but intended more to demonstrate SymPy's features
- Eventually will be used to show examples on homepage
- Limited "implicit" parsing makes it more familiar to users not experienced
  with Python

## Features

Integrals

---

Trig

---

Graph

Why it's slow: currently code is structured so that all data has to be
loaded before graphs will render. Unfortunately for this particular
expression trying to get the integral/series expansion is quite slow.


## Implementation

- Reason why AJAX is used: get around the 60-second time limit

- Interesting features are JavaScript or SymPy
- Implicit parsing
    - Makes it easier for users
    - Toolbar on mobile helps as well
- 2D plotting
    - JavaScript based; server computes values, but client renders them ->
      more interactive
