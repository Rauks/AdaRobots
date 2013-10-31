with Robot;

use Robot;

package Parking is
   type Places is array (Positive range <>) of Robot_Id;

   protected type Object(Size: Positive) is
      entry Take (Id: out Robot_Id);
      entry Park (Id: in Robot_Id);
   private
      Content: Places (1..Size);
      First: Positive := 1;
      Last: Positive := Size;
      Count: Natural := 0;
   end Object;
   type Ref is access Object;

end Parking;
