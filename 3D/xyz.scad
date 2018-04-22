$fn=100;
// Keramik 3D- Drucker
// Abmessungen Brennofen:
// X/Y: max 46cm
// Z: max 50 cm

include <cnc.scad>
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
  translate([-breite/2,-tiefe/2-profil/2,profil/2]) rotate([0,90,0]) aluProfil20x20b(breite);
  translate([-breite/2, tiefe/2+profil/2,profil/2]) rotate([0,90,0]) aluProfil20x20b(breite);

  translate([-breite/2-profil/2,-tiefe/2-profil,profil/2]) rotate([-90,0,0]) aluProfil20x20b(tiefe+2*profil);
  translate([ breite/2+profil/2,-tiefe/2-profil,profil/2]) rotate([-90,0,0]) aluProfil20x20b(tiefe+2*profil);
}

module korpus()
{ 
  translate([-breite/2, -tiefe/2-profil/2, -10]) rotate([0,90,0]) aluProfil20x20b(breite);
  translate([-breite/2,  tiefe/2+profil/2, -10]) rotate([0,90,0]) aluProfil20x20b(breite);
  translate([-breite/2-profil/2, -tiefe/2, -10]) rotate([-90,0,0]) aluProfil20x20b(tiefe);
  translate([ breite/2+profil/2, -tiefe/2, -10]) rotate([-90,0,0]) aluProfil20x20b(tiefe);
  
  echo("X-Profil unten", breite);
  translate([-breite/2-profil/2, -tiefe/2, -72+profil/2]) rotate([-90,0,0]) aluProfil20x20b(tiefe);
  
  translate([-breite/2-82, -tiefe/2-profil/2,  hoehe+profil]) rotate([0,90,0]) aluProfil20x20b(breite+82+profil);
  translate([-breite/2-82,  tiefe/2+profil/2,  hoehe+profil]) rotate([0,90,0]) aluProfil20x20b(breite+82+profil);
  translate([-breite/2-profil/2, -tiefe/2, hoehe+profil]) rotate([-90,0,0]) aluProfil20x20b(tiefe);
  translate([ breite/2+profil/2, -tiefe/2, hoehe+profil]) rotate([-90,0,0]) aluProfil20x20b(tiefe);
  
  echo("X-Profil oben", breite+82+profil);
  echo("Y-Profil", tiefe);
  
  translate([-breite/2-102+profil/2, -tiefe/2-50, hoehe+profil]) rotate([-90,0,0]) aluProfil20x20b(tiefe+50+profil);
  echo("Quer-Profil", tiefe+50+profil);
  
  translate([-breite/2-profil/2,-tiefe/2-profil/2,-150])   aluProfil20x20b(hoehe+150+profil/2);
  translate([-breite/2-profil/2, tiefe/2+profil/2,-150])   aluProfil20x20b(hoehe+150+profil/2);
  translate([ breite/2+profil/2,-tiefe/2-profil/2,-150])   aluProfil20x20b(hoehe+150+profil/2);
  translate([ breite/2+profil/2, tiefe/2+profil/2,-150])   aluProfil20x20b(hoehe+150+profil/2);
  
  
  echo("Z-Profil", hoehe+150+profil/2);
}

module platteX()
{
  color("silver") halterungXSchlitten();
  
  translate([ 13+6.5-114/2,14+6-20, 5+2.5]) frad();
  translate([-13-6.5+114/2,14+6-20, 5+2.5]) frad();

  translate([-51/2,-20,34.5]) umlenkungY();
  
  translate([-51/2+5.5,-30,34]) rotate([90,0,0]) M6Mutter();
  translate([ 51/2-5.5,-30,34]) rotate([90,0,0]) M6Mutter();
    
  translate([ 0, -25, 49]) frad();
  translate([ 0, -25, 45.5])  M5Mutter();
  translate([ 0, -25, 60.5])  M5Mutter();
  translate([ 0, -25, 28.5]) M5(40);
  
  translate([ 0, 8, 0])  M5(10);
  translate([ 0,-8, 0])  M5(10);
  
