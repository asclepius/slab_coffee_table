// (c) 2011 Christopher "ScribbleJ" Jansen
// 
// bend() module - creates a cube with a U or L shaped bend of the specified
// radius.

// d1 = length of first cube segment
// d2 = length of second cube segment
// r = (inner) radius of bend
// w = width of cube
// a = angle of bend.  0 = U, 180 = ---
// h = height of cube

$fn=100;

module bend(d1=10,d2=10,r=10,w=5,a=0,h=10)
{
  huge = r*w;
  difference()
  {
    cylinder(r=r+w, h=h);

    translate([0,0,-0.5]) 
    {
      cylinder(r=r, h=h+1);
      translate([0,0,0]) cube([d1+1, r, h+1]);
      rotate([0,0,-a]) translate([0,-r,0]) cube([d2+1, r, h+1]);
      translate([-0.05,-d2-1+0.05,0]) cube([d1+1, d2+1, h+1]);
    }
  }

  translate([0,r,0]) cube([d1, w, h]);
  rotate([0,0,-a]) translate([0,-(r+w),0]) cube([d2, w, h]);
}


module legs(width=2*12, height=1*12, r=2, w=0.5, a=90, h=4){
  d2=height;
  d1=width/2; 
  union(){
    translate([d1+r,0,0]) 
      difference(){
        cube([h,h,w], center = true);
        mirror([1,0,0]) translate([0.62*h/2, 0.62*h/2,0])  cylinder(r=0.125, h=h+0.5, center=true);
      };
    translate([-(d1+r),0,0]) cube([h,h,w], center = true);
    translate([0,-h/2,0]){
      union(){
        rotate([-90,0,0]) translate([-d1,d2,0]) color("silver") bend(d1=d1, d2=d2, r=r, w=w, a=a, h=h);
        mirror([1,0,0]) rotate([-90,0,0]) translate([-d1,d2,0]) color("silver") bend(d1=d1, d2=d2, r=r, w=w, a=a, h=h);
      };};};
}

