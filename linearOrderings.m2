findLinearOrderings = (genList, n) -> (
    use Q;
    genList = genList;
    m = ideal(x_1..x_n) * ideal(x_1..x_n);
    opts := {};
    for gen from 0 to #genList-1 do (
        newTail := drop(genList, {gen,gen});
        opts = opts | {linearRecursion({genList#gen}, newTail)};
        lastOpt = opts_{#opts-1};
        if (#lastOpt == #genList) then (
            break 2;
        );
    );
    lengths := apply(opts, p -> #p);
    spot := maxPosition lengths;
    if (#(opts#spot) == #genList) then (
        << "Linear ordering found: " << opts#spot < "  ...  ";
        << "Quotients: " << getQuotients(opts#spot);
        return;
    );
    << "No linear ordering found; most linear: " << opts#spot << "  ...  ";
    << "Quotients: " << getQuotients(opts#spot);
    return;
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
            ) else (
                break 1;
            );
        );
        if count == #quotGens then (
            if (#tail == 1) then (
                return {inp | {tail}};
            );
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

findLinearOrderings (antiCycleFive, 5);