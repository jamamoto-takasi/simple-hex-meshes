Point(1) = {0.0, 0.0, 0.0, 1.0};
Point(2) = {0.0125, 0.0000, 0.0, 1.0};
Point(3) = {0.0088, 0.0088, 0.0, 1.0};
Point(4) = {0.0000, 0.0125, 0.0, 1.0};
Point(5) = {-0.0088, 0.0088, 0.0, 1.0};
Point(6) = {-0.0125, 0.0000, 0.0, 1.0};
Point(7) = {-0.0088, -0.0088, 0.0, 1.0};
Point(8) = {-0.0000, -0.0125, 0.0, 1.0};
Point(9) = {0.0088, -0.0088, 0.0, 1.0};
Point(10) = {0.0250, 0.0000, 0.0, 1.0};
Point(11) = {0.0177, 0.0177, 0.0, 1.0};
Point(12) = {0.0000, 0.0250, 0.0, 1.0};
Point(13) = {-0.0177, 0.0177, 0.0, 1.0};
Point(14) = {-0.0250, 0.0000, 0.0, 1.0};
Point(15) = {-0.0177, -0.0177, 0.0, 1.0};
Point(16) = {-0.0000, -0.0250, 0.0, 1.0};
Point(17) = {0.0177, -0.0177, 0.0, 1.0};
Point(18) = {0.0500, 0.0000, 0.0, 1.0};
Point(19) = {0.0354, 0.0354, 0.0, 1.0};
Point(20) = {0.0000, 0.0500, 0.0, 1.0};
Point(21) = {-0.0354, 0.0354, 0.0, 1.0};
Point(22) = {-0.0500, 0.0000, 0.0, 1.0};
Point(23) = {-0.0354, -0.0354, 0.0, 1.0};
Point(24) = {-0.0000, -0.0500, 0.0, 1.0};
Point(25) = {0.0354, -0.0354, 0.0, 1.0};

Line(1) = {1, 6};
Line(2) = {1, 4};
Line(3) = {1, 2};
Line(4) = {1, 8};
Line(5) = {8, 9};
Line(6) = {9, 2};
Line(7) = {2, 3};
Line(8) = {3, 4};
Line(9) = {4, 5};
Line(10) = {5, 6};
Line(11) = {6, 7};
Line(12) = {7, 8};
Line(13) = {2, 10};
Line(14) = {3, 11};
Line(15) = {4, 12};
Line(16) = {5, 13};
Line(17) = {6, 14};
Line(18) = {7, 15};
Line(19) = {8, 16};
Line(20) = {9, 17};
Line(21) = {10, 18};
Line(22) = {11, 19};
Line(23) = {12, 20};
Line(24) = {13, 21};
Line(25) = {14, 22};
Line(26) = {15, 23};
Line(27) = {16, 24};
Line(28) = {17, 25};
Circle(29) = {14, 1, 13};
Circle(30) = {13, 1, 12};
Circle(31) = {12, 1, 11};
Circle(32) = {11, 1, 10};
Circle(33) = {10, 1, 17};
Circle(34) = {17, 1, 16};
Circle(35) = {16, 1, 15};
Circle(36) = {15, 1, 14};
Circle(37) = {20, 1, 21};
Circle(38) = {21, 1, 22};
Circle(39) = {22, 1, 23};
Circle(40) = {23, 1, 24};
Circle(41) = {24, 1, 25};
Circle(42) = {25, 1, 18};
Circle(43) = {18, 1, 19};
Circle(44) = {19, 1, 20};

