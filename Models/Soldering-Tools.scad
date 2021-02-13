include <../Libs/Commons.scad>

$fn               = 400   ;

plate             =  2.0  ;
platenLength      = 58.0  ;
platenInnerRadius =  8.5  ;
platenOuterRadius = 29.0  ;
platenThickness   =  1.5  ;

havingWireRoller  = false ;
havingRollerStick = false ;
havingStickRing   = false ;
havingFrontFence  = false ;
havingPlatenStick = true  ;
havingPlatenDish  = false ;

translate ( [ 0 , 0 , 0 ] )
{
  union ( ) {
    if ( havingWireRoller ) {
      translate ( [ 0 , 0 , 0 ] ) {
        pens_holder_wire_roller ( ) ;
      } ;
    } ;
    if ( havingRollerStick ) {
      translate ( [ 0 , 0 , 0 ] ) {
        pens_holder_roller_stick ( ) ;
      } ;
    } ;
    if ( havingStickRing ) {
      translate ( [ 0 , 0 , 0 ] ) {
        pens_holder_stick_ring ( ) ;
      } ;
    } ;
    if ( havingFrontFence ) {
      translate ( [ 0 , 0 , 0 ] ) {
        pens_holder_front_fence ( ) ;
      } ;
    } ;
    if ( havingPlatenStick ) {
      translate ( [ 0 , 0 , 0 ] ) {
        wire_roller_platen_stick ( platenLength , platenInnerRadius , platenThickness ) ;
      } ;
    } ;
    if ( havingPlatenDish ) {
      translate ( [ 0 , 0 , 0 ] ) {
        wire_roller_platen_stick (
          platenThickness ,
          platenInnerRadius + platenThickness + 0.10 ,
          platenOuterRadius - platenInnerRadius - platenThickness - 0.10 ) ;
      } ;
    } ;
  } ;
}

module pens_holder_wire_roller ()
{
  dw = 65.0 ;
  difference ( ) {
    union ( ) {
      translate ( [  0.0 , 0.0 , 0.0 ] ) {
        cube ( size = [ dw , dw , plate ] ) ;
      } ;
      translate ( [  0.0 , 0.0 , 0.0 ] ) {
        cube ( size = [ plate , dw , dw ] ) ;
      } ;
      translate ( [  dw - plate , 0.0 , 0.0 ] ) {
        cube ( size = [ plate , dw , dw ] ) ;
      } ;
      translate ( [  0.0 , dw - plate , 0.0 ] ) {
        cube ( size = [ dw , plate , dw ] ) ;
      } ;
      translate ( [ 0.1 , 0.0 , dw + 3.0 ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          rotate ( a = 270 , v = [ 1 , 0 , 0 ] ) {
            wire_roller_side_upper_fixer ( dw ) ;
          } ;
        } ;
      } ;
      translate ( [ dw - 0.1 , dw , dw + 3.0 ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          rotate ( a = 90 , v = [ 1 , 0 , 0 ] ) {
            wire_roller_side_upper_fixer ( dw ) ;
          } ;
        } ;
      } ;
      translate ( [ 0.0 , dw - 0.1 , dw + 3.0 ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          wire_roller_side_upper_fixer ( dw ) ;
        } ;
      } ;
    } ;
    union ( ) {
      translate ( [  -10.0 , ( dw / 2.0 ) , ( dw / 2.0 ) + 7.0 ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          cylinder ( r = 6.0 , h = dw + 20.0 ) ;
        } ;
      } ;
      translate ( [  -10.0 , ( dw / 2.0 ) - 6.0 , ( dw / 2.0 ) + 7.0 ] ) {
        cube ( size = [ dw + 20.0 , 12.0 , dw ] ) ;
      } ;
      translate ( [  -10.0 , 5.0 , dw - 10.0 ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          cylinder ( r = 2.0 , h = dw + 20.0 ) ;
        } ;
      } ;
      translate ( [  10.0 , -10.0 , -10.0 ] ) {
//        cube ( size = [ dw - 20.0 , dw , dw ] ) ;
      } ;
      translate ( [  10.0 , dw -10.0 , 10.0 ] ) {
//        cube ( size = [ dw - 20.0 , dw , dw ] ) ;
      } ;
      translate ( [  -1.0 ,  -1.0 , dw ] ) {
        cube ( size = [ dw + 2.0 , dw + 2.0 , dw ] ) ;
      } ;
      translate ( [  -10.1 ,  20.0 , ( dw / 2.0 ) ] ) {
        cube ( size = [ 10.0 , 25.0 , dw ] ) ;
      } ;
      translate ( [  dw + 0.1 ,  20.0 , ( dw / 2.0 ) ] ) {
        cube ( size = [ 10.0 , 25.0 , dw ] ) ;
      } ;
    } ;
  } ;
}

