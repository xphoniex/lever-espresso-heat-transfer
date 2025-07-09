// Gmsh project created on Thu Feb  6 00:02:12 2025
SetFactory("OpenCASCADE");
//+
Cylinder(1) = {0, 0, 0, 0, 0, 1.00, .38, 2*Pi};
//+
Cylinder(2) = {0, 0, .50, 0, 0, .50, .21, 2*Pi};
//+
Cylinder(3) = {0, 0, 0.025, 0, 0, 0.475, .21, 2*Pi};
//+
Physical Volume("air", 10) = {2};
//+
Physical Volume("piston", 11) = {1};
//+
Physical Volume("water", 12) = {3};
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; Delete; }
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{3}; }
//+
Coherence;
//+
Physical Surface("inlet", 17) = {15};
//+
Physical Surface("outlet", 18) = {9};
//+
Physical Surface("waterWall", 19) = {14};
