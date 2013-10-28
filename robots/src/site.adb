package body Site is
   function Way_In (From: Input_Places) return Ring_Places is
   begin
      case From is
         when I1 =>
            return R1;
         when I2 =>
            return R2;
         when I3 =>
            return R3;
         when I4 =>
            return R4;
         when I5 =>
            return R5;
         when I6 =>
            return R6;
      end case;
   end;

   function Next (Place: Ring_Places) return Ring_Places is
   begin
      case Place is
         when R1 =>
            return R2;
         when R2 =>
            return R3;
         when R3 =>
            return R4;
         when R4 =>
            return R5;
         when R5 =>
            return R6;
         when R6 =>
            return R1;
      end case;
   end;

   function Previous (Place: Ring_Places) return Ring_Places is
   begin
      case Place is
         when R1 =>
            return R6;
         when R2 =>
            return R1;
         when R3 =>
            return R2;
         when R4 =>
            return R3;
         when R5 =>
            return R4;
         when R6 =>
            return R5;
      end case;
   end;

   function Way_Out (To: Output_Places) return Ring_Places is
   begin
      case To is
         when O1 =>
            return R1;
         when O2 =>
            return R2;
         when O3 =>
            return R3;
         when O4 =>
            return R4;
         when O5 =>
            return R5;
         when O6 =>
            return R6;
      end case;
   end;

   function Opposite (Place: Ring_Places) return Ring_Places is
   begin
      case Place is
         when R1 =>
            return R4;
         when R2 =>
            return R5;
         when R3 =>
            return R6;
         when R4 =>
            return R1;
         when R5 =>
            return R2;
         when R6 =>
            return R3;
      end case;
   end;

end Site;