  translate([0, 8, 5.4]) gewindeplatteM5();
  translate([0,-8, 5.4]) gewindeplatteM5();
  
  translate([-37.5,0,4]) sbr12uuChildren() rotate([180,0,0]) M5DIN1991(12);
  translate([ 37.5,0,4]) sbr12uuChildren() rotate([180,0,0]) M5DIN1991(12);
  
  translate([-37.5,0,0]) 
  {
    M5DIN1991(25);
    translate([0,0,4]) M5Mutter();
    translate([0,0,19]) M5Mutter();
  }
  translate([ 37.5,0,0]) 
  {
    M5DIN1991(25);
    translate([0,0,4]) M5Mutter();
    translate([0,0,19]) M5Mutter();
  }
}

module zWinkel()
{
  color("silver") 
  {
    difference()
    {
      translate([-1,0,0]) cube([21, 72,4]);
      
      translate([-.5,0,0])
      {
        translate([9, 8,-1]) wj200umLoecher();
        
        translate([9,40+ 8,-1]) wj200umLoecher();
      }
    }
    
    translate([20,0,4-40]) cube([4,72,40]);
  }
}

module platteY()
{
  translate([1.5, -1, 0]) 
  {
    color("silver") halterungYMotor();
    
    translate([1.5+58,0,4]) zWinkel();
    translate([110, 72/2,-70]) cylinder(d=30,h=100);
    
    translate([ 20, 72/2-15, 0])  M5DIN1991(25);
    translate([ 20, 72/2-15,4]) M5Mutter();
    translate([ 20, 72/2-15, 8]) frad();
    translate([ 20, 72/2-15,20]) M5Mutter();
    
    translate([ 20, 72/2+15, 0])  M5DIN1991(25);
    translate([ 20, 72/2+15,4]) M5Mutter();
    translate([ 20, 72/2+15, 8]) frad();
    translate([ 20, 72/2+15,20]) M5Mutter();
    
    translate([-18,72/2,28+2]) 
    {
      translate([0,0,64]) rotate([180,0,0]) Stepper();
      rotate([180,0,0]) hdt3m9_14();
    
      translate([0,0,-31-2]) stepperLoecher() M3(35);
      
      translate([ 0, 0,-24-2]) stepperLoecher() difference()
      {
        cylinder(d=5,h=30);
        
        translate([0,0,-1]) cylinder(d=3,h=30);
      }
    }
    
    zahnriehmenHalterY();
    translate([42,20,15.5]) rotate([90,0,90]) zahnriehmenGegenstueck();
    translate([42,50,15.5]) rotate([90,0,90]) zahnriehmenGegenstueck();
  }
}

module zahnriemenx(x)
{
  color("blue") translate([-breite/2-32, -tiefe/2-20, 44])
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
  color("green") translate([x-breite/2+58, -tiefe/2, 85.5+2])
  {    
    translate([0,-35,0]) cube([2,60+y,9]); 

    translate([-46, 32+y,0]) cube([39,2,9]);
    translate([-46, 46+y,0]) cube([39,2,9]);
    
    translate([0,55+y,0]) cube([2,tiefe-y-20,9]); 
    translate([17,-35,0]) cube([2,tiefe+70,9]); 
  }
}

module sbs12schrauben(len=600)
{
  for(i=[0:100:len-100])
    translate([i-len/2+50,0,8])
    {    
      translate([0,-11.5,-1]) rotate([180,0,0]) M3(30);
      translate([0, 11.5,-1]) rotate([180,0,0]) M3(30);
    }
}

module XYEinheit(x = 0, y= 0)
{
  translate([0,-tiefe/2-10,0]) 
  {
    sbs12();
    sbs12schrauben();
    
    for(i=[0:100:500])
      translate([i-250,0,-26]) sbs12Gegenstueck();
  }
  
  translate([0, tiefe/2+10,0])
  {
    sbs12();
    sbs12schrauben();
    
    for(i=[0:100:500])
      translate([i-250,0,-26]) sbs12Gegenstueck();
  }

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
    
