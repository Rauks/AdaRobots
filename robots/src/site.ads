with Adagraph;
with Path;

use Adagraph, Path;

package Site is
   type Place_Names is (I1, I2, I3, I4, I5, I6,
                        O1, O2, O3, O4, O5, O6,
                        R1, R2, R3, R4, R5, R6,
                        C);
   subtype Input_Places is Place_Names range I1..I6;
   subtype Output_Places is Place_Names range O1..O6;
   subtype Ring_Places is Place_Names range R1..R6;

   function Way_In (From: Input_Places) return Ring_Places;
   function Next (Place: Ring_Places) return Ring_Places;
   function Previous (Place: Ring_Places) return Ring_Places;
   function Way_Out (To: Output_Places) return Ring_Places;
   function Opposite (Place: Ring_Places) return Ring_Places;

   function X (Place: Ring_Places) return Float;
   function Y (Place: Ring_Places) return Float;

   Scale: constant Float := 200.0;
   protected Safely is
      procedure Create_Window;
      procedure Clear_Window;
      procedure Destroy_Window;
      procedure Draw_Site;
      procedure Draw_Path (P: Path.Object);
      procedure Draw_Robot (X: Integer; Y: Integer; Hue: Color_Type);
      procedure Hide_Robot (X: Integer; Y: Integer);
   end Safely;
end Site;
