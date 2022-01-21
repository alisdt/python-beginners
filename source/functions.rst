User-defined functions
**********************

Introduction
============

Programmers can deal with some pretty complex and abstract problems, but one 
sign of a good programmer is that they're lazy. They only like to deal with one 
thing at a time. So you need a way to break up problems into smaller, discrete 
pieces, which lets you focus on just one piece.

Functions are one way to do this in Python. Let's take
``turtle.reset()`` for example. ``reset`` is a function we call on our ``turtle``, and 
it performs a number of steps:

* Erase the drawing board.
* Set the pen width and color back to default.
* Move the turtle back to its initial position.

But because all the code is contained in the function, we don't have to worry about the 
details. We can simply *call* (i.e. run) the function, and know it will do what it says for us.

So - how to write your own function?

A function can be defined with the ``def`` keyword in Python::

    def line_without_moving():
        turtle.forward(50)
        turtle.backward(50)

This function we defined is called ``line_without_moving`` and it is
an abstraction for two turtle steps - a move forward and a move
backward.

To use it (or as it is usually called, "to call it"), write its name
followed by parentheses::

    line_without_moving()
    turtle.right(90)
    line_without_moving()
    turtle.right(90)
    line_without_moving()
    turtle.right(90)
    line_without_moving()

We could write more functions to remove some of the repetition::

    def star_arm():
        line_without_moving()
        turtle.right(360 / 5)

    for _ in range(5):
        star_arm()

**Defining a function** is like writing a recipe to bake a cake. Once it's done 
you have the recipe, but you still don't have the cake!

**Calling a function** is like following the recipe and baking the cake. Once you
have written the recipe you can follow it as many times as you like, and you'll
get a cake each time!

.. important::

   As with loops, Python uses *indenting* for blocks of code
   that belong together. In Python a block (like the function
   definitions shown above) is introduced with a colon at the end of the
   line, and subsequent commands are indented --- usually 4 spaces
   further in. The block ends with the first line that isn't indented.

   This is different to many other programming languages, which use
   special characters (like curly braces ``{}``) to group blocks of
   code together.

You have to define a function before you call it, or Python won't know what you mean.

So this works::

    def my_lovely_function():
        print("I am called")

    my_lovely_function()

but this doesn't::

    my_lovely_function()

    def my_lovely_function():
        print("I am called")

If you call a function before it is defined, it's like trying to read a
recipe that hasn't been written yet.

A function for a square
=======================

Exercise
--------

Write a function that draws a square. Could you use this function to improve the
tilted squares program? If you change the program to use a function, is it easier
to experiment with?

.. rst-class:: solution

Solution
--------

::

    def tilted_square():
      turtle.left(20)     # now we can change the angle only here
      for _ in range(4):
          turtle.forward(50)
          turtle.left(90)

    tilted_square()
    tilted_square()
    tilted_square()

    # bonus: you could have a separate function for drawing a square,
    # which might be useful later:

    def square():
      for _ in range(4):
          turtle.forward(50)
          turtle.left(90)

    def tilted_square():
      turtle.left(20)
      square()

    # etc

A function for a hexagon
========================

Exercise
--------

Write a function that draws a hexagon.

.. image:: /images/hexagon.png

Now combine that function into a honeycomb. Just make it with a single layer like this:

.. image:: /images/honeycomb.png

Give it a good go!

.. hint::

   Make sure your hexagon function returns your turtle to exactly the same 
   position and angle it was before it was asked to draw the hexagon. This 
   makes it easier to reason about.


.. rst-class:: solution

Solution
--------

::

    def hexagon():
      for _ in range(6):
          turtle.forward(100)
          turtle.left(60)

    for _ in range (6):
        hexagon()
        turtle.forward(100)
        turtle.right(60)

You could also put the ``turtle.forward(100); turtle.right(60)`` portion in the
function, but you better not call it ``hexagon`` in that case.  That's
misleading because it actually draws a hexagon and then advances to a position
where another hexagon would make sense in order to draw a honeycomb.  If you
ever wanted to reuse your hexagon function outside of honeycombs, that would be
confusing.
