// https://www.thingiverse.com/thing:4930995

// -------------------------- //
// roll:

din = 14.5; 			// bearing cutout diameter
height = 80;
t = 0.44*3; 			// wall thickness
dout = din + 2*t;
hcut1 = 15; 			// bearing cutout depth
hcut2 = 5;				// bearing cutout cone depth
slope = 3;				// slope / wider part

v = 2; 						// 1 interconnect, 2 roll, else both

module rollhalf() {
	rotate([180,0,0])
	translate([0,0,-height/2])
	difference() {
		union() {
			cylinder(d = dout, h=height/2, center=false, $fn=128);
			// slope:
			cylinder(d1=dout+slope,d2=dout, h=slope, center=false, $fn=128);
		}
		//bearing cutout:
		cylinder(d=din,h=hcut1, center=false, $fn=128);
		//bearing cutout cone:
		translate([0,0,hcut1])
			cylinder(d1=din, d2=2, h=hcut2, center=false, $fn=128);
	}
}

module roll() {
	rollhalf();
	mirror([0,0,1])
		rollhalf();
}

// -------------------------- //
// interconnect:

dist = 64; //63.2	// peg center distance
pegdiam = 9;
pegheight = 5;
st = 3; 					// plate height
rnd = 0.96;				// peg chamfering

module interconnect() {
	union() {
		// without chamfering:
		/*translate([0,-dist/2,0])
			cylinder(d=pegdiam,h=pegheight+st, center=false, $fn=128);
		translate([0,dist/2,0])
			cylinder(d=pegdiam,h=pegheight+st, center=false, $fn=128); */
		// with chamfering:
		translate([0,-dist/2,st])
			cylinder(d=pegdiam,h=pegheight-rnd, center=false, $fn=128);
		translate([0,-dist/2,st+pegheight-rnd])
			cylinder(d1=pegdiam,d2=pegdiam-1,h=rnd, center=false, $fn=128);
		
		translate([0,dist/2,st])
			cylinder(d=pegdiam,h=pegheight-rnd, center=false, $fn=128);
		translate([0,dist/2,st+pegheight-rnd])
			cylinder(d1=pegdiam,d2=pegdiam-1,h=rnd, center=false, $fn=128);
		
		// connecting plate
		hull() {
			translate([0,-dist/2,0])
				cylinder(d=pegdiam,h=st, center=false, $fn=128);
			translate([0,dist/2,0])
				cylinder(d=pegdiam,h=st, center=false, $fn=128);
		}
	}
}

if (v==1) {
	interconnect();
}
else if (v==2) {
	translate([0,0,height/2]) 
		roll();
}
else {
	interconnect();
	translate([dout*2,0,height/2]) 
		roll();
}
/*
//show a cutout view: 
difference() { 
	roll();
	translate([0,-100,-100])
		cube(200);
}
*/