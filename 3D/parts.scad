
module Stepper()
{
  color("grey") 
  {
    difference()
    {
      translate([-21,-21,0]) cube([42,42,60]);
      
      translate([ 31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([ 31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
      
      translate([ 31/2, 31/2,50]) cylinder(d=3,h=11,$fn=100);
      translate([ 31/2,-31/2,50]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2, 31/2,50]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2,-31/2,50]) cylinder(d=3,h=11,$fn=100);
      
      rotate([0,0,45]) translate([-10,22,10])cube([20,10,40]);
      rotate([0,0,90+45]) translate([-10,22,10])cube([20,10,40]);
      rotate([0,0,180+45]) translate([-10,22,10])cube([20,10,40]);
      rotate([0,0,270+45]) translate([-10,22,10])cube([20,10,40]);
      
      rotate([0,0,45]) translate([-10,27,-1])cube([20,10,62]);
      rotate([0,0,90+45]) translate([-10,27,-1])cube([20,10,62]);
      rotate([0,0,180+45]) translate([-10,27,-1])cube([20,10,62]);
      rotate([0,0,270+45]) translate([-10,27,-1])cube([20,10,62]);
    }
    
    translate([0,0,60]) cylinder(d=5,h=24,$fn=100);
    translate([0,0,60]) cylinder(d=22,h=2,$fn=100);
  }
}

module hdt3m9_14(d=5)
{
  color("silver")
  {
    difference()
    {
      union()
      {
        cylinder(d=16, h= 10.5);
        translate([0,0,10.5]) cylinder(d=13.4,h=11);
        translate([0,0,21.5]) cylinder(d=16,h=1.511);
      }
      translate([0,0,-1]) cylinder(d=d,h=30);
    }
  }
}

module hdt3m9_20(d=5)
{
  color("silver")
  {
    difference()
    {
      union()
      {
        cylinder(d=23, h= 10.5);
        translate([0,0,10.5]) cylinder(d=19.1,h=11);
        translate([0,0,21.5]) cylinder(d=23,h=1.511);
      }
      translate([0,0,-1]) cylinder(d=d,h=30);
    }
  }
}

module hdt3m9_40(d=5)
{
  color("silver")
  {
    difference()
    {
      union()
      {
        cylinder(d=30, h= 8);
        translate([0,0,8]) cylinder(d=44,h=2);
        translate([0,0,10]) cylinder(d=38,2,h=11);
        translate([0,0,21]) cylinder(d=44,h=2);
      }
      translate([0,0,-1]) cylinder(d=d,h=30);
    }
  }
}

module frad()
{
  *color("darkgoldenrod") 
  {
    difference()
    {
      union()
      {
        cylinder(d=18,h=1);
        translate([0,0,1]) cylinder(d=16,h=9);
        translate([0,0,10]) cylinder(d=18,h=1);
      }
      translate([0,0,-1]) cylinder(d=5,h=14);
    }
  }
  cylinder(d=20,h=1);
  translate([0,0,1]) kugellager625();
  translate([0,0,6]) kugellager625();
  translate([0,0,11]) cylinder(d=20,h=1);
}

module kugellager(i, a, d)
{
  color("silver") difference()
  {
    cylinder(d= a, h= d);
    
    translate([0,0,-1]) cylinder(d=i, h=d+2);
  }
}

module kugellager625()
{
  kugellager(5,16,5);
}

module kugellager30_8()
{
  kugellager(8,22,11);
}

module kugellager3200_5200()
{
  kugellager(10,30,14.3);
}

module kugellager608()
{
  kugellager(8,22,7);
}

module kugellager6200()
{
  kugellager(10,30,9);
}

module flb20Loecher()
{
  translate([-14,-14,-1]) cylinder(d=5,h=22);
  translate([-14, 14,-1]) cylinder(d=5,h=22);
  translate([ 14,-14,-1]) cylinder(d=5,h=22);
  translate([ 14, 14,-1]) cylinder(d=5,h=22);
}

module xlb20()
{
  translate([-21,-20,-10]) cube([41,40,20]);
  difference()
  {
    translate([-31,-35,-10]) cube([10,70,20]);    
    translate([-32,-55/2,0]) rotate([0,90,0]) cylinder(d=6.5,h=12);
    translate([-32, 55/2,0]) rotate([0,90,0]) cylinder(d=6.5,h=12);
  }
}

module flb20()
{
  difference()
  {
    xlb20();
    
    translate([0,0,-11]) cylinder(d=26,h=10);
    translate([0,0, -3]) cylinder(d=30,h=15);
    
    translate([0,0,-10]) flb20Loecher();
  }
  
  difference()
  {
    translate([-20,-20,10.3]) cube([40,40,3]);
    
    translate([0,0,10]) flb20Loecher();
    translate([0,0,10]) cylinder(d=26,h=10);
  }
  
  translate([0,0,-3]) kugellager3200_5200();
}

module llb20()
{
  difference()
  {
    xlb20();
    translate([0,0, -11]) cylinder(d=30,h=22);
  }
  translate([0,0,-4.5]) kugellager6200();
}

module spindel()
{
  cylinder(d=8,h=10.5);
  translate([0,0,10.5]) cylinder(d=10,h=19.5);
  translate([0,0,30]) cylinder(d=16,h=500);
  translate([0,0,530]) cylinder(d=10,h=12);
  
  *translate([0,0,15.7]) kugellager3200_5200();
  *translate([0,0,530]) kugellager6200();
}

module trapezgewindemutter()
{
  color("silver") difference()
  {
    translate([0,-.5,-28.3/2]) linear_extrude(height=28.3)
      polygon(points=[[-27,20.5], [-14,20.5], [-13,19], [13,19], [14,20.5], [27,20.5]
        ,[27,10], [26,9], [26,-15], [11,-15], [5,-20.5], [-5,-20.5], [-11,-15], [-26,-15]
        ,[-26,9], [-27,10]    ]);
  
    translate([0,0,-15]) cylinder(d=32,h=30);
    
    translate([ 20,-20,0]) rotate([-90,0,0]) cylinder(d=6,h=42);
    translate([-20,-20,0]) rotate([-90,0,0]) cylinder(d=6,h=42);
  }
  
  translate([0,0,-16]) difference()
  {
    cylinder(d=32,h=32);
    translate([0,0,-1]) cylinder(d=16,h=34);
  }
}

module sbs12(len= 600)
{
  translate([-len/2,0,18.5]) rotate([0,90,0]) cylinder(d=12, h=len);

  difference()
  {
    translate([-len/2,0,0]) rotate([90,0,90])
      linear_extrude(height=len)
        polygon(points=[[-31.6/2,0],[-31.6/2,4],[-12.5/2,4],[-12.5/2,8],[-10/2,8],[-3,13],
          [3,13],[10/2,8],[12.5/2,8],[12.5/2,4],[31.6/2,4],[31.6/2,0]]);

    for(i=[0:100:500])
      translate([i-len/2+50,0,0])
      {    
        translate([0,-11,-1]) cylinder(d=4.5,h=10);
        translate([0, 11,-1]) cylinder(d=4.5,h=10);
      }
  }
}

module sbr12uuLoecher()
{
  translate([-26/2,-28/2,27.6-10]) cylinder(d=5,h=11);
  translate([-26/2, 28/2,27.6-10]) cylinder(d=5,h=11);
  translate([ 26/2,-28/2,27.6-10]) cylinder(d=5,h=11);
  translate([ 26/2, 28/2,27.6-10]) cylinder(d=5,h=11);
}

module sbr12uu()
{
  translate([0,0,18.5-27.6+17]) difference()
  {
    translate([-39/2,-40/2,0]) cube([39,40,27.6]);
    
    translate([-40/2, 0, 27.6-17]) rotate([0,90,0]) cylinder(d=12,h=41);
    translate([-40/2,-8.5/2,-1]) cube([41,8.5,12]);
    
    sbr12uuLoecher();
  }
}

module wsx1040(len= 500)
{
  translate([-38.2/2,-len/2,0]) cube([38.2,len,26.5]);
  
  translate([-20,-len/2,30]) rotate([-90,0,0]) cylinder(d=10,h=len);
  translate([ 20,-len/2,30]) rotate([-90,0,0]) cylinder(d=10,h=len);
}

module wj200umLoecher()
{
  cylinder(d=5,h=10);
  translate([0,16,0]) cylinder(d=5,h=10);
}

module wj200um()
{
  translate([0,-29/2,0]) import ("WJ200UM_01_10_1.stl");
}

