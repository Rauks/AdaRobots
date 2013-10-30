package body Robot.Trajectory is
   function Route (Trajectory: in Object) return Path.Object is
   begin
      return Trajectory.Route;
   end;

   function Open (From: in Site.Input_Places; To: in Site.Output_Places; Speed: in float) return Object is
      Trajectory: Object;
   begin
      Trajectory.Route := Site.Route(From, To);
      Trajectory.Speed := Speed;
      Trajectory.Segment := 1;
      Trajectory.K := 0.0;
      return Trajectory;
   end;

   function X (Trajectory: in Object) return Float is
   begin
      return Path.X(Path => Trajectory.Route,
                    Segment => Trajectory.Segment,
                    K => Trajectory.K);
   end;

   function Y (Trajectory: in Object) return Float is
   begin
      return Path.Y(Path => Trajectory.Route,
                    Segment => Trajectory.Segment,
                    K => Trajectory.K);
   end;

   procedure Next (Trajectory: in out Object; dt: in Float) is
      dK: Float;
   begin
      if Trajectory.K = 1.0 then
         Trajectory.K := 0.0;
         Trajectory.Segment := Trajectory.Segment + 1;
      end if;

      dK := (Trajectory.Speed / Path.Segment_Length(Trajectory.Route, Trajectory.Segment)) * dt;
      Trajectory.K := Trajectory.K + dK;

      if Trajectory.K > 1.0 then
         Trajectory.K := 1.0;
      end if;
   end;

   function At_End (Trajectory: in Object) return Boolean is
   begin
      return (Trajectory.K = 1.0) and (Trajectory.Segment = Path.Segment_Count(Trajectory.Route));
   end;

   procedure Close (Trajectory: in out Object) is
   begin
      null;
   end;

end Robot.Trajectory;
