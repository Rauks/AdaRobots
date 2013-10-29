with Adagraph;
with Path;

use Adagraph, Path;

package Site is
   Scale_Default: constant Float := 200.0;
   Scale_IO_Default: constant Float := 40.0;

   Windows_Center_X: constant Float := 400.0;
   Windows_Center_Y: constant Float := 300.0;

   Site_Color: constant Color_Type := White;

   Robot_Radius: constant Float := 7.0;

   Place_R_Color: constant Color_Type := Yellow;
   Place_C_Color: constant Color_Type := Yellow;
   Place_I_Color: constant Color_Type := Green;
   Place_O_Color: constant Color_Type := Red;
   Place_Name_Color: constant Color_Type := White;
   Place_Radius: constant Float := 12.0;

   type Place_Names is (I1, I2, I3, I4, I5, I6,
                        O1, O2, O3, O4, O5, O6,
                        R1, R2, R3, R4, R5, R6,
                        C);
   subtype Input_Places is Place_Names range I1..I6;
   subtype Output_Places is Place_Names range O1..O6;
   subtype Ring_Places is Place_Names range R1..R6;

   function Way_In (From: in Input_Places) return Ring_Places;
   function Next (Place: in Ring_Places) return Ring_Places;
   function Previous (Place: in Ring_Places) return Ring_Places;
   function Way_Out (To: in Output_Places) return Ring_Places;
   function Opposite (Place: in Ring_Places) return Ring_Places;

   function Route(From: in Input_Places; To: in Output_Places) return Path.Object;

   protected Safely is
      procedure Create_Window;
      procedure Clear_Window;
      procedure Destroy_Window;
      procedure Draw_Site;
      procedure Draw_Places;
      procedure Draw_Path (P: in Path.Object; Color: in Color_Type);
      procedure Draw_Robot (X: in Integer; Y: in Integer; Color: Color_Type);
      procedure Hide_Robot (X: in Integer; Y: in Integer);
   end Safely;

private
   function To_Point(Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Path.Point;

   function X (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float;
   function Y (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float;
   function X_Uncentered (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float;
   function Y_Uncentered (Place: in Place_Names; Scale: Float := Scale_Default; Scale_IO: Float := Scale_IO_Default) return Float;
end Site;
