with Adagraph;
with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

use  Adagraph, Ada.Numerics, Ada.Numerics.Elementary_Functions;

procedure Main is

   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;

   procedure Draw_Spiral (X, Y: Integer; Degrees: Float; Steps: Integer; Hue: Color_Type := White) is
      Heading, dx, dy: Float := 0.0;
      Angle: Float := Degrees * Pi / 180.0;
   begin
      Adagraph.Goto_XY(X, Y);
      for L in 1..steps loop
         dx :=  Float(L) * Cos (Heading);
         dy := -Float(L) * Sin (Heading);
         Adagraph.Draw_To(Where_X  + Integer(dx), Where_Y + Integer(dy), Hue);
         Heading := Heading + Angle;
      end loop;
   end;

   procedure Draw_Colored_Boxes (X, Y, W, H: Integer) is
      X1, X2, Y1, Y2: Integer;
   begin
     for C in Color_Type loop
         X1 := X + W * Color_Type'Pos(C); Y1 := Y;
         X2 := X1 + W;  Y2 := Y1 + H;
         Draw_Box (X1, Y1, X2, Y2, Light_Gray, No_Fill);
         Draw_Box (X1 + 2, Y1 + 2, X2 - 2, Y2 - 2, c, Fill);
      end loop;
   end;

   procedure Draw_Colored_Ellipses (X, Y, W, H: Integer) is
      X1, X2, Y1, Y2: Integer;
   begin
     for C in Color_Type loop
         X1 := X + W * Color_Type'Pos(C); Y1 := Y;
         X2 := X1 + W;  Y2 := Y1 + H;
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, C, Fill);
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, Light_Gray, No_Fill);
      end loop;
   end;

begin
   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Hello from Ada");
   Adagraph.Clear_Window;

   Adagraph.Display_Text (300, 80, "Hello Ada friends!" , Hue => Light_Blue);

   Draw_Colored_Boxes(7, 5, 49, 25);

   Adagraph.Set_Antialiasing(True);
   Draw_Spiral(400, 300,  90.67, 260, Magenta);
   Draw_Spiral(400, 300,  89.33, 260, Light_Cyan);
   Adagraph.Set_Antialiasing(False);

   delay 1.0;

   for i in 150..430 loop
      Adagraph.Draw_Line(253, 298, 560, i, Magenta);
      Adagraph.Set_Immediate_Rendering(True);
      Adagraph.Set_Immediate_Rendering(False);
      Adagraph.Draw_Line(253, 298, 560, i, Black);
      delay 0.015;
   end loop;
   Adagraph.Set_Immediate_Rendering(True);
   Adagraph.Set_Antialiasing (True);

   delay 1.0;

   for C in Color_Type loop
       if C = Black then
          Adagraph.Draw_Circle (400, 300, 195 - 10 * Color_Type'Pos(C), C, Fill);
       else
          Adagraph.Draw_Circle (400, 300, 195 - 10 * Color_Type'Pos(C), C, No_Fill);
      end if;
      delay 0.05;
    end loop;

    delay 1.0;

   Draw_Colored_Ellipses(7, 532, 49, 65);

   Draw_Spiral(135, 160,  90.8, 170, Light_Green);
   Draw_Spiral(670, 170,  89.2, 170, Light_Green);

   delay 1.0;

   Adagraph.Display_Text (290, 515, "Goodbye Ada friends!" , Hue => Green);

   for i in 0..20 loop
      Adagraph.Draw_Line(290 + X_Char * i, 517, 290 + X_Char * i, 503, Light_Gray);
   end loop;


   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Destroy_Graph_Window;

end;
