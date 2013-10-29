with Adagraph;
with Path;
with Site;

use Adagraph, Path, Site;

package Robot is
   Speed: constant Float := 75.0;
   Dt: constant Duration := 0.05;

   task type Object (Color: Color_Type) is
      entry Go (From: in Site.Input_Places; To: in Site.Output_Places);
      entry Shutdown;
   end Object;

end Robot;
