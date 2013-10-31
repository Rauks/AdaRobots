with Ada.Numerics.Discrete_Random;

with Ada.Text_IO;
with Adagraph;
with Robot;
with Site;

use Ada.Text_IO, Adagraph, Robot, Site;

procedure Test_Missions is
   type Robot_Ref is access Robot.Object;
   type Robots is array (Natural range <>) of Robot_Ref;
   package Mission_Inputs is new Ada.Numerics.Discrete_Random(Site.Input_Places);
   package Mission_Outputs is new Ada.Numerics.Discrete_Random(Site.Output_Places);

   Input_Generator: Mission_Inputs.Generator;
   Output_Generator: Mission_Outputs.Generator;

   R1: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Blue);
   R2: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Red);
   R3: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Green);
   R4: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Yellow);
   R5: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Brown);
   R6: Robot_Ref := new Robot.Object(Id => 1, Mail => Robot.Mail, Color => Cyan);
   Rs: Robots := (R1, R2, R3, R4, R5, R6);
begin
   Safely.Create_Window;
   Safely.Clear_Window;
   Safely.Draw_Site;

   Mission_Inputs.Reset(Input_Generator, 345);
   Mission_Outputs.Reset(Output_Generator, 543);

   --Will block after 2 missions (Robots mailbox full)
   while True loop
      for Index in Rs'Range loop
         select
            Rs(Index).Go(From => Mission_Inputs.Random(Input_Generator),
                         To   => Mission_Outputs.Random(Output_Generator));
            Ada.Text_IO.Put_Line ("Robot " & Integer'Image(Index) & " launched.");
         or
            delay 0.5;
         end select;
      end loop;
   end loop;

end Test_Missions;
