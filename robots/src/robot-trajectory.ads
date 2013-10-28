with Path;

use Path;

private package Robot.Trajectory is
   type Object is tagged private;
   function Route (Trajectory: in Object) return Path.Object;
   procedure Open (Trajectory: in out Object; Route: in Path.Object; Speed: in float);
   function X (Trajectory: in Object) return Float;
   function Y (Trajectory: in Object) return Float;
   procedure Next (Trajectory: in out Object; dt: in Float);
   function At_End (Trajectory: in Object) return Boolean;
   procedure Close (Trajectory: in out Object);
private
   type Object is tagged record
      Route: Path.Object;
      Speed: Float;
      Segment: Positive;
      K: Float;
   end record;

end Robot.Trajectory;
