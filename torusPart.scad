
module torus(bigR, cutR, fn = 50)
{
    rotate_extrude(
      convexity = 10, 
      $fn = fn)
    translate([bigR, 0, 0])
    circle(r = cutR,
      $fn = fn);
}

module torusQuarter(bigR, cutR, add2Cube = 0, fn = 50)
{
    intersection() {
        torus(bigR, cutR, fn);

        translate([-add2Cube, 
          -add2Cube, -cutR])
        cube([
          bigR + cutR + add2Cube, 
          bigR + cutR + add2Cube,
          2*cutR]);
    }
}

cutTrnce = 1;

bigR = 30;
cutR = 5.5;
wallThick = 3;

union() {
    difference() {
        torusQuarter(bigR, cutR +     
          wallThick);
        torusQuarter(bigR, cutR,
          cutTrnce);
    }
    translate([bigR, 0, 0])
    rotate([90, 0, 0])
    torus(cutR+wallThick/2, 
      wallThick/2);
    translate([0, bigR, 0])
    rotate([0, 90, 0])
    torus(cutR+wallThick/2, 
      wallThick/2);
}