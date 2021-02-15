$fn               = 400   ;

plate             =  2.0  ;

havingMagnifierHolder = true ;

translate ( [ 0 , 0 , 0 ] )
{
  union ( ) {
    if ( havingMagnifierHolder ) {
      translate ( [ 0 , 0 , 0 ] ) {
        soldering_tool_magnifier_holder ( ) ;
      } ;
    } ;
  } ;
}

module soldering_tool_magnifier_holder ()
{
  width = 100.0 ;
  length = 30.0 ;
  difference ( ) {
    union ( ) {
      translate ( [ 0 , 0 , 0 ] ) {
        cube ( size = [ width , length , plate ] ) ;
      } ;
    } ;
  } ;
}
