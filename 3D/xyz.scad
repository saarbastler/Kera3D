$fn=100;
// Keramik 3D- Drucker
// Abmessungen Brennofen:
// X/Y: max 46cm
// Z: max 50 cm

include <parts.scad>
include <schrauben.scad>

profil= 20;

breite= 600;
tiefe= 470;
hoehe= 500-profil;

tischBreite = 500;
tischTiefe= 430;

module boden()
{
  translate([-breite/2,-breite/2,0]) cube([breite,breite,5]);
}

module frame(breite, tiefe)
{
  translate([-breite/2,-tiefe/2-profil,0]) cube([breite,profil,profil]);
  translate([-breite/2, tiefe/2,0])        cube([breite,profil,profil]);

  translate([-breite/2-profil,-tiefe/2-profil,0])        cube([profil,tiefe+2*profil,profil]);
  translate([ breite/2,-tiefe/2-profil,0])               cube([profil,tiefe+2*profil,profil]);
}

module korpus()
{
  *translate([0,0,-profil/2]) frame(breite, tiefe);
  *translate([0,0,hoehe+profil/2]) frame(breite, tiefe);
  
  translate([-breite/2, -tiefe/2-profil, -profil/2])  cube([breite,profil,profil]);
  translate([-breite/2,  tiefe/2       , -profil/2])  cube([breite,profil,profil]);
  translate([-breite/2-profil, -tiefe/2, -profil/2])  cube([profil,tiefe,profil]);
  translate([ breite/2       , -tiefe/2, -profil/2])  cube([profil,tiefe,profil]);
  
  echo("X-Profil unten", breite);
  translate([-breite/2-profil, -tiefe/2, -72])  cube([profil,tiefe,profil]);
  
  translate([-breite/2-82, -tiefe/2-profil, hoehe+profil/2])  cube([breite+82+profil,profil,profil]);
  translate([-breite/2-82,  tiefe/2       , hoehe+profil/2])  cube([breite+82+profil,profil,profil]);
  translate([-breite/2-profil, -tiefe/2, hoehe+profil/2])  cube([profil,tiefe,profil]);
  translate([ breite/2       , -tiefe/2, hoehe+profil/2])  cube([profil,tiefe,profil]);
  echo("X-Profil oben", breite+82+profil);
  echo("Y-Profil", tiefe);
  
  translate([-breite/2-102, -tiefe/2-50, hoehe+profil/2])  cube([profil,tiefe+50+profil,profil]);
  echo("Quer-Profil", tiefe+50+profil);
  
  translate([-breite/2-profil,-tiefe/2-profil,-150])   cube([profil,profil,hoehe+150+profil/2]);
  translate([-breite/2-profil, tiefe/2       ,-150])   cube([profil,profil,hoehe+150+profil/2]);
  translate([ breite/2       ,-tiefe/2-profil,-150])   cube([profil,profil,hoehe+150+profil/2]);
  translate([ breite/2       , tiefe/2       ,-150])   cube([profil,profil,hoehe+150+profil/2]);
  
  echo("Z-Profil", hoehe+150+profil/2);
}

module platteX()
{
  color("silver") difference()
  {
    translate([-114/2,-40/2,0]) cube([114,40,4]);
    
    translate([-37.5,0,-1]) cylinder(d=5,h=17);
    translate([ 37.5,0,-1]) cylinder(d=5,h=17);
    translate([-37.5,0,-18]) sbr12uuLoecher();
    translate([ 37.5,0,-18]) sbr12uuLoecher();
  }
  
  translate([ 13+6.5-114/2,14+6-20, 5]) frad();
  translate([-13-6.5+114/2,14+6-20, 5]) frad();

  translate([ 0, 4, 49]) frad();
  translate([ 0, 4, 0])  cylinder(d=5,h=60);
}

module zWinkel()
{
  color("silver") 
  {
    difference()
    {
      cube([20, 72,4]);
      
      translate([-.5,0,0])
      {
        translate([9, 8,-1]) wj200umLoecher();
        
        translate([9,40+ 8,-1]) wj200umLoecher();
      }
    }
    
    translate([20,0,4-30]) cube([4,72,30]);
  }
}

module stepperLoecher()
{
  translate([ 31/2, 31/2, 0]) children();
  translate([ 31/2,-31/2, 0]) children();
  translate([-31/2, 31/2, 0]) children();
  translate([-31/2,-31/2, 0]) children();
}

module platteY()
{
  translate([1.5, -1, 0]) 
  {
    color("silver") difference()
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
    
    translate([1.5+58,0,4]) zWinkel();
    translate([110, 72/2,-70]) cylinder(d=30,h=100);
    
    translate([ 20, 72/2-15, 6]) frad();
    translate([ 20, 72/2+15, 6]) frad();
    
    translate([-18,72/2,28]) 
    {
      translate([0,0,63]) rotate([180,0,0]) Stepper();
      rotate([180,0,0]) hdt3m9_14();
    
      translate([0,0,-31]) stepperLoecher() M3(35);
      
      translate([ 0, 0,-24]) stepperLoecher() difference()
      {
        cylinder(d=5,h=27);
        
        translate([0,0,-1]) cylinder(d=3,h=30);
      }
    }
  }
}

module zahnriemenx(x)
{
  color("blue") translate([-breite/2-32, -tiefe/2-20, 41.5])
  {    
    translate([-8,0,0]) cube([x+70,2,9]);    
    translate([x+62+8,10,0]) cube([2, tiefe+20,9]);
    translate([62+8-58,tiefe+38,0]) cube([50+x,2,9]);
    
    translate([-8,-14,0]) cube([breite+92,2,9]);    
    translate([x+137,0,0]) cube([breite-54-x,2,9]);
    translate([x+128,10,0]) cube([2, tiefe+20,9]);   
    translate([x+136,tiefe+38,0]) cube([breite-x,2,9]);    
  }
}

