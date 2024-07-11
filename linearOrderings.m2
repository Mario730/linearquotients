-*
linearOrderings - a program to find linear orderings of a set of generators of an ideal in Macaulay2
Usage:
    findLinearOrderings(genList, n)
    isLinear(genList, n))
    Note that the user should define Q to be the polynomial ring QQ[x_1..x_n] before calling
Params:
    genList: a list of generators of an ideal in Q = QQ[x_1..x_n]
    n: the number of variables in Q
Returns:
    findLinearOrderings(genList, n):
        a list with two elements:
            1. a list of generators of an ideal in Q that is "the most" linear ordering of genList
            2. a list of the linear quotients of list 1, taken in order
    isLinear(genList, n)::
        true if genList is a linear ordering of the given ideal, false otherwise

Mario Stinson-Maas, Spring 2024
*-
findLinearOrderings = (genList, n) -> (
    use Q;
    m = ideal(x_1..x_n) * ideal(x_1..x_n);
    opts := {};
    for gen from 0 to #genList-1 do (
        newTail := drop(genList, {gen,gen});
        opts = opts | {linearRecursion({genList#gen}, newTail)};
    );
    lengths := apply(opts, p -> #p);
    spot := maxPosition lengths;
    return {opts#spot, getQuotients(opts#spot)};
)
linearRecursion = (inp, tail) -> (
    if #tail == 0 then (
        return inp;
    );
    opts := {};
    for gen from 0 to (#tail-1) do (
        use Q;
        I := ideal(inp);
        J := ideal(tail#gen);
        idealQuot := trim I:J;
        quotGens := first entries gens idealQuot;
        count = 0;
        for i in quotGens do (
            if i % m != 0 then (
                count = count + 1;
            );
        );
        if count == #quotGens then (
            newTail := drop(tail, {gen,gen});
            opts = opts | {linearRecursion(inp | {tail#gen}, newTail)};
        );
    );
    if #opts == 0 then (
        return inp;
    );
    lengths := apply(opts, p -> #p);
    spot := maxPosition lengths;
    return opts#spot;
)
getQuotients = (genList) -> (
    quots := {};
    for i from 0 to #genList-2 do (
        use Q;
        I := ideal(genList_{0..i});
        J := ideal(genList#(i+1));
        idealQuot := trim I:J;
        quots = quots | {first entries gens idealQuot};
    );
    return quots;
)
isLinear = (genList, n) -> (
    use Q;
    m = ideal{x_1..x_n} * ideal{x_1..x_n};
    for i from 1 to (#genList-1) do (
        use Q;
        I := ideal genList_{0..(i-1)};
        J := ideal genList_{i};
        use Q;
        quotJ := trim (I:J);
        for quotGen in (first entries gens quotJ) do (
            if (quotGen) % m == 0 then (
                return false;
            );
        );
    );
    return true;
);