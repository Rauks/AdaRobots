package body Generic_Resources_Pool is
   procedure Acquire(Map: in Request_Map) is
   begin
      for Res in Map'Range loop
         if Map(Res) then
            Acquire(Res);
         end if;
      end loop;
   end;

   procedure Acquire(Res: in Resource_Id) is
   begin
      Resource_Pool(Res).Acquire;
   end;

   procedure Release(Map: in Request_Map) is
   begin
      for Res in Map'Range loop
         if Map(Res) then
            Release(Res);
         end if;
      end loop;
   end;

   procedure Release(Res: in Resource_Id) is
   begin
      Resource_Pool(Res).Release;
   end;

   protected body Resource is
      entry Acquire when Count = 0 is
      begin
         Count := Count + 1;
      end;

      entry Release when Count > 0 is
      begin
         Count := Count - 1;
      end;
   end Resource;

end Generic_Resources_Pool;
