with Path;
with Robot;
with Adagraph;
with Text_IO;

use Path, Robot, Adagraph, Text_IO;

procedure Test_Path is
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;

   A, B, C, D, E: Point;
   P1: Points := (A, B);
   P2: Points := (C, D);
   P: Path.Object;

   R: Robot.Object(Color => White);

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

   P := Value(P1) & Value(P2) & E;

   Adagraph.Display_Text (300, 80, "Segments : " & Integer'Image(Segment_Count(P)) , Hue => Light_Blue);
   Adagraph.Display_Text (300, 100, "Distance AB : " & Float'Image(Segment_Length(P, 1)) , Hue => Light_Blue);

   Draw(P);

   R.Follow(P);
   R.Shutdown;
end;