    translate([-39/2+114/2,0,39.5]) wsx1040(530);
    translate([0,y-25,0]) union()
    {
      translate([17.5,-190,69.5]) wj200um();
      translate([17.5,-190+40,69.5]) wj200um();

      translate([57.5,-190,69.5]) rotate([0,0,180]) wj200um();
      translate([57.5,-190+40,69.5]) rotate([0,0,180]) wj200um();
      
      translate([-1.5,-190-15,78.5]) platteY();
    }
  }
  
  translate([breite/2+50, -26-tiefe/2, 40.5+2.5]) frad();
  translate([breite/2+50, -26-tiefe/2, -20]) umlenkungX();
  translate([breite/2+50, -26-tiefe/2, -25]) cylinder(d=5,h=90);
  translate([breite/2+50, -26-tiefe/2, -24]) M5Mutter();
  translate([breite/2+50, -26-tiefe/2, 8]) M5Mutter();
  translate([breite/2+0, -20-tiefe/2, 0]) stopper();
  
  translate([breite/2+50, -10-tiefe/2, 8]) rotate([180,0,0]) M6(12);
  translate([breite/2+50+10, -27.5-tiefe/2, -10]) rotate([-90,0,0]) M6(12);
  translate([breite/2+50-10, -27.5-tiefe/2, -10]) rotate([-90,0,0]) M6(12);
  
  translate([-breite/2-22, tiefe/2-18, 0]) zahnriehmenHalterX1();
  
  translate([-breite/2-12, tiefe/2+2, 8]) rotate([180,0,0]) M6(12);
  translate([-breite/2-12, tiefe/2-12, 8]) rotate([180,0,0]) M6(12);
  
  translate([-breite/2-12, tiefe/2+22, 48.5]) rotate([90,0,0]) zahnriehmenGegenstueck();
  
  translate([ breite/2+50, tiefe/2+0, 0]) zahnriehmenHalterX2();
  
  translate([ breite/2+54, tiefe/2+10, 8]) rotate([0,180,0]) M6(12);
  translate([ breite/2+54+32, tiefe/2+10, 8]) rotate([0,180,0]) M6(12);
  
  translate([ breite/2+54+16, tiefe/2+22, 48.5]) rotate([90,0,0]) zahnriehmenGegenstueck();
  
  zahnriemenx(x);
  zahnriemeny(x,y);
}

module umlenkungY2()
{
  difference()
  {
    rotate([0,90,-90]) uProfil(51);
    
    translate([51/2,-4.3,-12]) cylinder(d=5.5,h=30);
    
    translate([5.5,-2,-.5]) rotate([-90,0,0]) cylinder(d=6.0,h=3);
    translate([45.5,-2,-.5]) rotate([-90,0,0]) cylinder(d=6.0,h=3);
  }
}

module umlenkungY()
{
  difference()
  {
    union()
    {
      translate([0,-10,-6]) cube([51,10,11]);
      translate([11,0,-3.75]) cube([29,15,8.75]);
    }
    
    translate([51/2,-5,-11]) cylinder(d=5.5, h=20);
    *translate([51/2,-5,-11]) cylinder(d=11, h=6.5);
    
    translate([5.5,-18,-.5]) rotate([-90,0,0]) cylinder(d=6.0,h=20);
    translate([45.5,-18,-.5]) rotate([-90,0,0]) cylinder(d=6.0,h=20);
  }
}

module linearZ(z)
{
  translate([4+24,0,-30]) color("silver") cylinder(d=8,h=550);
  translate([4+24,0,z+24]) rotate([-90,0,0]) lm8uu();
  translate([4+24,0,z+12]) tischHalterZ();
  translate([4+24,0,z+12]) tischHalterZGegenstueck();
  translate([4+24-8,-8,-20]) 
  { 
    wellenHalter();
    translate([26, 23,10]) rotate([0,90,0]) M6(10);
    translate([26, -7,10]) rotate([0,90,0]) M6(10);
  }
  translate([4+24-8,-8,490]) wellenHalter();
}

