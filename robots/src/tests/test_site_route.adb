with Adagraph;
with Robot;
with Site;

use Adagraph, Robot, Site;

procedure Test_Site_Route is
   R1: Robot.Object(Id => 1, Mail => Robot.Mail, Color => Blue);
   R2: Robot.Object(Id => 2, Mail => Robot.Mail, Color => Red);
   R3: Robot.Object(Id => 3, Mail => Robot.Mail, Color => Green);
begin
   Safely.Create_Window;
   Safely.Clear_Window;
   Safely.Draw_Site;
   Safely.Draw_Places;


   Safely.Draw_Path(P     => Site.Route(From => I3,
                                        To   => O6),
                    Color => Blue);
   Safely.Draw_Path(P     => Site.Route(From => I2,
                                        To   => O1),
                    Color => Red);
   Safely.Draw_Path(P     => Site.Route(From => I1,
                                        To   => O5),
                    Color => Green);

   delay 5.0;
   R1.Go(From => I3,
        To   => O6);
   delay 1.0;
   R2.Go(From => I2,
        To   => O1);
   delay 1.0;
   R3.Go(From => I1,
        To   => O5);
   delay 1.0;

   R1.Shutdown;
   R2.Shutdown;
   R3.Shutdown;
end;
