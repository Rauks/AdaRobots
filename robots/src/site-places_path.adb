with Ada.Unchecked_Deallocation;

package body Site.Places_Path is
   function Open (From: in Place_Names; To: in Place_Names) return Object is
      In_Ring: Ring_Places := Way_In(From);
      Out_Ring: Ring_Places := Way_Out(To);
      O: Object := Void;
   begin
      Add(O, From);
      Add(O, In_Ring);
      if Out_Ring = Opposite(In_Ring) then
         Add(O, C);
      elsif Out_Ring = Next(Next(In_Ring)) then
         Add(O, Next(In_Ring));
      elsif Out_Ring = Previous(Previous(In_Ring)) then
         Add(O, Previous(In_Ring));
      end if;
      Add(O, Out_Ring);
      Add(O, To);
      O.C := Cursor(O.Head);
      return O;
   end;

   procedure Add (O: in out Object; Place: in Place_Names) is
      P: Ref;
   begin
      P := new Cell'(Value => Place,
                     Next  => null);
      if O.Head = null then
         O.Head := P;
      else
         O.Tail.Next := P;
      end if;
      O.Tail := P;
   end;

   function At_End (O: in Object) return Boolean is
   begin
      return O.C = null;
   end;

   function Value (O: in Object) return Place_Names is
   begin
      if O.C /= null then
         return O.C.Value;
      else
         raise Illegal;
      end if;
   end;

   procedure Next (O: in out Object) is
   begin
      if O.C /= null then
         O.C := Cursor(O.C.Next);
      else
         raise Illegal;
      end if;
   end;

   procedure Free is new Ada.Unchecked_Deallocation (Object => Cell,
                                                     Name   => Ref);

   procedure Close (O: in out Object) is
      Temp: Ref;
   begin
      O.C := null;
      while O.Head /= null loop
         Temp := O.Head;
         O.Head := O.Head.Next;
         Free(Temp);
      end loop;
   end;

end Site.Places_Path;
