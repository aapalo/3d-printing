// https://github.com/aapalo/3d-printing/adxl345-mount/

// Which version to show:
// 1: show the body, PCB and standoffs as assembled
// 2: show the body - ready for slicer
// 3: show the body and standoffs - ready for slicer
ver = 1;

// ------------------------------ //
hole = 3.2/2; // hole radius, M3(?)
//bottom plate: the red part
bottom_loc_x = -4;
bottom_x = 11;
bottom_y = 20+0;
bottom_z = 5;
adxl_screwdist = (12.3+18.2)/4; // from x-axis to hole center
screw_x = 2.5;
//clamp:
clamp_x = 6;
clamp_y = 30;
clamp_z = 5;
clamp_screwdist = 14.9; // from x-axis to hole center
//PCB: see-through green
pcb_x = 16;
pcb_y = 20;
pcb_z = 1.6;
//bolt head:
bhead_diam = 5.4+0.6;
bhead_z = 3+0.4;

// ------------------------------ //
module bolthead(x,y) {
    color("darkgrey")
    translate([x,y,-20+bhead_z])
        cylinder(d=bhead_diam, h=40, center=true, $fn=30);
}

module screw (x,y,rad) {
    color("black")
        translate([x,y,0])
            cylinder(r=rad, h=100, center=true, $fn=30);

};

module pcb() {
    color("lime", 0.7)
    translate([bottom_loc_x,0,bottom_z+0.001])
        difference() {
            translate([pcb_x/2,0,pcb_z/2])
                cube([pcb_x,pcb_y,pcb_z],center=true);
            union(){
                //adxl screw holes
                screw (screw_x,adxl_screwdist,hole);
                screw (screw_x,-adxl_screwdist,hole);
            }
        }

}

module frame () {
    union() {
        //clamp
        color("red")
        translate ([0,0,bottom_z]) {
            translate([0,clamp_screwdist,-clamp_z/2])
                cylinder(h=clamp_z,r=3.0,center=true,$fn=24);
            translate([0,-clamp_screwdist,-clamp_z/2])
                cylinder(h=clamp_z,r=3.0,center=true,$fn=24);
        }
        {
            //left side
            translate([bottom_loc_x,-bottom_y/2,bottom_z/2])
                cylinder(h=bottom_z,r=2,center=true,$fn=24);
            translate([bottom_loc_x,bottom_y/2,bottom_z/2])
                cylinder(h=bottom_z,r=2,center=true,$fn=24);
            //right side
            translate([bottom_loc_x+bottom_x,-bottom_y/2,bottom_z/2])
                cylinder(h=bottom_z,r=1,center=true,$fn=24);
            translate([bottom_loc_x+bottom_x,bottom_y/2,bottom_z/2])
                cylinder(h=bottom_z,r=1,center=true,$fn=24);
        }
    }

}

module holes () {
    union () {
        //adxl screw holes
        screw (bottom_loc_x+screw_x,adxl_screwdist,hole);
        screw (bottom_loc_x+screw_x,-adxl_screwdist,hole);
        //clamp screw holes
        screw (0,clamp_screwdist,hole);
        screw (0,-clamp_screwdist,hole);
        //bolt heads
        bolthead (bottom_loc_x+screw_x,adxl_screwdist);
        bolthead (bottom_loc_x+screw_x,-adxl_screwdist);
        }
}

module standoff (x,y,z,margin) {
    so_height = 3;
    translate([x,y,z+so_height/2])
        difference() {
            cylinder(h=so_height,r=0.1+hole+margin,center=true,$fn=64);
            cylinder(h=so_height+0.1,r=0.1+hole,center=true,$fn=64);
        }
}

module v1 () {
    standoff_x = bottom_loc_x+screw_x;
    standoff_z = bottom_z+pcb_z;
    color("tan",0.7)
    difference(){
        union () {
            standoff (standoff_x,adxl_screwdist,standoff_z,0.8);
            standoff (standoff_x,-adxl_screwdist,standoff_z, 0.8);
            hull() frame();
        }
        holes();
    }
}

module v2 () {
    color("tan")
    translate([0,0,bottom_z])
    rotate([0,180,90])
        difference(){
            hull() frame();
            holes();
        }
}

module main () {
    if (ver == 1) {
        // assembly
        v1 ();
        pcb ();
    }
    else {
        // export to slicer, v2 without stand-offs
        v2 ();
        if (ver == 3) {
            standoff_x = 6;
            standoff_z = 0;//bottom_z+pcb_z;
            color("tan") {
                standoff (standoff_x,-14,standoff_z,0.8);
                standoff (-standoff_x,-14,standoff_z, 0.8);
            }
        }
    }
}


main();
