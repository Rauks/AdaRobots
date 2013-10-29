with Adagraph;
with Path;

use Adagraph, Path;

package Site is
   Def_Scale: constant Float := 200.0;
   Center_X: constant Float := 400.0;
   Center_Y: constant Float := 300.0;
   Site_Color: constant Color_Type := White;

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

   function X (Place: in Ring_Places; Scale: Float := Def_Scale) return Float;
   function Y (Place: in Ring_Places; Scale: Float := Def_Scale) return Float;

   protected Safely is
      procedure Create_Window;
      procedure Clear_Window;
      procedure Destroy_Window;
      procedure Draw_Site;
      procedure Draw_Path (P: in Path.Object);
      procedure Draw_Robot (X: in Integer; Y: in Integer; Hue: Color_Type);
      procedure Hide_Robot (X: in Integer; Y: in Integer);
   end Safely;
end Site;
