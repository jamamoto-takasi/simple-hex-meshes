// Alteration of cylinder-1.geo. Inner cuboid has curved edges.
// In fact this modification lead to the mesh with higher non-orthogonality.

// Geometry of the cylinder
R = 5;
h = 10;

// Radius of the edges of the inner cuboid
R_cuboid = 100;

// Bottom plane points
Point(1) = {0, 0, 0, 1.0};
Point(2) = {3.5355339059327373, 3.5355339059327373, 0, 1.0};
Point(3) = {7.0710678118654746, 7.0710678118654746, 0, 1.0};
Point(4) = {-3.5355339059327373, 3.5355339059327373, 0, 1.0};
Point(5) = {-7.0710678118654746, 7.0710678118654746, 0, 1.0};
Point(6) = {-3.5355339059327373, -3.5355339059327373, 0, 1.0};
Point(7) = {-7.0710678118654746, -7.0710678118654746, 0, 1.0};
Point(8) = {3.5355339059327373, -3.5355339059327373, 0, 1.0};
Point(9) = {7.0710678118654746, -7.0710678118654746, 0, 1.0};

// Top plane points
Point(10) = {0, 0, h, 1.0};
Point(11) = {3.5355339059327373, 3.5355339059327373, h, 1.0};
Point(12) = {7.0710678118654746, 7.0710678118654746, h, 1.0};
Point(13) = {-3.5355339059327373, 3.5355339059327373, h, 1.0};
Point(14) = {-7.0710678118654746, 7.0710678118654746, h, 1.0};
Point(15) = {-3.5355339059327373, -3.5355339059327373, h, 1.0};
Point(16) = {-7.0710678118654746, -7.0710678118654746, h, 1.0};
Point(17) = {3.5355339059327373, -3.5355339059327373, h, 1.0};
Point(18) = {7.0710678118654746, -7.0710678118654746, h, 1.0};

// Center points for curved edges of the cuboid
Point(19) = {5.5355339059327373, 0, 0, 1.0};
Point(20) = {-5.5355339059327373, 0, 0, 1.0};
Point(21) = {0, 5.5355339059327373, 0, 1.0};
Point(22) = {0, -5.5355339059327373, 0, 1.0};
Point(23) = {5.5355339059327373, 0, h, 1.0};
Point(24) = {-5.5355339059327373, 0, h, 1.0};
Point(25) = {0, 5.5355339059327373, h, 1.0};
Point(26) = {0, -5.5355339059327373, h, 1.0};

Circle(1) = {13, 26, 11};
Circle(2) = {11, 24, 17};
Circle(3) = {17, 25, 15};
Circle(4) = {15, 23, 13};
Circle(5) = {4, 22, 2};
Circle(6) = {2, 20, 8};
Circle(7) = {8, 21, 6};
Circle(8) = {6, 19, 4};
Circle(9) = {14, 10, 12};
Circle(10) = {12, 10, 18};
Circle(11) = {18, 10, 16};
Circle(12) = {16, 10, 14};
Circle(13) = {5, 1, 3};
Circle(14) = {3, 1, 9};
Circle(15) = {9, 1, 7};
Circle(16) = {7, 1, 5};
Line(17) = {11, 12};
Line(18) = {17, 18};
Line(19) = {15, 16};
Line(20) = {13, 14};
Line(21) = {2, 3};
Line(22) = {8, 9};
Line(23) = {6, 7};
Line(24) = {4, 5};
Line(25) = {4, 13};
Line(26) = {2, 11};
Line(27) = {8, 17};
Line(28) = {6, 15};
Line(29) = {3, 12};
Line(30) = {9, 18};
Line(31) = {7, 16};
Line(32) = {5, 14};
Line Loop(33) = {3, 4, 1, 2};
Ruled Surface(34) = {33};
Line Loop(35) = {1, 17, -9, -20};
Ruled Surface(36) = {35};
Line Loop(37) = {2, 18, -10, -17};
Ruled Surface(38) = {37};
Line Loop(39) = {11, -19, -3, 18};
Ruled Surface(40) = {39};
Line Loop(41) = {19, 12, -20, -4};
Ruled Surface(42) = {41};
Line Loop(43) = {27, -2, -26, 6};
Ruled Surface(44) = {43};
Line Loop(45) = {25, 1, -26, -5};
Ruled Surface(46) = {45};
Line Loop(47) = {8, 25, -4, -28};
Ruled Surface(48) = {47};
Line Loop(49) = {28, -3, -27, 7};
Ruled Surface(50) = {49};
Line Loop(51) = {8, 5, 6, 7};
Ruled Surface(52) = {51};
Line Loop(53) = {21, 14, -22, -6};
Ruled Surface(54) = {53};
Line Loop(55) = {7, 23, -15, -22};
Ruled Surface(56) = {55};
Line Loop(57) = {8, 24, -16, -23};
Ruled Surface(58) = {57};
Line Loop(59) = {13, -21, -5, 24};
Ruled Surface(60) = {59};
Line Loop(61) = {21, 29, -17, -26};
Ruled Surface(62) = {61};
Line Loop(63) = {24, 32, -20, -25};
Ruled Surface(64) = {63};
Line Loop(65) = {23, 31, -19, -28};
Ruled Surface(66) = {65};
Line Loop(67) = {22, 30, -18, -27};
Ruled Surface(68) = {67};
Line Loop(69) = {11, -31, -15, 30};
Ruled Surface(70) = {69};
Line Loop(71) = {30, -10, -29, 14};
Ruled Surface(72) = {71};
Line Loop(73) = {29, -9, -32, 13};
Ruled Surface(74) = {73};
Line Loop(75) = {32, -12, -31, 16};
Ruled Surface(76) = {75};
Surface Loop(77) = {34, 52, 44, 50, 48, 46};
Volume(78) = {77};
Surface Loop(79) = {74, 36, 60, 46, 62, 64};
Volume(80) = {79};
Surface Loop(81) = {64, 58, 76, 42, 66, 48};
Volume(82) = {81};
Surface Loop(83) = {66, 50, 68, 56, 70, 40};
Volume(84) = {83};
Surface Loop(85) = {44, 62, 54, 72, 38, 68};
Volume(86) = {85};

Transfinite Line {25, 26, 27, 28} = 61;
Transfinite Line {29, 30, 31, 32} = 61;

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8} = 60;
Transfinite Line {9, 10, 11, 12, 13, 14, 15, 16} = 60;

Transfinite Line {17, 18, 19, 20, 21, 22, 23, 24} = 60;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";

Physical Surface("top") = {36, 38, 40, 42, 34};
Physical Surface("bottom") = {58, 60, 54, 52, 56};
Physical Surface("sides") = {74, 76, 70, 72};
Physical Volume("cylinder") = {82, 80, 78, 84, 86};
