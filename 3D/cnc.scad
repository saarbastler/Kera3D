
$fn=100;
include <parts.scad>

module halterungZMotor()
{
  difference()
  {
    translate([-60,-22,0]) cube([38+44,44,3]);
    
    translate([0,0,-1]) cylinder(d=26,h=5);
    
    translate([ 31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
    translate([ 31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
    translate([-31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
    translate([-31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
    
    translate([-50, 10-22,-1]) cylinder(d=6.5,h=5);
    translate([-50,-10+22,-1]) cylinder(d=6.5,h=5);
  }
}

module halterungYMotor()
{
  difference()
  {
    translate([-38,0,0]) cube([75+38,72,4]);
  
    translate([7.5, 8,-1]) wj200umLoecher();
    translate([7.5,40+ 8,-1]) wj200umLoecher();

    translate([68, 8,-1]) wj200umLoecher();      
    translate([68,40+ 8,-1]) wj200umLoecher();
    
    translate([-18, 72/2,-1]) stepperLoecher()
    {
      cylinder(d=3,h=10);
    }
  }
}

module halterungXSchlitten()
{
  difference()
  {
    translate([-114/2,-40/2,0]) cube([114,40,4]);
    
    translate([-37.5,0,-1]) cylinder(d=5,h=17);
    translate([ 37.5,0,-1]) cylinder(d=5,h=17);
    translate([-37.5,0,-18]) sbr12uuLoecher();
    translate([ 37.5,0,-18]) sbr12uuLoecher();
  }
}

module halterungXMotor()
{  
  difference()
  {
    translate([-22,-22,0]) cube([66,44,3]);
    
    translate([0,0,-1]) cylinder(d=26,h=5);
    
    stepperLoecher()translate([0,0,-1])cylinder(d=3,h=11);
    
    translate([33,-12,-1]) cylinder(d=6,h=5);
    translate([33, 12,-1]) cylinder(d=6,h=5);
  }
}

module abstandshalterXMotor()
{
  difference()
  {
    cube([20,44,27]);
    
    translate([10,10,-1]) cylinder(d=6,h=35);
    translate([10,34,-1]) cylinder(d=6,h=35);
  }
}
