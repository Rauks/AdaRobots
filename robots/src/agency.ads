with Adagraph;
with Robot;
with Site;

use Adagraph, Robot, Site;

package Agency is
   type Robot_Ref is access Robot.Object;
   type Robot_Array is array (Robot_Id range <>) of Robot_Ref;

   Robots: constant Robot_Array := (new Robot.Object(Id => 1,
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

   procedure Handle_Transfert(From: in Place_Names; To: in Place_Names);

   task Mission_Listener;
end Agency;
