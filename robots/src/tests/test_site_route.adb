with Adagraph;
with Site;

use Adagraph, Site;

procedure Test_Site_Route is
begin
   Safely.Create_Window;
   Safely.Clear_Window;
   Safely.Draw_Site;
   Safely.Draw_Places;

   Safely.Draw_Path(P     => Site.Route(From => I3,
                                        To   => O6),
                    Color => Light_Magenta);
   Safely.Draw_Path(P     => Site.Route(From => I2,
                                        To   => O1),
                    Color => Light_Cyan);
   Safely.Draw_Path(P     => Site.Route(From => I1,
                                        To   => O5),
                    Color => Light_Green);
end;
