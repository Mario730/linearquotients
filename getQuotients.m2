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