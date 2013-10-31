with Adagraph;
with Mail_Box;
with Path;
with Site;

use Adagraph, Path, Site;

package Robot is
   Speed: constant Float := 75.0;
   Dt: constant Duration := 0.05;

   type Robot_Id is new Positive;
   package Robot_Mail is new Mail_Box(Robot_Id);

   Mail: Robot_Mail.Ref := new Robot_Mail.Object(6);

   task type Object (Id: Robot_Id; Mail: Robot_Mail.Ref; Color: Color_Type) is
      entry Go (From: in Site.Input_Places; To: in Site.Output_Places);
      entry Shutdown;
   end Object;

end Robot;
