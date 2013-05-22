% ![logo](images/logo.png) SymPy Gamma and SymPy Live: Python and Mathematics Online
% David Li
% 27 June 2013

# Background

- High school student!
- Google Code-In 2011 – SymPy Live
    - Mobile site
    - Autocompletion

- 2012…
    - Resurrected Gamma
    - Misc. improvements for Live

- Contributing experiences

# SymPy Live

http://live.sympy.org

What's this? Try it out!

    >>> (1/cos(x)).series(x, 0, 10)
    >>> integrate(x**2 * sin(x))

__http://goo.gl/ijLD4__

<!-- TODO: seems to hang Live site when visited from mobile -->
![Scan to evaluate](images/live_example_qr.png)

---

## Uses

- Interactive documentation
    - Play with SymPy with the docs in front of you
- "Try-before-you-buy" (though SymPy is free)
    - Explore nearly all of SymPy's features online
    - http://docs.sympy.org/0.7.2/tutorial.html

- Other projects can benefit too!
    - Sphinx extension

---

[![Sphinx Extension](images/sphinx.png)](http://live.sympy.org)

---

## Case Study: Sphinx Extension

- Built on a SciPy 2011 presentation!
- Sphinx extension adds script/link tags to docs
- Live server provides these resources

---

## Implementation

- Python 2.7 on Google App Engine
- Complications
    - No persistent interpreter
    - Can't pickle everything
    - Execution time limit

---

## How we handle it

#. Reinitialize globals
    - Reevaluate any statement that created an unpickable
    - Unpickle everything else
#. Evaluate the statement(s)
#. Look at the new globals
    - If any are unpicklable, store the statement itself
    - Else just pickle and store the globals

---

- Problems
    - What if (an expression involving) `_` created an unpicklable?
    - Function definitions
- Improvements?
    - Retain session when navigating between pages (Sphinx)
    - Fixing bugs!

# SymPy Gamma

http://www.sympygamma.com

![SymPy Gamma](images/gamma.png)

---

## Features

- Enter an expression, get information about it

![SymPy Gamma](images/gamma_example.png)

---

- Integrals: get steps, solution

<div class="horizontal">

[![](images/qr_gamma_integral.png)](http://www.sympygamma.com/input/?i=integrate%28exp%28x%29%2F%281+%2B+exp%282x%29%29%29)

![](images/example_gamma_integral.png)

</div>

---

- Trigonometric expression: alternate forms

[![](images/qr_gamma_trig.png)](http://www.sympygamma.com/input/?i=sin%282x%29+%2F+%281+-+cos%5E2%282x%29%29)

---

- Most expressions: 2D graph. Here: $$ sin(2 sin(2 sin(x))) $$

Can export to SVG, used here; no link provided (it's rather slow).

<img src="images/example_gamma_graph.svg" id="gamma-graph" />

---

- Numerical expressions: floating-point approximations

---

<!--

Demonstrate:

- Various result types
    - (put inputs here)
- Graphing (zoom, pan, export, resize)

-->

---

## Implementation

#. Determine which "cards" to use based on the type of the input
#. Return these (with some HTML scaffolding) to the browser
#. Browser loads the result from the server via JavaScript

---

- Quite simple
- Interesting features implemented in JavaScript:
    - 2D plotting with SVG
