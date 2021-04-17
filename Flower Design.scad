// MECE E4606 - Digital Manufacturing
// @Author: Nihar Garg (nng2108) - nihar.garg@columbia.edu
// @Description: Assignment 2 - LAMPSHADE LATTICE

$fn=20;

print_thickness = 2; //mm
diff_between_two = 35;
nozzle_tolerance = 1.5; //mm

candle_radius = 36+nozzle_tolerance; //mm
candle_height = 20;

flower_length = 40;

module flower(num,x_angle,length,z_angle) {
	for(i=[0:360/num:359]) {
		rotate(i,[0,0,1]) {
			translate([(candle_radius/2),0,0]) {
				rotate(z_angle,[0,1,0]) {
					cylinder(h=length, r=print_thickness, center = false);
					translate([0,0,length]) {
						rotate([x_angle,0,0]) {
							cylinder(h=(length*3/4), r=print_thickness, center = false);
						}
						rotate([-x_angle,0,0]) {
							cylinder(h=(length*3/4), r=print_thickness, center = false);
						}
					}
				}
			}
		}
	}
}

module base() { //to be used with clear()
	cylinder(h=candle_height/2, r=((candle_radius/2)+print_thickness), center=false);
}

module clear() { //to be used with base() after flower has been added
	translate([0,0,print_thickness]) {
		cylinder(h=candle_height+1, r=candle_radius/2,  center=false);
	}
}

difference() {
	difference() {
		union() {
			base();
			flower(9,60,flower_length*1.2,85);
			rotate([0,0,20]) {
				translate([0,0,candle_height/6]) {
					flower(9,63,flower_length,75);
					rotate([0,0,-20]) {
						translate([0,0,candle_height/6]) {
							flower(9,61,flower_length/1.2,60);
						}
					}
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