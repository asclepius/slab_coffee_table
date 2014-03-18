$fn=100;

include <./legs.scad>
// Define slab for top of table
slab_width=2.5*12;
slab_length=4*12;
slab_depth=3;
module slab(){
  cube([slab_width,slab_length,slab_depth],center=true);
};

// Legs
leg_thickness=0.25;
leg_width=3;
leg_length=0.617*(slab_width-4);
leg_height=2*12;


color("sienna") slab();
color("black") translate([0,slab_length/2*0.617,-slab_depth/2]) legs(width=leg_length, h=leg_width, w=leg_thickness);
color("black") translate([0,-slab_length/2*0.617,-slab_depth/2]) legs(width=leg_length, h=leg_width, w=leg_thickness);


