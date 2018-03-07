module M2( laenge )
{
  color("silver")
  {
    difference()
    {
      cylinder(d=3.7, h=2, $fn=100);  
    
      translate([0,0,-1]) cylinder( d= 1.5, h=2.8, $fn=6 );
    }
    translate([0,0,2])cylinder(d=2,h=laenge,$fn=100);
  }  
}

module M2Mutter()
{
  color("silver")
  {
    difference()
    {
      cylinder(d=4.5, h= 1.6, $fn=6);
      
      translate([0,0,-1]) cylinder(d=2, h=4, $fn=100);
    }
  }
}

module M2_5( laenge )
{
  color("silver")
  {
    difference()
    {
      cylinder(d=4.5, h=2.5,$fn=100);  
    
      translate([0,0,-1]) cylinder( d= 2, h=2.8, $fn=6 );
    }
    translate([0,0,2.5])cylinder(d=2.5,h=laenge,$fn=100);
  }
}

module M2_5Mutter()
{
  color("silver")
  {
    difference()
    {
      cylinder(d=5.5, h= 2, $fn=6);
      
      translate([0,0,-1]) cylinder(d=2.2, h=4, $fn=100);
    }
  }
}

module M3( laenge )
{
  color("silver")
  {
    difference()
    {
      cylinder(d=5.5,h=3,$fn=100);  
    
      translate([0,0,-1]) cylinder( d= 2.5, h=2.8, $fn=6 );
    }
    translate([0,0,3])cylinder(d=3,h=laenge,$fn=100);
  }
}

module M3SK( laenge )
{
  color("silver")
  {
    difference()
    {
      cylinder(d1=6,d2=3,h=2.5,$fn=100);  
    
      translate([0,0,-1]) cylinder( d= 2.2, h=2.8, $fn=6 );
    }
    translate([0,0,2.5])cylinder(d=3,h=laenge-2.5,$fn=100);
  }
}

module M3Mutter()
{
  color("silver")
  {
    difference()
    {
      cylinder(d=6, h= 2.3, $fn=6);
      
      translate([0,0,-1]) cylinder(d=3, h=4, $fn=100);
    }
  }
}

module M5( length )
{
  color("silver")
  {
    difference()
    {
      translate([0,0,-5]) cylinder( d= 9, h=5, $fn=100 );
    
      translate([0,0,-6]) cylinder( d= 4.6, h=5.25, $fn=6 );
    }
    
    cylinder( d= 5, h=length, $fn=100 );
  }
}

module M5Mutter()
{
  color("silver")
  {
    difference()
    {
      cylinder(d=9, h= 4, $fn=6);
      
      translate([0,0,-1]) cylinder(d=5, h=6, $fn=100);
    }
  }
}

module M6( length )
{
  color("silver")
  {
    difference()
    {
      translate([0,0,-6]) cylinder( d= 9.8, h=6, $fn=100 );
    
      translate([0,0,-7]) cylinder( d= 5.6, h=5.25, $fn=6 );
    }
    
     cylinder( d= 6, h=length, $fn=100 );
  }
}

module M6Mutter()
{
  color("silver")
  {
    difference()
    {
      cylinder(d=11.3, h= 4.8, $fn=6);
      
      translate([0,0,-1]) cylinder(d=6, h=6, $fn=100);
    }
  }
}
