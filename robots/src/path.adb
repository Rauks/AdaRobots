package body Path is
   function Value (From: Points) return Object is
      Path: Object := Object'(Size => From'Length, Values => From);
   begin
      return Path;
   end;

   function "&" (Left: in Object; Right: in Object) return Object is
     Path: Object := Object'(Size => Left.Size + Right.Size, Values => Left.Values & Right.Values);
   begin
      return Path;
   end;

   function "&" (Left: in Object; Right: in Point) return Object is
     Path: Object := Object'(Size => Left.Size + 1, Values => Left.Values & Right);
   begin
      return Path;
   end;

   function "&" (Left: in Point; Right: in Object) return Object is
     Path: Object := Object'(Size => Right.Size + 1, Values => Left & Right.Values);
   begin
      return Path;
   end;

   procedure Add (Path: in out Object; P: in Point) is
   begin
      Path := Path & P;
   end;

   function Segment_Count (Path: in Object) return Natural is
   Count: Natural;
   begin
      if Path.Values'Last < 2 then
         Count := 0;
      else
         Count := Path.Values'Last - 1;
      end if;
      return Count;
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
      StartPoint, EndPoint: Point;
      Length: Float;
   begin
      StartPoint := Path.Values(Segment);
      EndPoint := path.Values(Segment + 1);
      Length := Sqrt((EndPoint.X - StartPoint.X)**2 + (EndPoint.Y - StartPoint.Y)**2);
      return Length;
   end;

   procedure Draw (Path: in Object; Color: in Color_Type := Light_Green) is
      TargetPoint: Point;
   begin
      if Path.Size > 0 then
         TargetPoint := Path.Values(1);
         Adagraph.Goto_XY(Integer(TargetPoint.X), Integer(TargetPoint.Y));
         for Segment in 2..Path.Values'Last loop
            TargetPoint := Path.Values(Segment);
            Adagraph.Draw_To(Integer(TargetPoint.X), Integer(TargetPoint.Y), Color);
         end loop;
      end if;
   end;

   function X (Path: in Object; Segment: in Positive; K: in ParametricCoef) return Float is
      X1: Float := Path.Values(Segment).X;
      X2: Float := Path.Values(Segment + 1).X;
   begin
      return (X1 + (X2 - X1)*K);
   end;

   function Y (Path: in Object; Segment: in Positive; K: in ParametricCoef) return Float is
      Y1: Float := Path.Values(Segment).Y;
      Y2: Float := Path.Values(Segment + 1).Y;
   begin
      return (Y1 + (Y2 - Y1)*K);
   end;
end Path;