module zahnriemeny(x,y)
{
  color("green") translate([x-breite/2+58, -tiefe/2, 85.5])
  {    
    translate([0,-5,0]) cube([2,30+y,9]); 

    translate([-46, 32+y,0]) cube([39,2,9]);
    translate([-46, 46+y,0]) cube([39,2,9]);
    
    translate([0,55+y,0]) cube([2,tiefe-y-50,9]); 
    translate([17,-5,0]) cube([2,tiefe+10,9]); 
  }
}

module XYEinheit(x = 0, y= 0)
{
  translate([0,-tiefe/2-10,0]) sbs12();
  translate([0, tiefe/2+10,0]) sbs12();
  translate([x-270,-0,0])
  {
    translate([0,-tiefe/2-10,0])
    {
      sbr12uu();
      translate([75,0,0]) sbr12uu();

      translate([37.5,0,18.5+17])  platteX();
    }
    translate([0, tiefe/2+10,0])
    {
      sbr12uu();
      translate([75,0,0]) sbr12uu();
      
      translate([37.5,0,35.5]) rotate([0,0,180]) platteX();
    }
    
    translate([-38.2/2+114/2,0,39.5]) wsx1040(530);
    translate([0,y-25,0]) union()
    {
      translate([18,-190,69.5]) wj200um();
      translate([18,-190+40,69.5]) wj200um();

      translate([58,-190,69.5]) rotate([0,0,180]) wj200um();
      translate([58,-190+40,69.5]) rotate([0,0,180]) wj200um();
      
      translate([-1,-190-15,78.5]) platteY();
    }
  }
  
  translate([breite/2+50, -26-tiefe/2, 40.5]) frad();
  zahnriemenx(x);
  zahnriemeny(x,y);
}

module tisch( z = 0)
{
  translate([-tischBreite/2-19,0,-22.85-4]) spindel();   
  translate([-tischBreite/2-19,0,  4.15-4]) rotate([180,0,0]) flb20();
  translate([-tischBreite/2-19,0,  500]) rotate([180,0,0]) llb20();
  translate([-tischBreite/2-19,0,  -16.5]) rotate([180,0,0]) hdt3m9_20(8);
  
  translate([ tischBreite/2+19,0,-22.85-4]) spindel(); 
  translate([ tischBreite/2+19,0,  4.15-4]) rotate([180,0,180]) flb20();
  translate([ tischBreite/2+19,0,  500]) rotate([180,0,180]) llb20();
  translate([ tischBreite/2+19,0,  -16.5]) rotate([180,0,0]) hdt3m9_20(8);
  
  translate([0,0,7+z+profil/2]) 
  {
    translate([-tischBreite/2-19,0,profil/2]) rotate([0,0,-90]) trapezgewindemutter (); 
    translate([ tischBreite/2+19,0,profil/2]) rotate([0,0, 90]) trapezgewindemutter (); 
  
    frame(tischBreite-2*profil, tischTiefe-2*profil);
    echo("Tisch-X", tischBreite-2*profil);
    echo("Tisch-Y", tischTiefe);
    
    color("SaddleBrown") translate([-tischBreite/2,-tischTiefe/2,profil]) cube([tischBreite, tischTiefe,5]);
  }
}

//$t= 0.99;
x= ($t < 0.66) ? $t * 1.5 * 470: (1-$t) * 3 * 470;
y= ($t < 0.33) ? $t * 3 * 380 : ($t < 0.66) ? (.66-$t) * 3 * 380 : 0;
z= ($t < 0.5) ?  $t * 2 * 440 : (1-$t) * 2 * 440;

module antriebZ()
{
  translate([-tischBreite/2-19+9, -tiefe/2+30,  -48]) 
  {
    hdt3m9_40();
    translate([0,0,-64]) Stepper();
    
    translate([0,0,-4]) difference()
    {
      translate([-60,-22,0]) cube([38+44,44,3]);
      
      translate([0,0,-1]) cylinder(d=26,h=5);
      
      translate([ 31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([ 31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
    }
  }

  zlen=1374;
  
  color("blue")
  {
    translate([-tischBreite/2-21,+9,  -37]) cube([breite-60, 2,9]);
    
    translate([-tischBreite/2-30,-tiefe/2+30,  -37]) cube([2, 205,9]);
    
    translate([-tischBreite/2-10,-tiefe/2+10,  -37]) rotate([0,0,atan(215/(breite-60))]) cube([sqrt(pow(breite-60,2)+pow(200,2)), 2,9]);
    echo("Z-Zahnriemen: ", (breite-60) + 205 + sqrt(pow(breite-60,2)+pow(200,2)) + 20*3 + 25*3);
  }
}

antriebZ();
tisch(z); // 440
translate([0,0,hoehe+profil+10])
{
  translate([-breite/2-125,-tiefe/2-26,-33]) 
  {
    Stepper();
    translate([0,0,63]) hdt3m9_14();
    
    *translate([30,-20,33]) cube([1,1,27]);
    translate([0,0,60]) difference()
    {
      translate([-22,-22,0]) cube([66,44,3]);
      
      translate([0,0,-1]) cylinder(d=26,h=5);
      
      translate([ 31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([ 31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2, 31/2,-1]) cylinder(d=3,h=11,$fn=100);
      translate([-31/2,-31/2,-1]) cylinder(d=3,h=11,$fn=100);
    }
  }

  translate([-80,0,0]) XYEinheit(x, y);
}
korpus();


