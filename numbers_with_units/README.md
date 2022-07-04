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

## References

* https://erik-engheim.medium.com/defining-custom-units-in-julia-and-python-513c34a4c971
* https://www.google.com/search?client=firefox-b-1-d&q=wiki+convert+C+to+F