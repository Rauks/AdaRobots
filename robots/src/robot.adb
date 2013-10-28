package body Robot is
   task body Object is
      Ready: Boolean := True;
      RobotPath: Path.Object;

      K: Float := 0.0;
      dK: Float := 0.1;
      dt: Duration := 0.05;
   begin
      loop
         select
            when Ready =>
               accept Follow (P: in Path.Object) do
                  Ready := False;
                  RobotPath := P;
               end;
               for Segment in 1..Segment_Count(RobotPath) loop
                  K:= 0.0;
                  while K <= 1.0 loop
                     Adagraph.Draw_Circle (Integer(X(RobotPath, Segment, K)), Integer(Y(RobotPath, Segment, K)), 20);
                     K := K + dK;
                     delay dt;
                  end loop;
               end loop;

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
