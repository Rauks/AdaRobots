with Site.Places_Path;

use Site.Places_Path;

package body Robot.Trajectory.Safe is
   function Open (From: in Site.Input_Places; To: in Site.Output_Places; Speed: in float) return Safe_Object is
      Trajectory: Object;
      Trajectory_Safe: Safe_Object;
      Request: Resources_Pool.Request_Map;
      P: Site.Places_Path.Object;
   begin
      P := Places_Path.Open(From, To);
      while not Places_Path.At_End(P) loop
         Request(Places_Path.Value(P)) := True;
         Places_Path.Next(P);
      end loop;

      Resources_Pool.Acquire(Map => Request);

      Places_Path.Reset(P);

      Trajectory := Open(From, To, Speed);
      Trajectory_Safe := (Trajectory with Places => P);

      return Trajectory_Safe;
   end;

   procedure Next (Trajectory: in out Safe_Object; dt: in Float) is
      In_Target, In_Target_Again: Boolean;
      Target: Place_Names := Places_Path.Value(Trajectory.Places);
      Was_X: Float := Trajectory.X;
      Was_Y: Float := Trajectory.Y;
   begin
      Next(Object(Trajectory), dt);

      In_Target := Site.Robot_Intersect(Target, Was_X, Was_Y);
      In_Target_Again := Site.Robot_Intersect(Target, Trajectory.X, Trajectory.Y);

      if In_Target and not In_Target_Again then
         Resources_Pool.Release(Target);
         Places_Path.Next(Trajectory.Places);
      end if;
   end;

   procedure Close (Trajectory: in out Safe_Object) is
   begin
      Resources_Pool.Release(Places_Path.Value(Trajectory.Places));
      Places_Path.Close(Trajectory.Places);
   end;

end Robot.Trajectory.Safe;
