with Adagraph;
with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

use  Adagraph, Ada.Numerics, Ada.Numerics.Elementary_Functions;

package Path is
   type Object is private;
   Null_path: constant Object;
   type Point is record
      X, Y: Float := 0.0;
   end record;
   type Points is array (Natural range <>) of Point;
   function Value (From: Points) return Object;
   function "&" (Left: in Object; Right: in Object) return Object;
   function "&" (Left: in Object; Right: in Point) return Object;
   function "&" (Left: in Point; Right: in Object) return Object;
   procedure Add (Path: in out Object; P: in Point);
   function Segment_Count (Path: in Object) return Natural;
   function Segment_Length (Path: in Object; Segment: in Positive) return Float;
   procedure Draw (Path: in Object; Color: in Color_Type := Light_Green);

   subtype ParametricCoef is Float range 0.0..1.0;
   function X (Path: in Object; Segment: in Positive; K: in ParametricCoef) return Float;
   function Y (Path: in Object; Segment: in Positive; K: in ParametricCoef) return Float;
private
   subtype Count is Natural range 0..50;
   type Object (Size: Count := 0) is record
      Values: Points (1..Size);
   end record;
   Null_Path: constant Object := Object'(Size => 0, Values => <>);
end Path;
