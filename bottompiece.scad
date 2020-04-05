$fn = 100;

floor_thickness = 2;
wall_thickness = 1.5;
grip_height = 10; // distance to holes from edge of paper. best to be a couple mm short so it does rattle

radius = 78; 
distance_between_holes = 80;

circumference = 2 * PI * radius;
degree_arc_length = circumference / 360;

angle_between_holes = distance_between_holes / degree_arc_length;
angle_from_edge = (90-angle_between_holes)/2;
echo(angle_between_holes);
echo(angle_from_edge);


//outer wall
intersection() {
    cube([100,100,18]);
    difference() {
        cylinder(20, radius+0.5+wall_thickness, radius+0.5+wall_thickness);
        cylinder(20, radius+0.5, radius+0.5);
    }

}


difference(){
    //inner wall
    group(){
        intersection() {
            cube([100,100,17]);
            difference() {
                cylinder(20,radius-0.5,radius-0.5);
                cylinder(20,radius-0.5-wall_thickness,radius-0.5-wall_thickness);
            }
        }
    }
     //holes
    translate([0,0,floor_thickness+grip_height]) {
        rotate(a=[-angle_from_edge,90,0]) {
            cylinder(radius+2,3,3);
        }
    }
    translate([0,0,floor_thickness+grip_height]) {
        rotate(a=[-(angle_between_holes+angle_from_edge),90,0]) {
            cylinder(radius+2,3,3);
        }
    }
}

//bottom
intersection() {
    cube([100,100,15]);
    difference() {
        cylinder(floor_thickness, radius+0.5+wall_thickness, radius+0.5+wall_thickness);
        cylinder(floor_thickness,75,75);

    }
}

//bumps
translate([0,0,floor_thickness+grip_height]) {
    rotate(a=[-angle_from_edge,90,0]) {
        translate([0,0,radius+1]) {
            sphere(2.2);
        }
    }
}
translate([0,0,floor_thickness+grip_height]) {
    rotate(a=[-(angle_between_holes+angle_from_edge),90,0]) {
        translate([0,0,radius+1]) {
            sphere(2.2);
        }
    }
}
