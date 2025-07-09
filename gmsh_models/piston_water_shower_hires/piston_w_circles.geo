// Gmsh project created on Wed Feb  5 18:49:15 2025
SetFactory("OpenCASCADE");
//+
Cylinder(1) = {0, 0, 0, 0, 0, 90, 38, 2*Pi}; // head e piston
//+
Cylinder(2) = {-0, 0, -5, 0, 0, 5, 37, 2*Pi}; // tekke foroorafteye piston
//+
BooleanUnion{ Volume{1}; Delete; }{ Volume{2}; Delete; } // union head + teke foroo rafte piston
//+
//Cylinder(2) = {0, 0, -7.5, 0, 0, 97.5, 21, 2*Pi}; // kole masiro diff karde, bayad beshe fqt air
Cylinder(2) = {0, 0, 52.5, 0, 0, 37.5, 21, 2*Pi}; // piston for air diff
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; Delete; }
//+
Cylinder(2) = {0, 0, -15, 0, 0, 10, 37, 2*Pi}; // outer layer payeye piston
//+
Cylinder(3) = {0, 0, -15, 0, 0, 10, 29, 2*Pi}; // inner layer payeye piston
//+
BooleanDifference{ Volume{2}; Delete; }{ Volume{3}; Delete; } // outer-inner layer = ring e payeye piston
//+
BooleanUnion{ Volume{1}; Delete; }{ Volume{2}; Delete; } // union kole piston
//+
Cylinder(2) = {0, -0, -10.00, 0, 0, 5, 21, 2*Pi}; // shower
//+
//BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; } // ????
//+
Physical Volume("piston", 29) = {1};
//+
Physical Volume("shower", 30) = {2};
//+
Cylinder(3) = {0, 0, -5, 0, 0, 57.5, 21, 2*Pi};
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{3}; }
//+
Cylinder(4) = {0, 0, -7.5, 0, 0, 2.5, 19.5, 2*Pi};
//+
BooleanDifference{ Volume{2}; Delete; }{ Volume{4}; }
//+
BooleanUnion{ Volume{3}; Delete; }{ Volume{4}; Delete; }
//+
Physical Volume("water", 43) = {3};
//+
Physical Surface("waterInlet", 44) = {40};
//+
Physical Surface("waterOutlet", 45) = {27};
//+
Physical Surface("waterWallPiston", 46) = {33};
//+
Physical Surface("waterWallShower", 47) = {25};
//+
Physical Surface("showerInlet", 48) = {27};
//+
Physical Surface("showerOutlet", 49) = {39};
//+
Physical Surface("showerOuterWall", 50) = {37};
//+
Physical Surface("showerInnerWall", 51) = {25};
//+
Coherence;
