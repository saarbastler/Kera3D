
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
    
    translate([7.5, 8, 0])    wj200umChildren() circle(d=5.25);
    translate([7.5,40+ 8,0])  wj200umChildren() circle(d=5.25);

    translate([68, 8,0])      wj200umChildren() circle(d=5.25);
    translate([68,40+ 8,0])   wj200umChildren() circle(d=5.25);
    
    translate([-18, 72/2,0])  stepperLoecher()  circle(d=3.25);
    
    translate([52,20,0]) circle(d=5.25);
    translate([52,50,0]) circle(d=5.25);
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
    
    translate([10,10,-1]) cylinder(d=6.7,h=35);
    translate([10,34,-1]) cylinder(d=6.7,h=35);
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


module umlenkungX()
{
  difference()
  {
    union()
    {
      translate([-17,-6.25,0]) cube([34,12,28.25-.3]);
      translate([-17,5.75,20.25]) cube([34,20.25,8-.3]);
      
      translate([-17+.3,-6.25+.3,28.25-.3]) cube([34-.6,32.25-.6,.3]);
    }
    
    translate([0,0,-1]) cylinder(d=5.5,h=40);

    translate([0,0,28.25-.3]) cylinder(d=6.5,h=1);
    
    translate([-10,-8,10]) rotate([-90,0,0]) cylinder(d=6.5,h=20);
    translate([-10,-8,10]) rotate([-90,0,0]) cylinder(d=11,h=6.5);
    translate([ 10,-8,10]) rotate([-90,0,0]) cylinder(d=6.5,h=20);
    translate([ 10,-8,10]) rotate([-90,0,0]) cylinder(d=11,h=6.5);

    translate([0,16,15]) cylinder(d=6.5,h=20);
    
    translate([0,16,28.25-.3]) cylinder(d=7.5,h=1);
  }
}

module zahnriehmenHalterX1()
{
  difference()
  {
    union()
    {
      cube([20,26,8]);
      
      translate([0,26,0]) cube([20,10,60]);
    }
    
    translate([10,6,-1]) cylinder(d=6.5,h=20);
    translate([10,20,-1]) cylinder(d=6.5,h=20);
    
    translate([5,25,41]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([15,25,41]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([5,25,56]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([15,25,56]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
  }
}

module zahnriehmenHalterX2()
{
  difference()
  {
    translate([-2,0,0]) cube([44,20,8]);
    
    translate([5,10,-1]) cylinder(d=6.5,h=10);
    translate([36,10,-1]) cylinder(d=6.5,h=10);
  }
  difference()
  {
    translate([10,0,8]) cube([20,18,52]);
    
    translate([15,-1,41]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([25,-1,41]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([15,-1,56]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
    translate([25,-1,56]) rotate([-90,0,0]) cylinder(d=2.5,h=20);
  }
}

module zahnriehmenGegenstueck()
{
  difference()
  {
    union()
    {
      translate([-10,-11,0]) cube([20,22,2]);
      translate([-10,7,2]) cube([20,4,1.2]);
      translate([-10,-11,2]) cube([20,4,1.2]);
      
      for(i=[0:3:20])
        translate([i-9.6,-11,2]) cube([1.2,22,1.2]);
    }
    translate([-5,-7.5,-1]) cylinder(d=3,h=6);
    translate([-5, 7.5,-1]) cylinder(d=3,h=6);
    translate([ 5,-7.5,-1]) cylinder(d=3,h=6);
    translate([ 5, 7.5,-1]) cylinder(d=3,h=6);
  }
}

module stopper()
{
  difference()
  {
    union()
    {
      cube([20,20,20]);
  
      translate([0,10,20]) rotate([0,90,0]) cylinder(d=20,h=20);
    }
     
    translate([10,10,-1]) cylinder(d=6.5,h=40);
    translate([10,10,8]) cylinder(d=11,h=40);
  }
}

module zahnriehmenHalterY()
{
  translate([47,10,4]) difference()
  {
    cube([10,50,22.5]);
    
    translate([-6,5   , 4]) rotate([0,90,0]) cylinder(d=2.5, h=22);
    translate([-6,5+10, 4]) rotate([0,90,0]) cylinder(d=2.5, h=22);
    translate([-6,5   ,19]) rotate([0,90,0]) cylinder(d=2.5, h=22);
    translate([-6,5+10,19]) rotate([0,90,0]) cylinder(d=2.5, h=22);
    
    translate([0,30,0])
    {
      translate([-6,5   , 4]) rotate([0,90,0]) cylinder(d=2.5, h=22);
      translate([-6,5+10, 4]) rotate([0,90,0]) cylinder(d=2.5, h=22);
      translate([-6,5   ,19]) rotate([0,90,0]) cylinder(d=2.5, h=22);
      translate([-6,5+10,19]) rotate([0,90,0]) cylinder(d=2.5, h=22);
    }
    
    translate([5,10,-1]) cylinder(d=4.2,h=25);
    translate([5,40,-1]) cylinder(d=4.2,h=25);
  }
}

*rotate([0,90,0]) zahnriehmenHalterY();
*stopper();

*zahnriehmenGegenstueck();
*rotate([90,0,0]) zahnriehmenHalterX2();
*translate([-10,48.5,-36]) rotate([90,0,0]) zahnriehmenHalterX1();
*rotate([0,180,0]) umlenkungX();

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
  
*halterungYMotor2D();