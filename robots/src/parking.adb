package body Parking is
   protected body Object is
      procedure Shift (I: in out Positive) is
      begin
         if I = Parking_Size then
            I := 1;
         else
            I := I + 1;
         end if;
      end;

      entry Take (Id: out Robot_Id) when Count > 0 is
      begin
         Id := Content(First);
         Shift(First);
         Count := Count - 1;
      end;

      entry Park(Id: in Robot_Id) when Count /= Parking_Size is
      begin
         Shift(Last);
         Content(Last) := Id;
         Count := Count + 1;
      end;

   end;

end Parking;
