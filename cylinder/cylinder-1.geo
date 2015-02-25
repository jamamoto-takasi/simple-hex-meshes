// Simple cylinder mesh, inner cuboid with 4 outer pieces.

// Cylinder radius [m]
R = 5;
p1 = R*Sqrt(2.0);
p2 = 0.5*p1;

// Cylinder height [m]
h = 10;

// Densities of the mesh, as the mesh is simple, we can control densities
// only in two directions.
rhoH = 61; // in horizontal direction
rhoV = 61; // in vertical direction

Point(1) = {  0,   0, 0, 1.0};
Point(2) = { p2,  p2, 0, 1.0};
Point(3) = { p1,  p1, 0, 1.0};
Point(4) = {-p2,  p2, 0, 1.0};
Point(5) = {-p1,  p1, 0, 1.0};
Point(6) = {-p2, -p2, 0, 1.0};
Point(7) = {-p1, -p1, 0, 1.0};
Point(8) = { p2, -p2, 0, 1.0};
Point(9) = { p1, -p1, 0, 1.0};

Point(10) = {  0,   0, h, 1.0};
Point(11) = { p2,  p2, h, 1.0};
Point(12) = { p1,  p1, h, 1.0};
Point(13) = {-p2,  p2, h, 1.0};
Point(14) = {-p1,  p1, h, 1.0};
Point(15) = {-p2, -p2, h, 1.0};
Point(16) = {-p1, -p1, h, 1.0};
Point(17) = { p2, -p2, h, 1.0};
Point(18) = { p1, -p1, h, 1.0};

Line(1) = {15, 17};
Line(2) = {17, 11};
Line(3) = {11, 13};
Line(4) = {13, 15};
Line(5) = {13, 14};
Line(6) = {11, 12};
Line(7) = {17, 18};
Line(8) = {15, 16};
Line(9) = {6, 4};
Line(10) = {4, 2};
Line(11) = {2, 8};
Line(12) = {8, 6};
Line(13) = {6, 7};
Line(14) = {4, 5};
Line(15) = {2, 3};
Line(16) = {8, 9};
Circle(17) = {12, 10, 14};
Circle(18) = {14, 10, 16};
Circle(19) = {16, 10, 18};
Circle(20) = {18, 10, 12};
Circle(21) = {3, 1, 5};
Circle(22) = {5, 1, 7};
Circle(23) = {7, 1, 9};
Circle(24) = {9, 1, 3};
Line(25) = {7, 16};
Line(26) = {6, 15};
Line(27) = {9, 18};
Line(28) = {8, 17};
Line(29) = {3, 12};
Line(30) = {2, 11};
Line(31) = {5, 14};
Line(32) = {4, 13};
Line Loop(33) = {1, 2, 3, 4};
Ruled Surface(34) = {33};
Line Loop(35) = {1, 7, -19, -8};
Ruled Surface(36) = {35};
Line Loop(37) = {8, -18, -5, 4};
Ruled Surface(38) = {37};
Line Loop(39) = {5, -17, -6, 3};
Ruled Surface(40) = {39};
Line Loop(41) = {6, -20, -7, 2};
Ruled Surface(42) = {41};
Line Loop(43) = {10, 30, 3, -32};
Ruled Surface(44) = {43};
Line Loop(45) = {2, -30, 11, 28};
Ruled Surface(46) = {45};
Line Loop(47) = {28, -1, -26, -12};
Ruled Surface(48) = {47};
Line Loop(49) = {26, -4, -32, -9};
Ruled Surface(50) = {49};
Line Loop(51) = {29, -6, -30, 15};
Ruled Surface(52) = {51};
Line Loop(53) = {28, 7, -27, -16};
Ruled Surface(54) = {53};
Line Loop(55) = {26, 8, -25, -13};
Ruled Surface(56) = {55};
Line Loop(57) = {32, 5, -31, -14};
Ruled Surface(58) = {57};
Line Loop(59) = {27, 20, -29, -24};
Ruled Surface(60) = {59};
Line Loop(61) = {29, 17, -31, -21};
Ruled Surface(62) = {61};
Line Loop(63) = {31, 18, -25, -22};
Ruled Surface(64) = {63};
Line Loop(65) = {25, 19, -27, -23};
Ruled Surface(66) = {65};
Line Loop(67) = {9, 10, 11, 12};
Ruled Surface(68) = {67};
Line Loop(69) = {10, 15, 21, -14};
Ruled Surface(70) = {69};
Line Loop(71) = {24, -15, 11, 16};
Ruled Surface(72) = {71};
Line Loop(73) = {16, -23, -13, -12};
Ruled Surface(74) = {73};
Line Loop(75) = {9, 14, 22, -13};
Ruled Surface(76) = {75};
Surface Loop(77) = {38, 64, 76, 58, 56, 50};
Volume(78) = {77};
Surface Loop(79) = {48, 56, 54, 66, 36, 74};
Volume(80) = {79};
Surface Loop(81) = {54, 46, 52, 60, 42, 72};
Volume(82) = {81};
Surface Loop(83) = {52, 44, 58, 62, 40, 70};
Volume(84) = {83};
Surface Loop(85) = {46, 48, 50, 44, 68, 34};
Volume(86) = {85};

Transfinite Line {1, 2, 3, 4} = rhoH;
Transfinite Line {17, 18, 19, 20} = rhoH;
Transfinite Line {9, 10, 11, 12} = rhoH;
Transfinite Line {21, 22, 23, 24} = rhoH;

// Outer shapes, can have grading to the outer edge of the cylinder
Transfinite Line {5, 6, 7, 8, 13, 14, 15, 16} = rhoH Using Progression 0.99;

// Example of grading in opposite directions: top and bottom planes
// of the cylinder
Transfinite Line {31, 32, 29, 30, 27, 28, 25, 26} = rhoV Using Bump 0.25;

Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";

Physical Surface("top") = {38, 36, 42, 40, 34};
Physical Surface("bottom") = {74, 76, 70, 72};
Physical Surface("sides") = {66, 64, 62, 60};
Physical Volume("cylinder") = {82, 86, 84, 78, 80};
