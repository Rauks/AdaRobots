with Adagraph;
with Path;

use Adagraph, Path;

package Robot is
   task type Object (Color: Color_Type) is
      entry Follow (P: in Path.Object);
      entry Shutdown;
   end Object;

end Robot;
