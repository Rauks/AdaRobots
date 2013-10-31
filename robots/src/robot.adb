with Robot.Trajectory.Safe;

use Robot.Trajectory.Safe;

package body Robot is

   task body Object is
      Ready: Boolean := True;
      RobotRoute: Trajectory.Safe.Safe_Object;
      F: Site.Input_Places;
      T: Site.Output_Places;
   begin
      loop
         select
            when Ready =>
               accept Go (From: in Site.Input_Places; To: in Site.Output_Places) do
                     Ready := False;
                     F := From;
                     T := To;
               end;
               RobotRoute := Open(F, T, Speed);
               Site.Safely.Draw_Path(P     => Route(RobotRoute),
                                     Color => Color);
               Site.Safely.Draw_Robot(X     => Integer(X(RobotRoute)),
                                      Y     => Integer(Y(RobotRoute)),
                                      Color => Color);
               while not At_End(RobotRoute) loop
                  delay Dt;
                  Site.Safely.Hide_Robot(X     => Integer(X(RobotRoute)),
                                         Y     => Integer(Y(RobotRoute)));
                  Next(RobotRoute, Float(Dt));
                  Site.Safely.Draw_Robot(X     => Integer(X(RobotRoute)),
                                         Y     => Integer(Y(RobotRoute)),
                                         Color => Color);
               end loop;
               delay Dt;
               Site.Safely.Hide_Robot(X     => Integer(X(RobotRoute)),
                                      Y     => Integer(Y(RobotRoute)));
               Close(RobotRoute);

               Ready := True;

               Mail.Put(Id);
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