module tisch( z = 0)
{
  *translate([-280,-200,500]) rotate([180,0,0]) endSwitch();
  translate([-tischBreite/2-19,0,-22.85-4-10]) spindel();   
  translate([-tischBreite/2-19,0,  4.15-4-10]) rotate([180,0,0]) flb20();
  translate([-tischBreite/2-19,0,  500]) rotate([180,0,0]) llb20();
  translate([-tischBreite/2-19,0,  -16.5-10]) rotate([180,0,0]) hdt3m9_20(8);
  
  translate([ tischBreite/2+19,0,-22.85-4-10]) spindel(); 
  translate([ tischBreite/2+19,0,  4.15-4-10]) rotate([180,0,180]) flb20();
  translate([ tischBreite/2+19,0,  500]) rotate([180,0,180]) llb20();
  translate([ tischBreite/2+19,0,  -16.5]) rotate([180,0,0]) hdt3m9_20(8);
  
  translate([0,0,7+z+profil/2]) 
  {
    translate([-tischBreite/2-19,0,profil/2]) rotate([0,0,-90]) trapezgewindemutter (); 
    translate([ tischBreite/2+19,0,profil/2]) rotate([0,0, 90]) trapezgewindemutter (); 
  
    frame(tischBreite-2*profil-3, tischTiefe-2*profil);
    echo("Tisch-X", tischBreite-2*profil);
    echo("Tisch-Y", tischTiefe);
    
    translate([ tischBreite/2-22, 20,profil/2]) rotate([0, 90,0]) M6(40);
    translate([ tischBreite/2-22,-20,profil/2]) rotate([0, 90,0]) M6(40);
    translate([-tischBreite/2+22, 20,profil/2]) rotate([0,-90,0]) M6(40);
    translate([-tischBreite/2+22,-20,profil/2]) rotate([0,-90,0]) M6(40);
    color("SaddleBrown") translate([-tischBreite/2,-tischTiefe/2,profil]) cube([tischBreite, tischTiefe,5]);
  }
  
  translate([ tischBreite/2-1.5, 60,0]) linearZ(z);
  translate([ tischBreite/2-1.5,-60,0]) linearZ(z);
  translate([-tischBreite/2+1.5, 60,0]) rotate([0,0,180]) linearZ(z);
  translate([-tischBreite/2+1.5,-60,0]) rotate([0,0,180]) linearZ(z);
}

//$t= 0.99;
x= ($t < 0.66) ? $t * 1.5 * 470: (1-$t) * 3 * 470;
y= ($t < 0.33) ? $t * 3 * 380 : ($t < 0.66) ? (.66-$t) * 3 * 380 : 0;
z= ($t < 0.5) ?  $t * 2 * 440 : (1-$t) * 2 * 440;
//x= 470;
module antriebZ()
{
  translate([-tischBreite/2-19+9, -tiefe/2+30,  -48]) 
  {
    hdt3m9_40();
    translate([0,0,-64]) Stepper();
    
    stepperLoecher() translate([0,0,2]) rotate([180,0,0]) M3(8);
    translate([0,0,-4]) halterungZMotor();
    
    translate([-50, 10-22,-1]) rotate([180,0,0]) M6(8);
    translate([-50,-10+22,-1]) rotate([180,0,0]) M6(8);
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
tisch(200); // 445
translate([0,0,hoehe+profil+10])
{
  translate([-breite/2-125,-tiefe/2-26,-33+2.5]) 
  {
    Stepper();
    translate([0,0,63]) hdt3m9_14();
    
    *translate([30,-20,33]) cube([1,1,27]);
    
    translate([0,0,60]) halterungXMotor();
    translate([23,-22,33-2.5]) abstandshalterXMotor();
    
    stepperLoecher() translate([0,0,66]) rotate([180,0,0]) M3(8);
    
    translate([33,-12,65]) rotate([180,0,0]) M6(39);
    translate([33, 12,65]) rotate([180,0,0]) M6(39);
  }

  translate([-80,0,0]) XYEinheit(x, y);
}

korpus();


*#translate([-breite/2, -tiefe/2-profil, -150])  cube([10,10,130]);
*#translate([-breite/2, -tiefe/2-profil, 0])  cube([10,10,500]);
*#translate([-breite/2-profil, -tiefe/2, -150])  cube([10,10,78]);