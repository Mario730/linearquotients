# Methods for finding and identifying linear quotients of ideals

This repository contains the file linearOrderings.m2, which consists of 3 methods for working with ideals of polynomial rings. The usage and behavior of each method are detailed below.

## `isLinear ( genList, n )`
Use this method to test if the given order of a list of generators yields linear quotients.

### Parameters:
- `genList`: a list of generators in `Q = QQ[x_1 .. x_n]`
- `n`: the dimension of `Q`, the ideal's polynomial ring

### Returns:
- `true`: if the order yields linera quotients
- `false`: else

## `getQuotients ( genList )`
Use this method to return the quotients of a given list of ideal generators.

### Parameters:
- `genList`: a list of generators in `Q = QQ[x_1 .. x_n]`

### Returns:
- `quots`: a list of the linear quotients

## `findLinearOrderings ( genList, n )`
This method is used to find the "most linear" ordering of an ideal's generators; if an ordering exists that yields all linear quotients, it will be returned. Otherwise, an ordering will be returned that has the *most* linear quotients.

### Parameters:
- `genList`: a list of generators in `Q = QQ[x_1 .. x_n]`
- `n`: the dimension of `Q`, the ideal's polynomial ring

### Returns:
- `order`: a list of the most linear ordering of the given ideal