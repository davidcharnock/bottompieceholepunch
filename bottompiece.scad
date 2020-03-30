$fn = 100;
//outer wall
intersection() {
    cube([100,100,18]);
    difference() {
        cylinder(20,80,80);
        cylinder(20,78.5,78.5);
    }

}


difference(){
    //inner wall
    group(){
        intersection() {
            cube([100,100,17]);
            difference() {
                cylinder(20,77.5,77.5);
                cylinder(20,76,76);
            }
        }
    }
     //holes
    translate([0,0,12]) {
        rotate(a=[-15,90,0]) {
            cylinder(80,3,3);
        }
    }
    translate([0,0,12]) {
        rotate(a=[-75,90,0]) {
            cylinder(80,3,3);
        }
    }
}

//bottom
intersection() {
    cube([100,100,15]);
    difference() {
        cylinder(2,80,80);
        cylinder(2,76.5,76.5);

    }
}

//bumps
translate([0,0,12]) {
    rotate(a=[-15,90,0]) {
        translate([0,0,79]) {
            sphere(2.2);
        }
    }
}
translate([0,0,12]) {
    rotate(a=[-75,90,0]) {
        translate([0,0,79]) {
            sphere(2.2);
        }
    }
}
