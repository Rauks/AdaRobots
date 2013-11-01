with Robot.Trajectory.Safe;

use Robot.Trajectory.Safe;

package body Robot is

   task body Object is
      Ready: Boolean := True;
      Needed: Boolean := True;
      RobotRoute: Trajectory.Safe.Safe_Object;
      F: Site.Input_Places;
      T: Site.Output_Places;
      Was_X, Was_Y: Float;
      Path_Drawed: Boolean := False;
   begin
      Site.Safely.Draw_Robot_Parking(Positive(Id), Color);
      Mail.Put(Id);
      while Needed loop
         select
            when Ready =>
               accept Go (From: in Site.Input_Places; To: in Site.Output_Places) do
                  Ready := False;
                  Path_Drawed := False;
                  F := From;
                  T := To;
               end;
               RobotRoute := Open(F, T, Speed);
               Site.Safely.Hide_Robot_Parking(Positive(Id));
               Site.Safely.Draw_Robot(X     => Integer(X(RobotRoute)),
                                      Y     => Integer(Y(RobotRoute)),
                                      Color => Color);
               while not At_End(RobotRoute) loop
                  delay Dt;
                  Was_X := X(RobotRoute);
                  Was_Y := Y(RobotRoute);

                  Next(RobotRoute, Float(Dt));

                  if not Path_Drawed then
                     Site.Safely.Draw_Path(P     => Route(RobotRoute),
                                           Color => Color);
                     Path_Drawed := True;
                  end if;

                  Site.Safely.Hide_Robot(X     => Integer(Was_X),
                                         Y     => Integer(Was_Y));
                  Site.Safely.Draw_Robot(X     => Integer(X(RobotRoute)),
                                         Y     => Integer(Y(RobotRoute)),
                                         Color => Color);
               end loop;
               delay Dt;
               Site.Safely.Hide_Robot(X     => Integer(X(RobotRoute)),
                                      Y     => Integer(Y(RobotRoute)));
               Site.Safely.Draw_Robot_Parking(Positive(Id), Color);
               Close(RobotRoute);

               Ready := True;

               Mail.Put(Id);
         or
            accept Shutdown do
               Ready := False;
               Needed := False;
            end;
         or delay 1.0;
         end select;
      end loop;
   end;

end Robot;
