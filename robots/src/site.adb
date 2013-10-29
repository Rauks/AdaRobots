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

   function To_Point(Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Path.Point is
   begin
      return Path.Point'(X => X(Place, Scale, Scale_IO),
                         Y => Y(Place, Scale, Scale_IO));
   end;

   function Route(From: in Input_Places; To: in Output_Places) return Path.Object is
      P: Path.Object;
      In_Ring: Ring_Places := Way_In(From);
      Out_Ring: Ring_Places := Way_Out(To);
   begin
      Path.Add(P, To_Point(From));
      Path.Add(P, To_Point(In_Ring));
      if Out_Ring = Opposite(In_Ring) then
         Path.Add(P, To_Point(C));
      elsif Out_Ring = Next(Next(In_Ring)) then
         Path.Add(P, To_Point(Next(In_Ring)));
      elsif Out_Ring = Previous(Previous(In_Ring)) then
         Path.Add(P, To_Point(Previous(In_Ring)));
      end if;
      Path.Add(P, To_Point(Out_Ring));
      Path.Add(P, To_Point(To));
      return P;
   end;

   function X_Uncentered (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
      Value: Float;
   begin
      case Place is
         when C =>
            Value := 0.0;
         when R1 =>
            Value := Scale * Cos (Pi/6.0);
         when R2 =>
            Value := Scale * Cos (Pi/2.0);
         when R3 =>
            Value := Scale * Cos (5.0 * Pi/6.0);
         when R4 =>
            Value := Scale * Cos (-5.0 * Pi/6.0);
         when R5 =>
            Value := Scale * Cos (-Pi/2.0);
         when R6 =>
            Value := Scale * Cos (-Pi/6.0);
         when I1 =>
            Value := X_Uncentered(R1, Scale, Scale_IO) + Scale_IO * Cos (Pi/3.0);
         when I2 =>
            Value := X_Uncentered(R2, Scale, Scale_IO) + Scale_IO * Cos (2.0 * Pi/3.0);
         when I3 =>
            Value := X_Uncentered(R3, Scale, Scale_IO) + Scale_IO * Cos (Pi);
         when I4 =>
            Value := X_Uncentered(R4, Scale, Scale_IO) + Scale_IO * Cos (-2.0 * Pi/3.0);
         when I5 =>
            Value := X_Uncentered(R5, Scale, Scale_IO) + Scale_IO * Cos (-Pi/3.0);
         when I6 =>
            Value := X_Uncentered(R6, Scale, Scale_IO) + Scale_IO * Cos (0.0);
         when O1 =>
            Value := X_Uncentered(R1, Scale, Scale_IO) + Scale_IO * Cos (0.0);
         when O2 =>
            Value := X_Uncentered(R2, Scale, Scale_IO) + Scale_IO * Cos (Pi/3.0);
         when O3 =>
            Value := X_Uncentered(R3, Scale, Scale_IO) + Scale_IO * Cos (2.0 * Pi/3.0);
         when O4 =>
            Value := X_Uncentered(R4, Scale, Scale_IO) + Scale_IO * Cos (Pi);
         when O5 =>
            Value := X_Uncentered(R5, Scale, Scale_IO) + Scale_IO * Cos (-2.0 * Pi/3.0);
         when O6 =>
            Value := X_Uncentered(R6, Scale, Scale_IO) + Scale_IO * Cos (-Pi/3.0);
      end case;
      return Value;
   end;

   function Y_Uncentered (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
      Value: Float;
   begin
      case Place is
         when C =>
            Value := 0.0;
         when R1 =>
            Value := -Scale * Sin (Pi/6.0);
         when R2 =>
            Value := -Scale * Sin (Pi/2.0);
         when R3 =>
            Value := -Scale * Sin (5.0 * Pi/6.0);
         when R4 =>
            Value := -Scale * Sin (-5.0 * Pi/6.0);
         when R5 =>
            Value := -Scale * Sin (-Pi/2.0);
         when R6 =>
            Value := -Scale * Sin (-Pi/6.0);
         when I1 =>
            Value := Y_Uncentered(R1, Scale, Scale_IO) - Scale_IO * Sin (Pi/3.0);
         when I2 =>
            Value := Y_Uncentered(R2, Scale, Scale_IO) - Scale_IO * Sin (2.0 * Pi/3.0);
         when I3 =>
            Value := Y_Uncentered(R3, Scale, Scale_IO) - Scale_IO * Sin (Pi);
         when I4 =>
            Value := Y_Uncentered(R4, Scale, Scale_IO) - Scale_IO * Sin (-2.0 * Pi/3.0);
         when I5 =>
            Value := Y_Uncentered(R5, Scale, Scale_IO) - Scale_IO * Sin (-Pi/3.0);
         when I6 =>
            Value := Y_Uncentered(R6, Scale, Scale_IO) - Scale_IO * Sin (0.0);
         when O1 =>
            Value := Y_Uncentered(R1, Scale, Scale_IO) - Scale_IO * Sin (0.0);
         when O2 =>
            Value := Y_Uncentered(R2, Scale, Scale_IO) - Scale_IO_Default * Sin (Pi/3.0);
         when O3 =>
            Value := Y_Uncentered(R3, Scale, Scale_IO) - Scale_IO * Sin (2.0 * Pi/3.0);
         when O4 =>
            Value := Y_Uncentered(R4, Scale, Scale_IO) - Scale_IO * Sin (Pi);
         when O5 =>
            Value := Y_Uncentered(R5, Scale, Scale_IO) - Scale_IO * Sin (-2.0 * Pi/3.0);
         when O6 =>
            Value := Y_Uncentered(R6, Scale, Scale_IO) - Scale_IO * Sin (-Pi/3.0);
      end case;
      return Value;
   end;

   function X (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
   begin
      return Windows_Center_X + X_Uncentered(Place, Scale, Scale_IO);
   end;

   function Y (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float is
   begin
      return Windows_Center_Y + Y_Uncentered(Place, Scale, Scale_IO);
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
            Adagraph.Draw_Circle(X      => Integer(X(Place)),
                                 Y      => Integer(Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_R_Color,
                                 Filled => No_Fill);
         end loop;
         Adagraph.Draw_Circle(X      => Integer(X(C)),
                              Y      => Integer(Y(C)),
                              Radius => Integer(Place_Radius),
                              Hue    => Place_C_Color,
                              Filled => No_Fill);
         for Place in Input_Places loop
            Adagraph.Draw_Circle(X      => Integer(X(Place)),
                                 Y      => Integer(Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_I_Color,
                                 Filled => No_Fill);
         end loop;
         for Place in Output_Places loop
            Adagraph.Draw_Circle(X      => Integer(X(Place)),
                                 Y      => Integer(Y(Place)),
                                 Radius => Integer(Place_Radius),
                                 Hue    => Place_O_Color,
                                 Filled => No_Fill);
         end loop;
         for Place in Place_Names loop
            Adagraph.Display_Text (X    => -8 + Integer(X(Place)),
                                   Y    => 5 + Integer(Y(Place)),
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
