package body Mail_Box is
   protected body Object is
      procedure Shift (I: in out Positive) is
      begin
         if I = Size then
            I := 1;
         else
            I := I + 1;
         end if;
      end;

      entry Put(M: in Message) when Count /= Size is
      begin
         Shift(Last);
         Content(Last) := M;
         Count := Count + 1;
      end;

      entry Get(M: out Message) when Count > 0 is
      begin
         M := Content(First);
         Shift(First);
         Count := Count - 1;
      end;
   end;

end Mail_Box;
