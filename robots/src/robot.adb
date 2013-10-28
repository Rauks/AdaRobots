with Robot.Trajectory;

use Robot.Trajectory;

package body Robot is
   task body Object is
      Ready: Boolean := True;
      RobotRoute: Trajectory.Object;

      Speed: Float := 75.0;
      dt: Duration := 0.05;
   begin
      loop
         select
            when Ready =>
               accept Follow (P: in Path.Object) do
                  Ready := False;
                  Trajectory.Open(RobotRoute, P, Speed);
               end;
               while not Trajectory.At_End(RobotRoute) loop
                  Adagraph.Draw_Circle(X      => Integer(Trajectory.X(RobotRoute)),
                                       Y      => Integer(Trajectory.Y(RobotRoute)),
                                       Radius => 20,
                                       Hue    => Color);
                  delay dt;
                  Trajectory.Next(RobotRoute, Float(dt));
               end loop;
               Trajectory.Close(RobotRoute);

               Ready := True;
         or
            when Ready =>
               accept Shutdown do
                  Ready := False;
               end;
               exit;
         or delay 1.0;
         end select;
      end loop;
   end;

end Robot;
