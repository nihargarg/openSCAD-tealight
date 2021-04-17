// MECE E4606 - Digital Manufacturing
// @Author: Nihar Garg (nng2108) - nihar.garg@columbia.edu
// @Description: Assignment 2 - LAMPSHADE LATTICE

$fn=20;

print_thickness = 2; //mm
nozzle_tolerance = 1.5; //mm

candle_radius = 36+nozzle_tolerance; //mm
candle_height = 20;

module base() { //to be used with clear()
	cylinder(h=candle_height/4, r=((candle_radius/2)+print_thickness), center=false);
}

module clear() { //to be used with base() after flower has been added
	translate([0,0,print_thickness]) {
		cylinder(h=candle_height+1, r=candle_radius/2,  center=false);
	}
}

difference() {
	difference() {
		union() {
			translate([0, 0, print_thickness]){
				rotate_extrude(convexity = 10, $fn = 20)
				translate([((candle_radius/2)+(print_thickness*1.5)), 0, 0])
				circle(r = 2.7, $fn = 20);
				
				for (i = [0 : 20 : 360]) {
					rotate(i, v=[0,0,1])
					rotate(30, v=[1,0,0])
						linear_extrude(height = 110, center = false, convexity = 10, twist = -10)
					translate([((candle_radius/2)+(print_thickness*1.5)), 0, 0])
						circle(r=2);
				}
				for (i = [0 : 20 : 360]){
					rotate(i, v=[0,0,1])
					rotate(-23, v=[1,0,0])
						linear_extrude (height = 110, center = false, convexity = 100, twist = -10)
					translate([((candle_radius/2)+(print_thickness*1.5)), 0, 0])
						circle(r=2);
				}
			}
			base();
		}
		clear();
	}
	//clean out bottom of print
	rotate([0,180,0]) {
		cylinder(h=100,r=100, center=false);
	}
}
