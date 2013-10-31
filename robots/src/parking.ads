with Robot;

use Robot;

package Parking is
   Parking_Size: constant Positive := 10;

   type Places is array (Positive range <>) of Robot_Id;

   protected Object is
      entry Take (Id: out Robot_Id);
      entry Park (Id: in Robot_Id);
   private
      Content: Places (1..Parking_Size);
      First: Positive := 1;
      Last: Positive := Parking_Size;
      Count: Natural := 0;
   end Object;
end Parking;
