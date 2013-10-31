with Parking;

use Parking;

package body Agency is
   procedure Handle_Transfert(From: in Place_Names; To: in Place_Names) is
      Id: Robot_Id;
   begin
      Parking.Object.Take(Id);
      Robots(Id).Go(From, To);
   end;

   task body Mission_Listener is
      Id: Robot_Id;
   begin
      for R in Robots'Range loop
         Parking.Object.Park(R);
      end loop;

      loop
         Robot.Mail.Get(Id);
         Parking.Object.Park(Id);
      end loop;
   end;

end Agency;
