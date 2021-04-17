// MECE E4606 - Digital Manufacturing
// @Author: Nihar Garg (nng2108) - nihar.garg@columbia.edu
// @Description: Assignment 2 - LAMPSHADE LATTICE

$fn=100;

print_thickness = 2; //mm
diff_between_two = 35;
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

module supports(num) {
	difference() {
		scale([1.5,1.5,1]) {
			translate([0,0,candle_radius-print_thickness*2]) {
				for(i=[0:360/num:359]) {
					rotate(i,[0,0,1]) {
						rotate([90,0,0]) {
							rotate_extrude(convexity = 10)
								translate([candle_radius*3/4, 0, 0])
									circle(r = print_thickness/1.5);
						}
					}
				}
			}
		}
		translate([0,0,print_thickness]) {
			cylinder(h=80, r1=candle_radius/4, r2=candle_radius,  center=false);
		}
	}
}

difference() {
	difference() {
		union() {
			base();
			translate([0,0,-candle_height/2]) {
				translate([0,0,candle_height/10]) {
					supports(11);
				}
			}
		}
		clear();
	}
	//clean out bottom of print
	rotate([0,180,0]) {
		cylinder(h=100,r=100, center=false);
	}
}