module wire_roller_side_upper_fixer ( length ) {
  linear_extrude ( height = length ) {
    polygon ( points = [
        [  0.0 ,  0.0 ] ,
        [ 10.0 ,  0.0 ] ,
        [  8.0 ,  5.0 ] ,
        [  0.0 ,  5.0 ] ,
        [  0.0 ,  0.0 ] ,
      ] ,
      convexity = 1 ) ;
  } ;
}

module pens_holder_roller_stick ()
{
  inner_height = 75.0 ;
  outer_height = 50.0 ;
  difference ( ) {
    union ( ) {
      translate ( [  0.0 , 0.0 , 0.0 ] ) {
        cylinder ( r = 5.0 , h = inner_height ) ;
      } ;
      translate ( [  0.0 , 0.0 , ( inner_height - outer_height ) / 2.0 ] ) {
//        cylinder ( r = 5.0 , h = outer_height ) ;
      } ;
    } ;
    union ( ) {
    } ;
  } ;
}

module pens_holder_stick_ring ()
{
  inner_height = 4.0 ;
  difference ( ) {
    translate ( [  0.0 , 0.0 , 0.0 ] ) {
      cylinder ( r = 8.0 , h = inner_height ) ;
    } ;
    translate ( [  0.0 , 0.0 , -10.0 ] ) {
      cylinder ( r = 5.1 , h = inner_height + 20.0 ) ;
    } ;
  } ;
}

module pens_holder_front_fence ()
{
  dw = 65.0 ;
  dh = 19.5 ;
  ds =  5.5 ;
  difference ( ) {
    union ( ) {
      translate ( [  0.0 ,  0.0 , 0.0 ] ) {
        cube ( size = [ dw , dh , plate ] ) ;
      } ;
      translate ( [  plate + 1.5 , 5.0 , 0.0 ] ) {
        cube ( size = [ dw - ( ( plate + 1.5 ) * 2 ) , plate , plate + ds - 1.0 ] ) ;
      } ;
      translate ( [ 0.0 , 6.0 , plate + ds ] ) {
        rotate ( a = 90 , v = [ 0 , 1 , 0 ] ) {
          cylinder ( r = 1.8 , h = dw ) ;
        } ;
      } ;
      translate ( [ 0.0 , 5.0 , plate - 0.1 ] ) {
        cube ( size = [ 1.0 , plate , ds + 0.1 ] ) ;
      } ;
      translate ( [ dw - 1.0 , 5.0 , plate - 0.1 ] ) {
        cube ( size = [ 1.0 , plate , ds + 0.1 ] ) ;
      } ;
    } ;
    union ( ) {
      translate ( [ ( dw / 2.0 ) , 11.0 , -10.0 ] ) {
        cylinder ( r = 2.5 , h = 20.0 ) ;
      } ;
    } ;
  } ;
}

module wire_roller_platen_stick ( height , inner_radius , thickness )
{
  outer_radius = inner_radius + thickness ;
  difference ( ) {
    union ( ) {
      translate ( [ 0 , 0 , 0 ] ) {
        cylinder ( r = outer_radius , h = height ) ;
      } ;
    } ;
    union ( ) {
      translate ( [ 0 , 0 , -1.0 ] ) {
        cylinder ( r = inner_radius , h = height + 2.0 ) ;
      } ;
    } ;
  } ;
}
