module lcd() {
   
   difference() {
    	color("gray") cube([98, 63,3.5]);
      translate([4,7,3]) color("black") cube([91, 53, 1]);
   }
      translate([5,8,3]) color("white") cube([89, 51, 0.5]);
    
   // translate([4,7,3]) color("black") cube([91, 53, 0.6]);
}

module pcb() {
  // textolit
  color([7/255, 40/255, 75/255]) cube([99, 63,1]);
   
  color([41/255, 41/255, 41/255]) {
    // js4725b
    translate([60, 18, 1]) cube([19, 19, 1]);
    // flash
    translate([84, 18, 1]) cube([12, 19, 1]);
    // ram
    translate([60, 2, 1])  cube([22, 11, 1]);
  }
  
  // pins
  color([200/255, 200/255, 200/255]) {
    translate([60, 17, 1]) cube([19, 21, 0.3]);
    translate([59, 18, 1]) cube([21, 19, 0.3]);
    translate([84, 17, 1]) cube([12, 21, 0.3]);  
    translate([60, 1, 1])  cube([22, 13, 0.3]) ;
  }

  // lcd wire
  color("DarkGoldenrod")  {
      translate([15, 22, 1]) cube([22, 40, 1]);
      translate([11, 45, 1]) cube([73, 20, 1]);
  }

  // wires
  color("red") {
    translate([-5,4,0]) cube([5, 16, 1]);
    translate([7,-5,0]) cube([18, 5, 1]);
    translate([99,63-4-10,0]) cube([5, 10, 1]);
  }
}

module lcd_pcb() {
  lcd();
  translate([0, 63, 0]) rotate([180, 0, 0])  pcb();
}

// lcd_pcb();

