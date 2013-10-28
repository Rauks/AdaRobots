with Adagraph;

use Adagraph;

package Site is
   type Place_Names is (I1, I2, I3, I4, I5, I6,
                        O1, O2, O3, O4, O5, O6,
                        R1, R2, R3, R4, R5, R6,
                        C);
   subtype Input_Places is Place_Names range I1..I6;
   subtype Output_Places is Place_Names range O1..O6;
   subtype Ring_Places is Place_Names range R1..C;

   function Way_In (From: Input_Places) return Ring_Places;
   function Next (Place: Ring_Places) return Ring_Places;
   function Previous (Place: Ring_Places) return Ring_Places;
   function Way_Out (To: Output_Places) return Ring_Places;
   function Opposite (Place: Ring_Places) return Ring_Places;
end Site;
