with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

use Ada.Numerics, Ada.Numerics.Elementary_Functions;

package body Site is
   function Way_In (From: in Input_Places) return Ring_Places is
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

   function Next (Place: in Ring_Places) return Ring_Places is
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

   function Previous (Place: in Ring_Places) return Ring_Places is
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

   function Way_Out (To: in Output_Places) return Ring_Places is
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

   function Opposite (Place: in Ring_Places) return Ring_Places is
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

   function X (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
   begin
      case Place is
         when C =>
            return 0.0;
         when R1 =>
            return Scale * Cos (Pi/6.0);
         when R2 =>
            return Scale * Cos (Pi/2.0);
         when R3 =>
            return Scale * Cos (5.0 * Pi/6.0);
         when R4 =>
            return Scale * Cos (-5.0 * Pi/6.0);
         when R5 =>
            return Scale * Cos (-Pi/2.0);
         when R6 =>
            return Scale * Cos (-Pi/6.0);
         when I1 =>
            return X(R1, Scale, Scale_IO) + Scale_IO * Cos (Pi/3.0);
         when I2 =>
            return X(R2, Scale, Scale_IO) + Scale_IO * Cos (2.0 * Pi/3.0);
         when I3 =>
            return X(R3, Scale, Scale_IO) + Scale_IO * Cos (Pi);
         when I4 =>
            return X(R4, Scale, Scale_IO) + Scale_IO * Cos (-2.0 * Pi/3.0);
         when I5 =>
            return X(R5, Scale, Scale_IO) + Scale_IO * Cos (-Pi/3.0);
         when I6 =>
            return X(R6, Scale, Scale_IO) + Scale_IO * Cos (0.0);
         when O1 =>
            return X(R1, Scale, Scale_IO) + Scale_IO * Cos (0.0);
         when O2 =>
            return X(R2, Scale, Scale_IO) + Scale_IO * Cos (Pi/3.0);
         when O3 =>
            return X(R3, Scale, Scale_IO) + Scale_IO * Cos (2.0 * Pi/3.0);
         when O4 =>
            return X(R4, Scale, Scale_IO) + Scale_IO * Cos (Pi);
         when O5 =>
            return X(R5, Scale, Scale_IO) + Scale_IO * Cos (-2.0 * Pi/3.0);
         when O6 =>
            return X(R6, Scale, Scale_IO) + Scale_IO * Cos (-Pi/3.0);
      end case;
   end;

   function Y (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
   begin
      case Place is
         when C =>
            return 0.0;
         when R1 =>
            return -Scale * Sin (Pi/6.0);
         when R2 =>
            return -Scale * Sin (Pi/2.0);
         when R3 =>
            return -Scale * Sin (5.0 * Pi/6.0);
         when R4 =>
            return -Scale * Sin (-5.0 * Pi/6.0);
         when R5 =>
            return -Scale * Sin (-Pi/2.0);
         when R6 =>
            return -Scale * Sin (-Pi/6.0);
         when I1 =>
            return Y(R1, Scale, Scale_IO) - Scale_IO * Sin (Pi/3.0);
         when I2 =>
            return Y(R2, Scale, Scale_IO) - Scale_IO * Sin (2.0 * Pi/3.0);
         when I3 =>
            return Y(R3, Scale, Scale_IO) - Scale_IO * Sin (Pi);
         when I4 =>
            return Y(R4, Scale, Scale_IO) - Scale_IO * Sin (-2.0 * Pi/3.0);
         when I5 =>
            return Y(R5, Scale, Scale_IO) - Scale_IO * Sin (-Pi/3.0);
         when I6 =>
            return Y(R6, Scale, Scale_IO) - Scale_IO * Sin (0.0);
         when O1 =>
            return Y(R1, Scale, Scale_IO) - Scale_IO * Sin (0.0);
         when O2 =>
            return Y(R2, Scale, Scale_IO) - Scale_IO_Default * Sin (Pi/3.0);
         when O3 =>
            return Y(R3, Scale, Scale_IO) - Scale_IO * Sin (2.0 * Pi/3.0);
         when O4 =>
            return Y(R4, Scale, Scale_IO) - Scale_IO * Sin (Pi);
         when O5 =>
            return Y(R5, Scale, Scale_IO) - Scale_IO * Sin (-2.0 * Pi/3.0);
         when O6 =>
            return Y(R6, Scale, Scale_IO) - Scale_IO * Sin (-Pi/3.0);
      end case;
   end;

   protected body Safely is
      procedure Create_Window is
         X_Max, Y_Max: Integer;
         X_Char, Y_Char: Integer;
      begin
         Adagraph.Create_Sized_Graph_Window(2 * Integer(Windows_Center_X), 2 * Integer(Windows_Center_Y), X_max, Y_Max, X_Char, Y_Char);
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
         RouteDelta: Float := 19.0;
         Angle: Float := 0.0;
         AngleT: Float := 0.0;
         Was_X, Was_Y: Integer := 0;
         L: Float := Scale_Default - RouteDelta*Sqrt(3.0);
      begin
         for i in 1..6 loop
            Adagraph.Goto_XY(X => Integer(Windows_Center_X + RouteDelta*Cos(AngleT)),
                             Y => Integer(Windows_Center_Y + RouteDelta*Sin(AngleT)));
            Angle := AngleT - Pi/6.0;
            for j in 1..3 loop
               Adagraph.Draw_To(X   => Adagraph.Where_X + Integer(L*Cos(Angle)),
                                Y   => Adagraph.Where_Y + Integer(L*Sin(Angle)),
                                Hue => Site_Color);
               if j = 1 then
                  Was_X := Adagraph.Where_X;
                  Was_Y := Adagraph.Where_Y;
                  Adagraph.Goto_XY(X => Adagraph.Where_X + Integer(RouteDelta*Cos(Angle + Pi/6.0)),
                                   Y => Adagraph.Where_Y + Integer(RouteDelta*Sin(Angle + Pi/6.0)));
                  Adagraph.Draw_To(X   => Adagraph.Where_X + Integer(L*Cos(Angle + Pi/1.5)),
                                   Y   => Adagraph.Where_Y + Integer(L*Sin(Angle + Pi/1.5)),
                                   Hue => Site_Color);
                  Adagraph.Goto_XY(X => Was_X,
                                   Y => Was_Y);
               end if;
               Angle := Angle + Pi/1.5;
            end loop;
            AngleT := AngleT + Pi/3.0;
         end loop;
      end;

      procedure Draw_Places is
      begin
         for Place in Ring_Places loop
            Adagraph.Draw_Circle(X      => Integer(Windows_Center_X + X(Place)),
                                 Y      => Integer(Windows_Center_Y + Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_R_Color,
                                 Filled => No_Fill);
         end loop;
         Adagraph.Draw_Circle(X      => Integer(Windows_Center_X + X(C)),
                              Y      => Integer(Windows_Center_Y + Y(C)),
                              Radius => Integer(Place_Radius),
                              Hue    => Place_C_Color,
                              Filled => No_Fill);
         for Place in Input_Places loop
            Adagraph.Draw_Circle(X      => Integer(Windows_Center_X + X(Place)),
                                 Y      => Integer(Windows_Center_Y + Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_I_Color,
                                 Filled => No_Fill);
         end loop;
         for Place in Output_Places loop
            Adagraph.Draw_Circle(X      => Integer(Windows_Center_X + X(Place)),
                                 Y      => Integer(Windows_Center_Y + Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_O_Color,
                                 Filled => No_Fill);
         end loop;
         for Place in Place_Names loop
            Adagraph.Display_Text (X    => -8 + Integer(Windows_Center_X + X(Place)),
                                   Y    => 5 + Integer(Windows_Center_Y + Y(Place)),
                                   Text => Place_Names'Image(Place),
                                   Hue  => Place_Name_Color);
         end loop;

      end;

      procedure Draw_Path (P: in Path.Object; Color: in Color_Type) is
      begin
         Path.Draw(Path  => P,
                   Color => Color);
      end;

      procedure Draw_Robot (X: in Integer; Y: in Integer; Color: in Color_Type) is
      begin
         Adagraph.Draw_Circle(X      => X,
                              Y      => Y,
                              Radius => Integer(Robot_Radius),
                              Hue    => Color,
                              Filled => Fill);
      end;

      procedure Hide_Robot (X: in Integer; Y: in Integer) is
      begin
         Draw_Robot(X, Y, Black);
      end;
   end Safely;
end Site;
