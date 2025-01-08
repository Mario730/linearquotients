findLinearOrderings = (edgeIdeal, n) -> (
    beginRecursion = (edgeIdeal, n) -> (
        use Q;
        genList = first entries gens trim edgeIdeal;
        m = trim (ideal(x_1..x_n))^2;
        bestOrders = {};
        linear = set{};
        nonlinear = set{};
        maxLen = 0;
        recurse = (ordering, remainders) -> (
            if maxLen == #genList then (
                return;
            );
            for remain in remainders do (
                I := trim ideal(ordering);
                J := trim ideal(remain);
                if (member({I, J}, linear)) then (
                    -- If I:J is known to be linear
                    recurse(ordering | {remain}, delete(remain, remainders));
                )
                else if (member({I, J}, nonlinear)) then (
                    -- If I:J is known to be nonlinear
                    break 1;
                )
                else (
                    -- If we've reached an unfound quotient
                    idealQuot := trim I:J;
                    quotGens := first entries gens idealQuot;
                    count := 0;
                    for i in quotGens do (
                        if i % m != 0 then (
                            count = count + 1;
                        );
                    );
                    if count != #quotGens then (
                        -- If I:J is found to be nonlinear
                        nonlinear = nonlinear + set{I, J};
                        continue;
                    );
                    -- If I:J is found to be linear
                    linear = linear + set{I, J};
                    if (#ordering + 1 == #genList) then (
                        -- If we are done
                        maxLen = #genList;
                        bestOrders = flatten {ordering, remain};
                        return;
                    );
                    if (#ordering + 1 > maxLen) then (
                        -- If we have more orderings to search
                        maxLen = #ordering + 1;
                        bestOrders = flatten {ordering, remain};
                        recurse(ordering | {remain}, delete(remain, remainders));
                    );
                );
            );
        );
        for gen in genList do (
            recurse({gen}, delete(gen, genList));
            if maxLen == length(genList) then (
                << endl << "Linear ordering found, returning as a list." << endl;
                return bestOrders;
            );
        );
        if maxLen < length(genList) then (
            << endl << "No linear ordering found; returning most linear ordering as a list." << endl;
            return bestOrders;
        );
    );
    val := elapsedTiming beginRecursion(edgeIdeal, n);
    << "    -- Elapsed time: " << val#0 << " seconds." << endl;
    return val#1;
);
