with Adagraph;
with Robot;

use Adagraph, Robot;

package Agency is
   type Robot_Ref is access Robot.Object;
   type Robot_Array is array (Natural range <>) of Robot_Ref;

   Robots: Robot_Array := (new Robot.Object(Id => 1,
                                            Mail => Robot.Mail,
                                            Color => Blue),
                           new Robot.Object(Id => 2,
                                            Mail => Robot.Mail,
                                            Color => Red),
                           new Robot.Object(Id => 3,
                                            Mail => Robot.Mail,
                                            Color => Green),
                           new Robot.Object(Id => 4,
                                            Mail => Robot.Mail,
                                            Color => Yellow),
                           new Robot.Object(Id => 5,
                                            Mail => Robot.Mail,
                                            Color => Brown),
                           new Robot.Object(Id => 6,
                                            Mail => Robot.Mail,
                                            Color => Cyan));
end Agency;
