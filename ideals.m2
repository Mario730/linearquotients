n = 5
Q = QQ[x_1..x_n]

antiCycleFive = {x_1*x_3, x_1*x_4, x_2*x_4, x_2*x_5, x_3*x_5}
antiPathSix = {x_1*x_3, x_1*x_4, x_1*x_5, x_1*x_6, x_2*x_4, x_2*x_5, x_2*x_6, x_3*x_5, x_3*x_6, x_4*x_6}

-*
O orderings:
*-
F = {x_2^2*x_5^2, x_2*x_3*x_5^2, x_3^2*x_5^2, x_2^2*x_4*x_5, x_2*x_3*x_4*x_5, x_1*x_2*x_3*x_5, x_1*x_2*x_4*x_5, x_1*x_3^2*x_5, x_1*x_3*x_4*x_5}
S = {x_1^2*x_3^2, x_1^2*x_3*x_4, x_1*x_2*x_3*x_4, x_1*x_2*x_4^2, x_2^2*x_4^2, x_1^2*x_4^2}

-*
I(A_6)^2:
F = {x_6^2*x_2^6, x_6^2*x_2*x_3, x_6^2*x_2*x_4, x_6^2*x_3^2, x_6^2*x_3*x_4, x_6^2*x_4^2, x_6*x_1*x_3^2, x_6*x_1*x_2*x_3, x_6*x_1*x_2*x_4, x_6*x_1*x_2*x_5, x_6*x_1*x_3*x_4, x_6*x_1*x_3*x_5, x_6*x_1*x_4^2, x_6*x_1*x_4*x_5, x_6*x_2^2*x_4, x_6*x_2^2*x_5, x_6*x_2*x_3*x_4, x_6*x_2*x_3*x_5, x_6*x_2*x_4^2, x_6*x_2*x_4*x_5, x_6*x_3^2*x_5, x_6*x_3*x_4*x_5}
S = {x_1^2*x_3^2, x_1^2*x_3*x_4, x_1^2*x_3*x_5, x_1^2*x_4^2, x_1^2*x_4*x_5, x_1*x_2*x_3*x_4, x_1*x_2*x_3*x_5, x_1*x_2*x_4^2, x_1*x_2*x_4*x_5, x_1^2*x_5^2, x_1*x_2*x_5^2, x_1*x_3^2*x_5, x_1*x_3*x_4*x_5, x_1*x_3*x_5^2, x_2^2*x_4^2, x_2^2*x_4*x_5, x_2^2*x_5^2, x_2*x_3*x_4*x_5, x_2*x_3*x_5^2, x_3^2*x_5^2}
*-