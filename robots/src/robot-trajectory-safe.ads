with Generic_Resources_Pool;

with Site;
with Site.Places_Path;

use Site, Site.Places_Path;

package Robot.Trajectory.Safe is
   type Safe_Object is new Object with private;

   overriding function Open (From: in Site.Input_Places; To: in Site.Output_Places; Speed: in float) return Safe_Object;
   overriding procedure Next (Trajectory: in out Safe_Object; dt: in Float);
   overriding procedure Close (Trajectory: in out Safe_Object);
private
   type Safe_Object is new Object with record
      Places: Places_Path.Object;
   end record;

   package Resources_Pool is new Generic_Resources_Pool(Site.Place_Names);
end Robot.Trajectory.Safe;
