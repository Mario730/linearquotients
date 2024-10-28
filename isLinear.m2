isLinear = (ordering, n) -> (
    use Q;
    m := ideal{x_1..x_n} * ideal{x_1..x_n};
    for i from 1 to (#ordering-1) do (
        use Q;
        I := trim ideal ordering_{0..(i-1)};
        J := trim ideal ordering_{i};
        use Q;
        quotJ := trim (I:J);
        for quotGen in (first entries gens quotJ) do (
            if quotGen % m == 0 then (
                return false;
            );
        );
    );
    return true;
);