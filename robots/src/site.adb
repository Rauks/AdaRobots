with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

use Ada.Numerics, Ada.Numerics.Elementary_Functions;

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

   function X (Place: Ring_Places) return Float is
   begin
      case Place is
         when R1 =>
            return Scale * Cos (Pi/6.0);
         when R2 =>
            return 0.0;
         when R3 =>
            return Scale * Cos (5.0 * Pi/6.0);
         when R4 =>
            return Scale * Cos (-5.0 * Pi/6.0);
         when R5 =>
            return 0.0;
         when R6 =>
            return Scale * Cos (-Pi/6.0);
      end case;
   end;

   function Y (Place: Ring_Places) return Float is
   begin
      case Place is
         when R1 =>
            return Scale * Sin (Pi/6.0);
         when R2 =>
            return Scale;
         when R3 =>
            return Scale * Sin (5.0 * Pi/6.0);
         when R4 =>
            return Scale * Sin (-5.0 * Pi/6.0);
         when R5 =>
            return -Scale;
         when R6 =>
            return Scale * Sin (-Pi/6.0);
      end case;
   end;


   protected body Safely is
      procedure Create_Window is
         X_Max, Y_Max: Integer;
         X_Char, Y_Char: Integer;
      begin
         Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
         Adagraph.Set_Window_Title("Robots");
      end;

      procedure Clear_Window is
      begin
         Adagraph.Clear_Window;
      end;

      procedure Destroy_Window is
      begin
         Adagraph.Destroy_Graph_Window;
      end;

      procedure Draw_Site is
      begin
         for Place in Ring_Places loop
            Adagraph.Draw_Circle(X      => 400 + Integer(X(Place)),
                                 Y      => 300 + Integer(Y(Place)),
                                 Radius => 10,
                                 Hue    => White,
                                 Filled => Fill);
         end loop;

      end;

      procedure Draw_Path (P: in Path.Object) is
      begin
         null;
      end;

      procedure Draw_Robot (X: in Integer; Y: in Integer; Hue: in Color_Type) is
      begin
         null;
      end;

      procedure Hide_Robot (X: in Integer; Y: in Integer) is
      begin
         null;
      end;
   end Safely;
end Site;
