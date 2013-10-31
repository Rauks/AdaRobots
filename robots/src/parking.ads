with Agency;
with Robot;

use Robot, Agency;

package Parking is
   Size: constant Positive := Agency.Robots'Size;

   type Places is array (Positive range <>) of Robot_Id;

   protected Object is
      entry Take (Id: out Robot_Id);
      entry Park (Id: in Robot_Id);
   private
      Content: Places (1..Size);
      First: Positive := 1;
      Last: Positive := Size;
      Count: Natural := 0;
   end Object;
end Parking;
