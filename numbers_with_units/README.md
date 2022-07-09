# Numbers with Units

Erik claimed, 

> I’ve been writing code to deal with temperature in different units Celsius, Kelvin and Fahrenheit, because I do calculations involving the gass laws. I do this to determine out how large aerostat habitats have to be on Venus to float. For those who follow me on medium you might know of my interest in space exploration and colonization of Venus.

> I will show you how we can represent different units of temperature in Julia and Python. This is an interesting case for Julia because it shows quite clearly the advantages of using a language supporting multiple-dispatch, in comparison to a more traditional object oriented language such as Python, which relies on single dispatch.

## Goals

* Implement `==` functionality.
* Addition (~~and subtraction~~) of C and F and K.
* Ignore multiplication and division for now.

## Methods

* Given homogeneous units, stay in those units.
* Given C and F, convert all output to C.
* Regardless of units, support `to_C` and `to_F` conversions.

### Given a slope bug

* we didn't want to debug, switch to usd and eur

## Conclusions

* Python `plus` and `equals` scales poorly with new types. Python lacks dispatch (function overloading)
* Both naive and refactored julia worked, but only refactored was easily extensible
* Julia's subtyping is more robust than OOP inheritance (python and C++). OOP inheritance assumes we can either extend the original library or expect clients to track `OriginalRGB` versus `MyRBG`; this forces RTTI on clients.
* Python implementation would combinatorically explode with RTTI as new types were defined.
* Allowed python implementation to be naive. We didn't try to refactor it.
* Complexity for new user doing software dev (rather than scripting) is a big downside for Julia. *Is this too harsh?*

## References

* https://erik-engheim.medium.com/defining-custom-units-in-julia-and-python-513c34a4c971
* https://www.google.com/search?client=firefox-b-1-d&q=wiki+convert+C+to+F
