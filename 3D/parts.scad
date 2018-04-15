$fn=100;

include <schrauben.scad>

module stepperLoecher()
{
  translate([ 31/2, 31/2, 0]) children();
  translate([ 31/2,-31/2, 0]) children();
  translate([-31/2, 31/2, 0]) children();
  translate([-31/2,-31/2, 0]) children();
}

module Stepper()
{
  color("grey") 
  {
    difference()
    {
      translate([-21,-21,0]) cube([42,42,60]);
      
      *stepperLoecher() translate([0,0,-1]) cylinder(d=3,h=11,$fn=100);      
      
      stepperLoecher() translate([0,0,52]) cylinder(d=3,h=9,$fn=100);
      
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
  *cylinder(d=20,h=1);
  translate([0,0,1]) kugellager625();
  translate([0,0,6]) kugellager625();
  *translate([0,0,11]) cylinder(d=20,h=1);
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
    translate([0, 0, -28.3/2]) 
      linear_extrude(height=28.3)
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

    for(i=[0:100:len-100])
      translate([i-len/2+50,0,0])
      {    
        translate([0,-11,-1]) cylinder(d=4.5,h=10);
        translate([0, 11,-1]) cylinder(d=4.5,h=10);
      }
  }
}

module sbr12uuChildren()
{
  translate([-26/2,-28/2,0]) children();
  translate([-26/2, 28/2,0]) children();
  translate([ 26/2,-28/2,0]) children();
  translate([ 26/2, 28/2,0]) children();
}

module sbr12uuLoecher()
{
  translate([0,0,27.6-10]) 
    sbr12uuChildren()
      cylinder(d=5,h=11);
}

module sbr12uu()
{
  color("darkgray") translate([0,0,18.5-27.6+17]) difference()
  {
    translate([-39/2,-40/2,0]) cube([39,40,27.6]);
    
    translate([-40/2, 0, 27.6-17]) rotate([0,90,0]) cylinder(d=12,h=41);
    translate([-40/2,-8.5/2,-1]) cube([41,8.5,12]);
    
    sbr12uuLoecher();
  }
}

module ws10402D()
{
  a=38.2;
  b=40;
  da=10;
  di=6;
  h=26.5;
  h2=30;
  n=5.2;
  nb=9.5;
  nh=15.5;

