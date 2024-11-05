# Methods for finding and verifying linear quotients of ideals

This repository contains the following Macaulay2 files: findLinearOrderings.m2, isLinear.m2, and getQuotients.m2. Collectively, these files consist of 3 methods for working with ideals of polynomial rings. The usage and behavior of each method are detailed below.

## `isLinear ( ordering, n )`
Use this method to test if the given order of a list of generators yields linear quotients.

### Parameters:
- `ordering`: a list of generators in `Q = QQ[x_1 .. x_n]`
- `n`: the dimension of `Q`, the ideal's polynomial ring

### Returns:
- `true`: if `ordering` is a linear quotients ordering
- `false`: otherwise

## `getQuotients ( ordering )`
Use this method to return the quotients of a given list of ideal generators.

### Parameters:
- `ordering`: a list of generators in `Q = QQ[x_1 .. x_n]`

### Returns:
- `{quots}`: a list of the linear quotients

## `findLinearOrderings ( edgeIdeal, n )`
This method is used to find the "most linear" ordering of an ideal's generators; if an ordering exists that yields all linear quotients, it will be returned. Otherwise, an ordering will be returned that has the *most* linear quotients.

### Parameters:
- `edgeIdeal`: an edge ideal in `Q = QQ[x_1 .. x_n]`
- `n`: the dimension of `Q`, the ideal's polynomial ring

### Returns:
- `{order}`: a list of the most linear ordering of the given ideal