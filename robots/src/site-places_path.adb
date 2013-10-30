package body Site.Places_Path is
   function Open (From: in Place_Names; To: in Place_Names) return Cursor is
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
      return Cursor(O.Head);
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

   function At_End (C: in Cursor) return Boolean is
   begin
      return C = null;
   end;

   function Value (C: in Cursor) return Place_Names is
   begin
      if C /= null then
         return C.Value;
      else
         raise Illegal;
      end if;
   end;

   procedure Next (C: in out Cursor) is
   begin
      if C /= null then
         C := Cursor(C.Next);
      else
         raise Illegal;
      end if;
   end;

end Site.Places_Path;