  rl= 4;
  rr= 2.3;
  polygon( points=
    concat([
    [-n/2,0], [-a/2,0], [-a/2, 1.5], [-35/2,3], [-30/2,3], [-30/2,2.5], [-21/2,2.5], [-21/2,6],
    [-31/2,9.5], [-b/2,9.5], [-b/2,nh-n/2], [-b/2+1.8,nh-n/2], [-b/2+1.8, nh-nb/2], [-27.5/2,nh-nb/2],
    [-27.5/2,nh-n/2], [-25/2,nh-n/2], [-25/2,nh+n/2], [-27.5/2, nh+n/2], [-27.5/2,nh+nb/2],
    [-b/2+1.8,nh+nb/2], [-b/2+1.8,nh+n/2], [-b/2,nh+n/2], [-b/2,25.2] ] 
    ,[ for(al=[-90:-5:-405]) [-b/2+da/2*cos(al),h2+da/2*sin(al)] ]
    ,[ for(al=[225:-5:-90]) [ b/2+da/2*cos(al),h2+da/2*sin(al)] ]
    , [ [b/2,25.2], [b/2,nh+n/2],[b/2-1.8,nh+n/2], [b/2-1.8,nh+nb/2]
    , [27.5/2,nh+nb/2],[27.5/2, nh+n/2], [25/2, nh+n/2], [25/2, nh-n/2], [27.5/2,nh-n/2]
    , [27.5/2,nh-nb/2], [b/2-1.8, nh-nb/2], [b/2-1.8,nh-n/2], [b/2,nh-n/2], [b/2,9.5], [31/2,9.5]
    , [21/2,6], [21/2,2.5], [30/2,2.5], [30/2,3], [35/2,3], [a/2, 1.5], [a/2,0]
    , [n/2,0], [n/2,1.4], [nb/2, 1.4], [nb/2, 5.6], [-nb/2,5.6], [-nb/2,1.4]
    , [-n/2,1.4]]
    // 180
    ,[ for(al=[360:-5:1]) [-b/2+di/2*cos(al),h2+di/2*sin(al)] ]
    ,[ for(al=[360:-5:1]) [ b/2+di/2*cos(al),h2+di/2*sin(al)] ]
    ,[ for(al=[0:-5:-90])     [ 11.5-rl+rl/2*cos(al), 7.5+rl+rl/2*sin(al)] ]
    ,[ for(al=[-90:-5:-180])  [-11.5+rl+rl/2*cos(al), 7.5+rl+rl/2*sin(al)] ]
    ,[ for(al=[180:-5:90])    [-11.5+rl+rl/2*cos(al),23.5-rl+rl/2*sin(al)] ]
    ,[ for(al=[90:-5:0])      [ 11.5-rl+rl/2*cos(al),23.5-rl+rl/2*sin(al)] ]
    // 400
    , [ [-24.5/2,22], [-26.5/2,21] ]
    ,[ for(al=[-90:-5:-180])  [ -29.5/2+rr/2*cos(al),23.25+rr/2*sin(al)] ]
    ,[[-34.5/2,24.5], [-32.5/2,25.5]  ]
    ,[ for(al=[90:-5:0])      [ -29.5/2+rr/2*cos(al),23.25+rr/2*sin(al)] ]
    // 442
    , [ [ 24.5/2,22], [ 26.5/2,21] ]
    ,[ for(al=[-90:5:0])  [  29.5/2+rr/2*cos(al),23.25+rr/2*sin(al)] ]
    ,[[ 34.5/2,24.5], [ 32.5/2,25.5]  ]
    ,[ for(al=[90:5:180])      [  29.5/2+rr/2*cos(al),23.25+rr/2*sin(al)] ]
    ), paths= [
    [ for(i=[0:179]) i],
    [ for(i=[180:251]) i],
    [ for(i=[252:323]) i],
    [ for(i=[324:399]) i],
    [ for(i=[400:441]) i],
    [ for(i=[442:482]) i],
    ]
  );
}

module wsx1040(len= 500)
{
  color("darkgray")
    translate([0,len/2,0])  rotate([90,0,0])
      linear_extrude(height=len)
        ws10402D();
}

module wj200umChildren()
{
  children();
  translate([0,16,0]) children();
}

module wj200umLoecher()
{
  wj200umChildren()
    cylinder(d=5,h=10);
}

module wj200um()
{
  translate([0,-29/2,0]) import ("WJ200UM_01_10_1.stl");
}

module aluProfil20x20b(len=100)
{
color("silver")
  linear_extrude(height=len)
      polygon(points= concat([
  [-10, 10], [-3.5, 10], [-3.5,9.5], [-3,9.5], [-3,8.5], [-5,8.5], [-5,7] ,[-3.5, 5.5], [-1,5.5], 
  [0,5], 
  [1,5.5], [3.5,5.5], [5,7], [5,8.5], [3,8.5], [3,9.5], [3.5,9.5], [3.5,10], [10,10],
  [10,3.5], [9.5,3.5], [9.5,3], [8.5,3], [8.5,5], [7,5], [5.5,3.5], [5.5,1],
  [5,0],
  [5.5,-1], [5.5,-3.5],[7,-5], [8.5,-5], [8.5,-3], [9.5,-3], [9.5,-3.5], [10,-3.5], [10,-10],
  [3.5,-10],[3.5,-9.5],[3,-9.5], [3,-9.5],[3,-8.5], [5,-8.5], [5,-7] ,[3.5, -5.5], [1,-5.5], 
  [0,-5], 
  [-1,-5.5], [-3.5,-5.5], [-5,-7], [-5,-8.5], [-3,-8.5], [-3,-9.5], [-3.5,-9.5], [-3.5,-10], [-10,-10],
  [-10,-3.5], [-9.5,-3.5], [-9.5,-3], [-8.5,-3], [-8.5,-5], [-7,-5], [-5.5,-3.5], [-5.5,-1],
  [-5,0],
  [-5.5,1], [-5.5,3.5],[-7,5], [-8.5,5], [-8.5,3], [-9.5,3], [-9.5,3.5], [-10,3.5]],
  /*  */
  [for(a=[-35:5:35]) [2.25*sin(a),2.25*cos(a)] ], [for(a=[35:5:55]) [2.75*sin(a),2.75*cos(a)] ],
  [for(a=[55:5:90+35]) [2.25*sin(a),2.25*cos(a)] ], [for(a=[90+35:5:90+55]) [2.75*sin(a),2.75*cos(a)] ],
  [for(a=[90+55:5:180+35]) [2.25*sin(a),2.25*cos(a)] ], [for(a=[180+35:5:180+55]) [2.75*sin(a),2.75*cos(a)] ],
  [for(a=[180+55:5:270+35]) [2.25*sin(a),2.25*cos(a)] ], [for(a=[270+35:5:270+55]) [2.75*sin(a),2.75*cos(a)] ]
  
  )
      ,
      
  paths=[[ for(i=[0:72]) i]
  ,[ for(i=[73:152]) i]]
      );
}

module lm8uu()
{
  color("silver")
    translate([0,-12,0])
      rotate([-90,0,0])
        difference()
        {
          cylinder(d=15, h=24, $fn=100);
          
          translate([0,0,-1])
            cylinder(d=8.6, h= 26, $fn=100);
            
          translate([0,0,3]) difference()
          {
            cylinder(d=16, h=1.2);
            translate([0,0,-1]) cylinder(d=14,h=3);
          }
          translate([0,0,19.5]) difference()
          {
            cylinder(d=16, h=1.2);
            translate([0,0,-1]) cylinder(d=14,h=3);
          }
        }
        
}

module wellenHalter()
{
  difference()
  {
    cube([31.5,16,20]);
    
    translate([8,8,-1]) cylinder(d=8.4,h=22);
    translate([8,8,-1]) cylinder(d=8.4+.4,h=1.3);
    
    translate([-1,8,10]) scale([1,0.9,1]) rotate([0,90,0]) cylinder(d=2.3,h=10);    
    translate([8,-1,10]) scale([0.9,1,1]) rotate([-90,0,0]) cylinder(d=2.3,h=18);
  }
  
