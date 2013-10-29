
  inner_width=91;
  inner_height=53;

  outer_width=98+2;
  outer_height=63+1;

  x_offset = 4;
  y_offset = 7;

  left_pad = 10;
  right_pad = 10;
  top_pad = 10;
  bottom_pad = 5;

  thick=1.5;
  depth=15;

  skirt_pad=10;

  wall_width=outer_width+left_pad+right_pad;
  wall_height=outer_height+top_pad+bottom_pad;


module draw_support(x, y, w, h) {
   support = 5;
   hole=1.5;
   hole_depth=10;
   
   difference() {
   color ("tan") translate([x + w*support, y+ h*support, 0]) cube([support,support, depth]);
      translate([x + w * support + support/2 - hole/2
               , y + h * support + support/2 - hole/2, depth-hole_depth]) 
      cube([hole,hole, hole_depth+20]);
   }

}

module base() {

  // base
  difference() {
  color("Tan") 

    cube([wall_width, wall_height, 2.5]);

  color("tan") 
    translate([left_pad, bottom_pad,0.5]) cube([outer_width, outer_height, 5]);

  color("tan") 
    translate([left_pad+x_offset, bottom_pad+y_offset,-1]) cube([inner_width, inner_height, 3]);

  }

   // walls
   difference() {
      color("tan") cube([thick, wall_height, depth]);
      translate([-1, wall_height-22, depth-5.5]) cube([thick+2, 9,10]);
   }

   difference() {
     color("tan")  translate([0,wall_height-thick,0]) cube([wall_width, thick, depth]);
      translate([35, wall_height-2, depth-5.5]) cube([9, 10, 10]);
   }

   color ("tan") cube([wall_width, thick, depth]);


   translate([wall_width-thick,0,0]) cube([thick, wall_height, depth]);


   // skirt
   translate([-skirt_pad, -skirt_pad]) cube([skirt_pad, wall_height+skirt_pad*2,1]);
   translate([wall_width, -skirt_pad]) cube([skirt_pad, wall_height+skirt_pad*2,1]);
   translate([0, -skirt_pad]) cube([wall_width, skirt_pad,1]);
   translate([0, wall_height]) cube([wall_width, skirt_pad,1]);

   // support
   draw_support(0, 0, 0,0);
   draw_support(wall_width, 0, -1,0);
   draw_support(0, wall_height, 0, -1);
   draw_support(wall_width, wall_height, -1, -1);
}

// base();
