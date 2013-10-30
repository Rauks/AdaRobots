with Site;

use Site;

generic
   type Resource_Id is (<>);
package Generic_Resources_Pool is
   type Request_Map is array (Resource_Id) of Boolean;

   procedure Acquire(Map: in Request_Map);
   procedure Acquire(Res: in Resource_Id);
   procedure Release(Map: in Request_Map);
   procedure Release(Res: in Resource_Id);
private
   protected type Resource is
      entry Acquire;
      entry Release;
   private
      Count: Natural := 0;
   end Resource;

   type Resource_Map is array (Resource_Id) of Resource;
   Resource_Pool: Resource_Map;
end Generic_Resources_Pool;
