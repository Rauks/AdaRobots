with Robot.Trajectory;

use Robot.Trajectory;

package body Robot is
   task body Object is
      Ready: Boolean := True;
      RobotRoute: Trajectory.Object;
   begin
      loop
         select
            when Ready =>
               accept Go (From: in Site.Input_Places; To: in Site.Output_Places) do
                  Ready := False;
                  Trajectory.Open(RobotRoute, From, To, Speed);
               end;
               Site.Safely.Draw_Path(P     => Trajectory.Route(RobotRoute),
                                     Color => Color);
               Site.Safely.Draw_Robot(X     => Integer(Trajectory.X(RobotRoute)),
                                      Y     => Integer(Trajectory.Y(RobotRoute)),
                                      Color => Color);
               while not Trajectory.At_End(RobotRoute) loop
                  delay Dt;
                  Site.Safely.Hide_Robot(X     => Integer(Trajectory.X(RobotRoute)),
                                         Y     => Integer(Trajectory.Y(RobotRoute)));
                  Trajectory.Next(RobotRoute, Float(Dt));
                  Site.Safely.Draw_Robot(X     => Integer(Trajectory.X(RobotRoute)),
                                         Y     => Integer(Trajectory.Y(RobotRoute)),
                                         Color => Color);
               end loop;
               delay Dt;
               Site.Safely.Hide_Robot(X     => Integer(Trajectory.X(RobotRoute)),
                                      Y     => Integer(Trajectory.Y(RobotRoute)));
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
