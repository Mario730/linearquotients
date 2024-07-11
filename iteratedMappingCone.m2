loadPackage "Complexes"
n = 5
Q = QQ[x_1..x_n]

iterConeMapping = (idealGens, baseRing) -> (
    use baseRing;
    baseIdeal = ideal (idealGens#0);
    baseComplex = freeResolution baseIdeal;
    for gen from 1 to #idealGens-1 do (
        print(idealGens#gen);
        use baseRing;
        newIdeal := ideal idealGens#gen;
        baseIdeal := ideal idealGens_{0..(gen-1)};
        idealQuot := baseIdeal:newIdeal;
        newComplex := freeResolution idealQuot;
        -- firstMap := map(newComplex^0, baseComplex^0, matrix({idealGens#gen}));
        complexMap := extend(baseComplex, newComplex, matrix({idealGens#gen}));
        baseComplex = cone complexMap;
    );
    return baseComplex;
)
-*
idealGens = {x_1*x_2, x_2*x_3, x_3*x_4, x_4*x_5}
iterConeMapping (idealGens, Q)
*-