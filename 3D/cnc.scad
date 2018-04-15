
$fn=100;
include <parts.scad>

module halterungZMotor2D()
{
  er= 4;  
  difference()
  {
    hull()
    {
      translate([-60+er/2,       -22+er/2,0]) circle(d=er);
      translate([-60+38+44-er/2, -22+er/2,0]) circle(d=er);
      translate([-60+er/2,        22-er/2,0]) circle(d=er);
      translate([-60+38+44-er/2,  22-er/2,0]) circle(d=er);
    }
    
    circle(d=31);
    
    translate([ 31/2, 31/2,0])  circle(d=3.5);
    translate([ 31/2,-31/2,0])  circle(d=3.5);
    translate([-31/2, 31/2,0])  circle(d=3.5);
    translate([-31/2,-31/2,0])  circle(d=3.5);
    
    translate([-50, 10-22,0]) circle(d=6.5);
    translate([-50,-10+22,0]) circle(d=6.5);
  }
}

module halterungZMotor()
{
  linear_extrude(height=4)
    halterungZMotor2D();
}

module halterungYMotor()
{
  linear_extrude(height=4)
    halterungYMotor2D();
}

module halterungYMotor2D()
{
  er= 4;
  difference()
  {
    hull()
    {
      translate([-38+er/2,           er/2,0]) circle(d=er);
      translate([-38+er/2,        72-er/2,0]) circle(d=er);
      translate([-38+75+38-er/2,     er/2,0]) circle(d=er);
      translate([-38+75+38-er/2,  72-er/2,0]) circle(d=er);
    }
    
    translate([7.5, 8, 0])    wj200umChildren() circle(d=5.5);
    translate([7.5,40+ 8,0])  wj200umChildren() circle(d=5.5);

    translate([68, 8,0])      wj200umChildren() circle(d=5.5);
    translate([68,40+ 8,0])   wj200umChildren() circle(d=5.5);
    
    translate([-18, 72/2,0])  stepperLoecher()  circle(d=3.5);
  }
}

module halterungXSchlitten2D()
{
  er= 4; 

  difference()
  {
    hull()
    {
      translate([-114/2+er/2,     -40/2+er/2,0]) circle(d=er);
      translate([-114/2+114-er/2, -40/2+er/2,0]) circle(d=er);
      translate([-114/2+er/2,      40/2-er/2,0]) circle(d=er);
      translate([-114/2+114-er/2,  40/2-er/2,0]) circle(d=er);
    }
    translate([-37.5,0,0]) circle(d=5.25);
    translate([ 37.5,0,0]) circle(d=5.25);
    
    translate([0, 8,0]) circle(d=5.25);
    translate([0,-8,0]) circle(d=5.25);
    translate([ 13+6.5-114/2,14+6-20, 0]) circle(d=5.25);
    translate([-13-6.5+114/2,14+6-20, 0]) circle(d=5.25);
    
    translate([-37.5,0,0])  sbr12uuChildren() circle(d=5.25);
    translate([ 37.5,0,0])  sbr12uuChildren() circle(d=5.25);
  }
}

module halterungXSchlitten()
{
  linear_extrude(height=4)
    halterungXSchlitten2D();    
}

module halterungXMotor()
{
  color("silver")
    linear_extrude(height=4)
      halterungXMotor2D();
}

module halterungXMotor2D()
{
  er= 6;
  
  difference()
  {
    hull()
    {
      translate([-22+er/2,-22+er/2,0])    circle(d= er);
      translate([-22+er/2, 22-er/2,0])    circle(d= er);
      translate([-22+66-er/2,-22+er/2,0]) circle(d= er);
      translate([-22+66-er/2, 22-er/2,0]) circle(d= er);
    }
    circle(d=26);
    
    stepperLoecher() circle(d=3.5);
    
    translate([33,-12]) circle(d=6.5,h=5);
    translate([33, 12]) circle(d=6.5,h=5);
  }
}

module abstandshalterXMotor()
{
  difference()
  {
    cube([20,44,27+2.5]);
    
    translate([10,10,-1]) cylinder(d=6.5,h=35);
    translate([10,34,-1]) cylinder(d=6.5,h=35);
  }
}

module sbs12GegenstueckLoecher2D()
{
  translate([0,-11.5,0]) circle(d=2.5);
  translate([0, 11.5,0]) circle(d=2.5);
}

module sbs12Gegenstueck2D()
{
  difference()
  {
    translate([-3,-15,0]) square([6,30]);
        
    sbs12GegenstueckLoecher2D();
  }
}

module sbs12Gegenstueck()
{
  linear_extrude(height=6)
    sbs12Gegenstueck2D();
}

d=2.5;
*sbs12Gegenstueck2D();
*for(i=[0:30+d:130])
{
  translate([-4,i-15-d,0]) square([8,d]);
  translate([0,i,0]) sbs12GegenstueckLoecher2D();
}
  
*#translate([5,-15-d,0]) cube([1,140,1]);
*#translate([-4,-15-d,0]) cube([1,2.5,1]);
  
*halterungXSchlitten2D();
  
  