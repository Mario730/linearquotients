getQuotients = (ordering) -> (
    quots := {};
    for i from 0 to #ordering-2 do (
        use Q;
        I := ideal(ordering_{0..i});
        J := ideal(ordering#(i+1));
        idealQuot := trim I:J;
        quots = quots | {first entries gens idealQuot};
    );
    return quots;
)