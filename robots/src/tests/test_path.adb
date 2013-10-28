with Path;
with Adagraph;
with Text_IO;

use Path, Adagraph, Text_IO;

procedure Test_Path is
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;

   A, B, C, D, E: Point;
   P1: Points := (A, B);
   P2: Points := (C, D);

   K: Float := 0.0;
   dK: Float := 0.1;
   dt: Duration := 0.05;
begin
   A := Point'(200.0, 200.0);
   B := Point'(400.0, 400.0);
   C := Point'(500.0, 300.0);
   D := Point'(100.0, 300.0);
   E := Point'(240.5, 480.5);

   P1 := (A, B);
   P2 := (C, D);

   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Path Tests");
   Adagraph.Clear_Window;

   Adagraph.Display_Text (300, 80, "Segments : " & Integer'Image(Segment_Count(Value(P1) & Value(P2) & E)) , Hue => Light_Blue);
   Adagraph.Display_Text (300, 100, "Distance AB : " & Float'Image(Segment_Length(Value(P1), 1)) , Hue => Light_Blue);

   Draw(Value(P1) & Value(P2) & E);

   while K <= 1.0 loop
      Put_Line (Float'Image(K));
      Adagraph.Draw_Circle (Integer(X(Value(P1), 1, K)), Integer(Y(Value(P1), 1, K)), 20);
      K := K + dK;
      delay dt;
   end loop;
end;