Line Loop(45) = {36, 25, 39, -26};
Ruled Surface(46) = {45};
Line Loop(47) = {29, 24, 38, -25};
Ruled Surface(48) = {47};
Line Loop(49) = {24, -37, -23, -30};
Ruled Surface(50) = {49};
Line Loop(51) = {44, -23, 31, 22};
Ruled Surface(52) = {51};
Line Loop(53) = {43, -22, 32, 21};
Ruled Surface(54) = {53};
Line Loop(55) = {21, -42, -28, -33};
Ruled Surface(56) = {55};
Line Loop(57) = {28, -41, -27, -34};
Ruled Surface(58) = {57};
Line Loop(59) = {27, -40, -26, -35};
Ruled Surface(60) = {59};
Line Loop(61) = {18, 36, -17, 11};
Ruled Surface(62) = {61};
Line Loop(63) = {17, 29, -16, 10};
Ruled Surface(64) = {63};
Line Loop(65) = {16, 30, -15, 9};
Ruled Surface(66) = {65};
Line Loop(67) = {8, 15, 31, -14};
Ruled Surface(68) = {67};
Line Loop(69) = {7, 14, 32, -13};
Ruled Surface(70) = {69};
Line Loop(71) = {6, 13, 33, -20};
Ruled Surface(72) = {71};
Line Loop(73) = {34, -19, 5, 20};
Ruled Surface(74) = {73};
Line Loop(75) = {35, -18, 12, 19};
Ruled Surface(76) = {75};
Line Loop(77) = {12, -4, 1, 11};
Ruled Surface(78) = {77};
Line Loop(79) = {1, -10, -9, -2};
Ruled Surface(80) = {79};
Line Loop(81) = {2, -8, -7, -3};
Ruled Surface(82) = {81};
Line Loop(83) = {4, 5, 6, -3};
Ruled Surface(84) = {83};
Extrude {0, 0, 0.02} {
  Surface{46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84};
}
Physical Volume(525) = {1, 8, 7, 6, 5, 4, 3, 2, 10, 9, 16, 15, 14, 13, 12, 11, 18, 17, 20, 19};
Physical Surface("sides") = {229, 207, 181, 159, 141, 123, 101, 251};
Physical Surface("top") = {172, 194, 216, 238, 260, 106, 128, 150, 348, 370, 392, 414, 436, 282, 304, 326, 524, 502, 480, 458};
Physical Surface("bottom") = {50, 48, 46, 60, 58, 56, 54, 52, 68, 66, 64, 62, 76, 74, 72, 70, 84, 78, 82, 80};

DensityV = 30;
DensityH1 = 10;
DensityH2 = 12;
DensityH3 = 35;

Transfinite Line {448, 404, 232, 228} = DensityV; // Using Bump 0.3;
Transfinite Line {377, 210, 206, 355, 188, 179} = DensityV; // Using Bump 0.3;
Transfinite Line {333, 166, 157, 320, 144, 140} = DensityV; // Using Bump 0.3;
Transfinite Line {298, 114, 118, 276, 92, 96} = DensityV; // Using Bump 0.3;
Transfinite Line {267, 91, 100} = DensityV; // Using Bump 0.3;

Transfinite Line {440, 265, 86, 88, 418, 243, 241} = DensityH1;
Transfinite Line {439, 396, 221, 219, 372, 199, 197} = DensityH1;
Transfinite Line {485, 350, 176, 174, 328, 154, 152} = DensityH1;
Transfinite Line {463, 309, 133, 131, 287, 108, 110} = DensityH1;
Transfinite Line {1, 11, 36, 39, 12, 35, 40} = DensityH1;
Transfinite Line {4, 5, 34, 41, 6, 33, 42} = DensityH1;
Transfinite Line {3, 7, 32, 43, 8, 31, 44} = DensityH1;
Transfinite Line {2, 9, 30, 37, 10, 29, 38} = DensityH1;

Transfinite Line {20, 13, 14, 15, 16, 17, 18, 19} = DensityH2;
Transfinite Line {353, 375, 395, 262, 264, 286, 308, 331} = DensityH2;

Transfinite Line {177, -198, -220, -89, 87, 109, -132, 155} = DensityH3 Using Progression 0.95;
Transfinite Line {27, 28, 21, 22, 23, 24, 25, 26} = DensityH3 Using Progression 0.95;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";

Mesh 3;
// Save "smooth-cylinder.msh";
