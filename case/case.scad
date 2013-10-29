include <lcd_pcb.scad>
include <base.scad>



module case_support() {
    support=12;
    level = -7;


  color("gray") {
     translate([4, -4, level]) cylinder(r=1.5, h=support);
     translate([118, -4, level]) cylinder(r=1.5, h=support);
     translate([118, 85, level]) cylinder(r=1.5, h=support);
     translate([4, 85, level]) cylinder(r=1.5, h=support);
  }
}

module all() {
  translate([left_pad+outer_width-1,bottom_pad, 5]) rotate([0, 180, 0]) lcd_pcb();
  base();
  % translate([0, 0,  15]) lid();
  case_support();
}

module draw_lid_hole(x, y, w, h) {
   support = 5;
   hole=0.75;
   hole_depth=10;

      translate([x + w * support + support/2 - hole/2
               , y + h * support + support/2 - hole/2, -1])
      cube([hole,hole, 5]);

}

module lid() {
  difference() {
  cube([wall_width, wall_height, 2]);
   // support
   draw_lid_hole(0, 0, 0,0);
   draw_lid_hole(wall_width, 0, -1,0);
   draw_lid_hole(0, wall_height, 0, -1);
   draw_lid_hole(wall_width, wall_height, -1, -1);
  }

  %  translate([20.5, wall_height-22-5, -4]) cube([3,20, 6]);
  %  translate([30, wall_height-20.5, -4]) cube([20,3, 6]);
}

// projection(cut = true) translate([30, 30]) all();

// translate([30, 30]) all();
	// rotate([180, 0,0]) lid();