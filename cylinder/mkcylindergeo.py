#!/usr/bin/env python

"""
-------------------------------------------------------------------------------
Script to generate Gmsh's GEO file for generation of hexagonal mesh of a
cylinder with minimal non-orthogonality. Takes diameter and height of the
cylinder as command-line arguments.

Usage: mkcylindergeo.py [D] [h]

  D - diameter of the cylinder in cm (10 cm if omitted)
  h - diameter of the cylinder in cm (5 cm if omitted)
-------------------------------------------------------------------------------

The MIT License (MIT)

Copyright (c) 2015 Alexey Matveichev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

from __future__ import print_function
import sys
from math import sqrt, radians, cos
from scipy.optimize import newton

GEO_TAIL = """\
rhoV = 31; // Vertical mesh density
rhoHi = 26; // Horizontal density of inner parts
rhoHo = 26; // Horizontal density of outer parts

Line(1) = {0, 9};
Line(2) = {9, 1};
Line(3) = {0, 11};
Line(4) = {11, 3};
Line(5) = {0, 13};
Line(6) = {13, 5};
Line(7) = {0, 15};
Line(8) = {15, 7};
Line(9) = {10, 2};
Line(10) = {12, 4};
Line(11) = {14, 6};
Line(12) = {16, 8};
Line(13) = {9, 10};
Line(14) = {10, 11};
Line(15) = {11, 12};
Line(16) = {12, 13};
Line(17) = {13, 14};
Line(18) = {14, 15};
Line(19) = {15, 16};
Line(20) = {16, 9};
Circle(21) = {2, 0, 3};
Circle(22) = {3, 0, 4};
Circle(23) = {4, 0, 5};
Circle(24) = {5, 0, 6};
Circle(25) = {6, 0, 7};
Circle(26) = {7, 0, 8};
Circle(27) = {8, 0, 1};
Circle(28) = {1, 0, 2};
Line Loop(29) = {16, -5, 3, 15};
Plane Surface(30) = {29};
Line Loop(31) = {5, 17, 18, -7};
Plane Surface(32) = {31};
Line Loop(33) = {7, 19, 20, -1};
Plane Surface(34) = {33};
Line Loop(35) = {1, 13, 14, -3};
Plane Surface(36) = {35};
Line Loop(37) = {8, 26, -12, -19};
Ruled Surface(38) = {37};
Line Loop(39) = {11, 25, -8, -18};
Ruled Surface(40) = {39};
Line Loop(41) = {24, -11, -17, 6};
Ruled Surface(42) = {41};
Line Loop(43) = {6, -23, -10, 16};
Ruled Surface(44) = {43};
Line Loop(45) = {10, -22, -4, 15};
Ruled Surface(46) = {45};
Line Loop(47) = {14, 4, -21, -9};
Ruled Surface(48) = {47};
Line Loop(49) = {13, 9, -28, -2};
Ruled Surface(50) = {49};
Line Loop(51) = {27, -2, -20, 12};
Ruled Surface(52) = {51};

Extrude {0, 0, 0.03} {
  Surface{42, 44, 46, 48, 50, 52, 38, 40, 32, 30, 36, 34};
}

Physical Surface("bottom") = {50, 48, 46, 44, 42, 40, 38, 52, 34, 36, 30, 32};
Physical Surface("top") = {206, 228, 74, 96, 118, 140, 162, 184, 294, 316, 250, 272};
Physical Surface("sides") = {61, 87, 109, 135, 157, 171, 197, 219};
Physical Volume("cylinder") = {2, 3, 4, 6, 5, 7, 8, 1, 9, 10, 11, 12};

// Vertical lines
Transfinite Line {235, 64, 60, 68, 59, 90, 86, 112, 108} = rhoV; //  Using Bump 0.25;
Transfinite Line {125, 134, 147, 156, 178, 169, 191, 192} = rhoV; // Using Bump 0.25;

// Outer radial lines
Transfinite Line {10, 78, 4, 100, 9, 123, 2, 145, 12, 167, 8, 186, 11, 55, 6, 57} = rhoHo;

// Other lines
Transfinite Line {27, 164, 20, 166, 1, 274, 26, 187, 19, 189} = rhoHi;
Transfinite Line {25, 209, 18, 211, 7, 233, 17, 56, 24, 54} = rhoHi;
Transfinite Line {23, 77, 16, 79, 5, 230, 15, 101, 22, 99} = rhoHi;
Transfinite Line {21, 122, 14, 120, 3, 254, 13, 142, 28, 144} = rhoHi;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
Recombine Volume "*";

Mesh 3;
"""


def __make_pos_eqn(D):
    # Optimal angle is 120 degrees
    C0 = cos(radians(120))
    R = 0.5*D

    def f(x):
        v1x = -x
        v1y = 0.5*R - x
        v2x = 0.5*R - x
        v2y = -x
        v1norm = sqrt(v1x*v1x + v1y*v1y)
        v2norm = sqrt(v2x*v2x + v2y*v2y)

        return v1x*v2x + v1y*v2y - C0*v1norm*v2norm

    return f


def __find_optimal_position(D):
    f = __make_pos_eqn(D)
    R = 0.5*D

    x0 = newton(f, R/sqrt(2.0))

    return x0


def __write_points(pts):
    """Write points in geo format to stdout."""
    for n, pt in enumerate(pts):
        print("Point({0}) = {{ {1}, {2}, 0.0, 1.0 }};".format(n, *pt))


def __gen_points(D, h):
    """Generate skeleton points of the cylinder."""
    res = []

    # Precalculated values
    # Outer points
    p1 = 0.5*D
    p2 = 0.5*D/sqrt(2.0)
    # Inner points
    p3 = 0.25*D
    p4 = __find_optimal_position(D)

    # Center of the cylinder
    res.append((0, 0))

    # Outer points
    res.append((p1, 0))
    res.append((p2, p2))
    res.append((0, p1))
    res.append((-p2, p2))
    res.append((-p1, 0))
    res.append((-p2, -p2))
    res.append((0, -p1))
    res.append((p2, -p2))

    # Inner points
    res.append((p3, 0))
    res.append((p4, p4))
    res.append((0, p3))
    res.append((-p4, p4))
    res.append((-p3, 0))
    res.append((-p4, -p4))
    res.append((0, -p3))
    res.append((p4, -p4))

    return res


def __gen_skel():
    """Generate skeleton for geo file"""
    D = 10.0
    h = 5.0
    if len(sys.argv) > 2:
        D, h = map(float, sys.argv[1:3])
    if len(sys.argv) == 2:
        D = float(sys.argv[1])

    # Convert to meters
    D /= 100.0
    h /= 100.0

    print("// Cylinder geometry: D = {0} cm, h = {1} cm".format(100*D, 100*h))
    print("// Generated with a script from http://github.com/mrklein/simple-hex-meshes")
    print()

    pts = __gen_points(D, h)
    __write_points(pts)
    print()
    print(GEO_TAIL)


if __name__ == '__main__':
    __gen_skel()