  difference()
  {
    translate([25.5,-12,0]) cube([6,40,20]);
    
    translate([20.5, 23,10]) scale([1,0.9,1]) rotate([0,90,0]) cylinder(d=6.4,h=12);
    translate([20.5, -7,10]) scale([1,0.9,1]) rotate([0,90,0]) cylinder(d=6.4,h=12);
  }
}

module langloch(d, l, h)
{
  cylinder(d=d,h=h);
  translate([l,0,0]) cylinder(d=d,h=h);
  translate([0,-d/2,0]) cube([l, d, h]);
}

module tischHalterZ()
{
  difference()
  {
    translate([-48,-15,0]) union()
    {
      cube([36,30,5]);
      translate([36,0,0]) cube([12-.5,30,24]);
    }
    
    translate([0,0,-1]) cylinder(d=15.4,h=26);
    translate([0,0,-1]) cylinder(d=16,h=1.3);
    
    translate([-41,-7,-1]) langloch(6.4,7,7);
    translate([-41, 7,-1]) langloch(6.4,7,7);

    translate([-11.5, 11.5, 5]) rotate([0,90,0]) scale([1,.9,1]) cylinder(d=2.3, h=20);
    translate([-11.5, 11.5,19]) rotate([0,90,0]) scale([1,.9,1]) cylinder(d=2.3, h=20);
    translate([-11.5,-11.5, 5]) rotate([0,90,0]) scale([1,.9,1]) cylinder(d=2.3, h=20);
    translate([-11.5,-11.5,19]) rotate([0,90,0]) scale([1,.9,1]) cylinder(d=2.3, h=20);
  }
}

module tischHalterZGSCoords(y,z)
{
  translate([-1, y, z]) rotate([0,90,0]) //scale([1,.9,1]) 
    children();
}

module tischHalterZGSCoordsLoch()
{
  cylinder(d=3.7, h=20);      
  translate([0,0,10]) cylinder(d=6.8, h=4);
}

module tischHalterZGegenstueck()
{
  clearance= 0.3;
  difference()
  {
    translate([0.5,-16,-2]) cube([12-.5,32,28]);

    translate([0,0,-clearance/2]) cylinder(d=15.4,h=24+clearance);
    translate([0,0,-3]) cylinder(d=11,h=30);
    
    tischHalterZGSCoords( 11.5,  5) tischHalterZGSCoordsLoch();
    tischHalterZGSCoords( 11.5, 19) tischHalterZGSCoordsLoch();
    tischHalterZGSCoords(-11.5,  5) tischHalterZGSCoordsLoch();
    tischHalterZGSCoords(-11.5, 19) tischHalterZGSCoordsLoch();    
  }
}

module gewindeplatteM5()
{
  color("silver") difference()
  {
    translate([-9/2,-14/2,0]) cube([9,14,2.5]);
    translate([0,0,-1]) cylinder(d=5,h=4);
  }
}

module endSwitch()
{
  // reichelt MAR 1050.5202
  color("dodgerblue") difference()
  {
    cube([19.8, 6.4, 10]);
    
    translate([5.2, -1, 3.1])rotate([-90,0,0])cylinder(d=2.5, h=8, $fn=100);
    translate([14.7, -1, 3.1])rotate([-90,0,0])cylinder(d=2.5, h=8, $fn=100);
  }
  
  color("silver")
  {
    translate([(19.8-0.5)/2-7.5, (6.4-2.7)/2, -3.8]) cube([0.5, 2.7, 3.8]);
    translate([(19.8-0.5)/2, (6.4-2.7)/2, -3.8]) cube([0.5, 2.7, 3.8]);
    translate([(19.8-0.5)/2+7.5, (6.4-2.7)/2, -3.8]) cube([0.5, 2.7, 3.8]);
    
    translate([0, (6.4-3.4)/2,10]) rotate([0,-18,0]) cube([22, 3.4, 0.5]);
  }
  
  // Conrad 703778
  color("white")translate([0, (6.4-3.4)/2,10]) 
  rotate([0,-18,0]) translate([17,0,0])
  rotate([-90,0,0]) cylinder( d= 4.8, h= 3.2, $fn= 100);
}


