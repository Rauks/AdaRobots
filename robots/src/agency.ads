with Adagraph;
with Robot;

use Adagraph, Robot;

package Agency is
   type Robot_Ref is access Robot.Object;
   type Robot_Array is array (Natural range <>) of Robot_Ref;

   Robots: Robot_Array := (new Robot.Object(Color => Blue),
                  new Robot.Object(Color => Red),
                  new Robot.Object(Color => Green),
                  new Robot.Object(Color => Yellow),
                  new Robot.Object(Color => Brown),
                  new Robot.Object(Color => Cyan));
end Agency;
