findLinearOrderings = (edgeIdeal, n) -> (
    beginRecursion = (edgeIdeal, n) -> (
        genList = first entries gens trim edgeIdeal;
        m = trim (ideal(x_1..x_n))^2;
        bestOrders = {};
        checked = set{};
        maxLen = 0;
        recurse = (ordering, remainders) -> (
            if maxLen == #genList then (
                return;
            );
            -- See if the set of already ordered generators and the set of remainders have already been checked
            if (member(set ordering, checked)) then (
                return;
            );
            checked = checked + set{set ordering};

            I := trim ideal(ordering);
            for remain in remainders do (
                J := trim ideal(remain);

                idealQuot := trim I:J;
                quotGens := first entries gens idealQuot;
                count := 0;
                nonlinear := false;
                for i in quotGens do (
                    if i % m == 0 then (
                        nonlinear = true;
                        break;
                    );
                );
                -- If I:J is found to be nonlinear
                if nonlinear then (
                    continue;
                );
                -- If I:J is found to be linear
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
                );
                recurse(ordering | {remain}, delete(remain, remainders));
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