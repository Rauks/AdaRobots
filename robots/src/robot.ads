with Mail_Box;

with Adagraph;
with Path;
with Site;

use Adagraph, Path, Site;

package Robot is
   Size_Mail: constant Positive := 10;

   Speed: constant Float := 75.0;
   Dt: constant Duration := 0.05;

   type Robot_Id is new Positive;
   package Robot_Mail is new Mail_Box(Robot_Id);

   Mail: Robot_Mail.Ref := new Robot_Mail.Object(Size_Mail);

   task type Object (Id: Robot_Id; Mail: Robot_Mail.Ref; Color: Color_Type) is
      entry Go (From: in Site.Input_Places; To: in Site.Output_Places);
      entry Shutdown;
   end Object;

end Robot;
