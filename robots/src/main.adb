with Ada.Numerics.Discrete_Random;

with Agency;
with Site;

use Agency, Site;

procedure Main is
   package Mission_Inputs is new Ada.Numerics.Discrete_Random(Site.Input_Places);
   package Mission_Outputs is new Ada.Numerics.Discrete_Random(Site.Output_Places);

   Input_Generator: Mission_Inputs.Generator;
   Output_Generator: Mission_Outputs.Generator;
begin
   Safely.Create_Window;
   Safely.Clear_Window;
   Safely.Draw_Site;
   Safely.Draw_Parking;

   Mission_Inputs.Reset(Input_Generator);
   Mission_Outputs.Reset(Output_Generator);

   loop
      Agency.Handle_Transfert(From => Mission_Inputs.Random(Input_Generator),
                              To   => Mission_Outputs.Random(Output_Generator));
   end loop;

end;
