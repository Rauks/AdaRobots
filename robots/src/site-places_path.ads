package Site.Places_Path is
   type Cursor is private;

   function Open (From: in Place_Names; To: in Place_Names) return Cursor;
   function At_End (C: in Cursor) return Boolean;
   function Value (C: in Cursor) return Place_Names;
   procedure Next (C: in out Cursor);

   Illegal: exception;
private
   type Cell;
   type Ref is access Cell;
   type Cell is record
      Value: Place_Names;
      Next: Ref;
   end record;
   type Object is record
      Head, Tail: Ref;
   end record;
   Void: constant Object := (null, null);
   procedure Add (O: in out Object; Place: in Place_Names);

   type Cursor is new Ref;
end Site.Places_Path;
