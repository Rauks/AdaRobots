with Parking;

use Parking;

package body Agency is
   procedure Handle_Transfert(From: in Place_Names; To: in Place_Names) is
      Id: Robot_Id;
   begin
      Parking.Object.Take(Id);
      Robots(Id).Go(From, To);
   end;

   procedure Shutdown is
   begin
      Cancel.Signal;
   end;

   task body Mission_Listener is
      Id: Robot_Id;
      Needed: Boolean := True;
   begin
      while Needed loop
         select
            Cancel.Wait;
            Needed := False;
         then abort
            Robot.Mail.Get(Id);
            Parking.Object.Park(Id);
         end select;
      end loop;
   end;

   protected body Cancel is
      procedure Signal is
      begin
         Shutdown := True;
      end;

      entry Wait when Shutdown is
      begin
         for Id in Robots'Range loop
            Robots(Id).Shutdown;
         end loop;
      end;
   end Cancel;
end Agency;
