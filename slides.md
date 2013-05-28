% ![logo](images/logo.png) SymPy Gamma and SymPy Live: Python and Mathematics Online
% David Li
% 27 June 2013

# Background

- High school student!
- Google Code-In 2011 – SymPy Live
    - Mobile site
    - Autocompletion

- Contributing experiences

# SymPy Live

http://live.sympy.org

What's this? Try it out!

    >>> (1/cos(x)).series(x, 0, 10)
    >>> integrate(x**2 * sin(x))

__http://goo.gl/ijLD4__

![Scan to evaluate](images/live_example_qr.png)

---

## Uses

[Demo URL](http://goo.gl/2usJk)

[![Sphinx Extension](images/sphinx.png)](http://live.sympy.org)

---

## Case Study: Sphinx Extension

- Built on a SciPy 2011 sprint
- Sphinx extension adds script/link tags to docs
- Live server provides these resources
- Other projects can use this too!

---

## Implementation

- Python 2.7 on Google App Engine
- Complications
    - No persistent interpreter
    - Execution time limit
    - Security of executing random code?

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

## Security

<h1 style="text-align:center;"> It's Google's problem :)</h1>

---

- Problems
    - What if (an expression involving) `_` created an unpicklable?
    - Function definitions
- Improvements?
    - Retain session when navigating between pages (Sphinx)
    - Fixing bugs!

# SymPy Gamma

http://www.sympygamma.com

[![SymPy Gamma](images/gamma.png)](http://www.sympygamma.com)

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

## Implementation

#. Determine which "cards" to use based on the type of the input
#. Return these (with some HTML scaffolding) to the browser
#. Browser loads the result from the server via JavaScript

# Thanks To

- SymPy team, in particular, Aaron Meurer and Ondrej Certik
- Other SymPy Live authors:
    - Ondřej Čertík
    - David Roberts
    - Leonel Hernandez
    - Mateusz Paprocki
    - Vinzent Steinberg
    - Aaron Meurer

---

- (continued)
    - Alex Houlton
    - Stefan Krastanov
    - Kshitij Aranke
    - Tristan Hume
    - Grzegorz Świrski
    - areke
    - Mateusz Kmiecik
    - Steve Anton

---

- Other SymPy Gamma authors:
    - Ondrej Certik
    - André Luiz Guimarães de Souza Leite
    - Aaron Meurer

- https://github.com/sympy/sympy/blob/master/AUTHORS
- https://github.com/sympy/sympy_gamma/blob/master/AUTHORS
- https://github.com/sympy/sympy-live/blob/master/AUTHORS
