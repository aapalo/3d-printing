echo(version=version());

bolt_diam = 5.5;
washer_diam = 12;
ptfe_diam = 4.1; //outer diam
poly = 32; // $fn value, higher is smoother
blue_x = 22; //top part width
hole_y = 20; //right part, rectangle hole
hole_x = 3;
hole_z = 15;
thi = 5; // left thickness, 4
thi2 = 4; // right thickness, 2
left_arm_dist = -80;
right_arm_dist = 80;

hexcut = 0;

case = 3; // 1 left, 2 right, 3 both, 4 print, 5 hex pattern only
ptfe = 0;

module rod(x,y,diam,height,p=poly) {
	translate([x,y,-height/2])
		cylinder(h=height, d=diam, center=true, $fn=p);
}

module rod2(x,y,diam,diam2,height,p=poly) {
	translate([x,y,-height/2])
		cylinder(h=height, d1=diam, d2=diam2, center=true, $fn=p);
}

module left() {
	difference() { //diff
		//frame
		union() {
			translate([0,0,thi])
			hull(){
				rod(blue_x/2,50,6,thi, 32);
				rod(-blue_x/2,50,6,thi, 32);
				rod(blue_x/2,-1,2,thi, 32);
				rod(-blue_x/2,-1,2,thi, 32);
				
				rod(0,left_arm_dist,ptfe_diam+5,thi,32); //ptfe
			}
			translate([0,0,thi]) hull() {
				rod(blue_x/2,-1,2,20, 32);
				rod(-blue_x/2,-1,2,20, 32);
			}
			translate([0,0,thi])
				rod(0,left_arm_dist,ptfe_diam+5,thi*2,32); //ptfe
		}
		// holes:
		color("olive") union() {
			translate([0,0,5])
			hull() {
				rod(0,30,bolt_diam,10, 12);
				rod(0,40,bolt_diam,10, 12);
			}
			translate([0,0,12])
			hull() {
				rod(0,30,washer_diam,10, 12);
				rod(0,40,washer_diam,10, 12);
			}
			translate([0,0,thi])
				rod2(0,left_arm_dist,ptfe_diam,ptfe_diam+1,thi*2,12); //ptfe
			if(hexcut == 1) {
				hex(0,left_arm_dist*0.5,0,4,3,30);
				hex(0,12,0,8,6,30);
				//hex(0,-30,0,4,3,0);
				translate([0,0,-7]) rotate([90,0,0]) hex(0,0,0,5,4,30);
			}
		}
	}
	
}


module hex(x,y,z,hex_d=6,hex_s=5,r=0) {
	hex_x = hex_d * 0.8;
	hex_y = hex_d * 0.9;
	translate([x,y,z+15]) rotate([0,0,r]){
		rod(0,0,hex_s,30,6);
		rod(0,hex_y,hex_s,30,6);
		rod(0,-hex_y,hex_s,30,6);
		rod(hex_x,hex_y/2,hex_s,30,6);
		rod(hex_x,-hex_y/2,hex_s,30,6);
		rod(-hex_x,hex_y/2,hex_s,30,6);
		rod(-hex_x,-hex_y/2,hex_s,30,6);
	}
}


module right() {
	difference() {
		union() {
			//color("red") cube([hole_x, hole_y, hole_z], center=true);
			hull() {
				rod(0,-hole_y/2+hole_x/2,hole_x,hole_z,32);
				rod(0,hole_y/2-hole_x/2,hole_x,hole_z,32);
			}
			translate([0,0,2])
			hull() {
				//cube([blue_x, hole_y, 4], center=true);
				rod(-2,hole_y/2,5,thi2,p=32);
				rod(-2,-hole_y/2,5,thi2,p=32);
				rod(10,hole_y/2,5,thi2,p=32);
				rod(10,-hole_y/2,5,thi2,p=32);
				
				rod(right_arm_dist,0,ptfe_diam+3,thi2,p=64);
			}
			rod(right_arm_dist,0,ptfe_diam+3,thi2+1,p=64);
			}
		translate([0,0,thi2/2])
			color("red")
				rod2(right_arm_dist,0,ptfe_diam,ptfe_diam+1,thi2*2+1,p=12);
		if(hexcut == 1) {
			hex(15,0,0,7,5,0);
		}
		//translate([0,0,-7.5]) rotate([90,0,90]) hex(0,0,0,6,3,30);
	}
}

module topplastic(z) {
	color("blue",0.2)
	translate([-30/2,0,-z])
	cube([30,50,z], center=false);
}


if (case == 1) {
	left();
	//topplastic(60);
	if (ptfe) {
		color("red")
			translate([0,0,30])
			rod(0,-40,ptfe_diam,50,12); //ptfe
	}
}
else if (case == 2) {
	right();
	//translate([10,-25,0]) topplastic(60);
	if (ptfe) {
		translate([0,0,10])
		color("red")
			rod(40,0,ptfe_diam,30,p=12);
	}
}
else if (case == 3) {
	translate([0,-100,0]) {
		left();
		topplastic(60);
		if (ptfe) {
			color("red")
				translate([0,0,30])
				rod(0,-40,ptfe_diam,50,12); //ptfe
		}
	}
	translate([-10,100,0]) {
		right();
		translate([10,-25,0]) topplastic(60);
		if (ptfe) {
			translate([0,0,10])
			color("red")
				rod(40,0,ptfe_diam,30,p=12);
		}
	}
}
else if (case == 4) {
	translate([0,0,thi])
		rotate([0,180,90])
			translate([0,0,0]) left();
	translate([40,-30,2])
		rotate([0,180,0])
			right();
}
else if (case == 5) {
	hex(0,0,0);
}