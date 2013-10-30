include <lcd_pcb.scad>

  inner_width=91;
  inner_height=53;

  outer_width=98+2;
  outer_height=63+1;

  x_offset = 4;
  y_offset = 7.5;

  left_pad = 10;
  right_pad = 10;
  top_pad = 10;
  bottom_pad = 5;

  thick=1.5;
  depth=15;

  skirt_pad=10;

  wall_width=outer_width+left_pad+right_pad;
  wall_height=outer_height+top_pad+bottom_pad;

  w_w = wall_width / 2;
  w_x = wall_width / 4;

module draw_support(x, y, w, h) {
   support = 5;
   hole=1.5;
   hole_depth=10;
   
   // support with hole
   difference() {
     translate([x + w*support, y+ h*support, 0]) cube([support,support, depth]);
     translate([x + w * support + support/2 - hole/2
               , y + h * support + support/2 - hole/2, depth-hole_depth]) 
      cube([hole,hole, hole_depth+20]);
   }

}

module xz0032_screws(screw_radius) {
   // screws
   x_offset = 10;
   y_offset = 5;
   for(x=[w_x+x_offset, w_x+w_w-x_offset]) for(y=[0-y_offset, wall_height + y_offset]) {
     translate([x, y, -10]) cylinder(r=screw_radius, h=50);
   }

}

module base() {

  // base
  difference() {
    translate([w_x, 0, 0]) cube([w_w, wall_height, 2.5]);

    translate([left_pad-.5, bottom_pad,0.5]) cube([outer_width, outer_height, 5]);

    translate([left_pad+x_offset, bottom_pad+y_offset,-1]) cube([inner_width, inner_height, 3]);

  }

   // bottom wall with hole
   difference() {
     translate([w_x,wall_height-thick,0]) cube([w_w, thick, depth]);
     translate([w_x+w_w/2-5, wall_height-2, depth-5.5]) cube([9, 10, 10]);
   }

   // top wall
   translate([w_x, 0, 0]) cube([w_w, thick, depth]);


   // skirt
   translate([w_x, -skirt_pad]) cube([w_w, skirt_pad,1]);
   translate([w_x, wall_height]) cube([w_w, skirt_pad,1]);

   // support
   draw_support(w_x, -5, 0,0);
   draw_support(w_x+w_w, -5, -1,0);
   draw_support(w_x, wall_height, 0, -1);
   draw_support(w_x+w_w, wall_height, -1, -1);
   
   xz0032_screws(1.5);
}

module xz0032_base2(type, screw_radius) {
  if(type=="model") {
   lcd_pcb();
   translate([outer_width+9, -5.5, 5]) rotate([0, 180, 0]) base();
     // xz0032_screws(screw_radius);
  }

  if(type=="holes") {
    translate([outer_width+9, -5.5, 5]) rotate([0, 180, 0]) xz0032_screws(screw_radius);
  }

  if(type=="footprint") {
  }

}

//xz0032_base2("model", 1.5);
//xz0032_base2("holes", 2);

