package Site.Places_Path is
   type Object is private;

   function Open (From: in Place_Names; To: in Place_Names) return Object;
   function At_End (O: in Object) return Boolean;
   function Value (O: in Object) return Place_Names;
   procedure Next (O: in out Object);
   procedure Close (O: in out Object);

   Illegal: exception;
private
   type Cell;
   type Ref is access Cell;
   type Cell is record
      Value: Place_Names;
      Next: Ref;
   end record;
   type Cursor is new Ref;
   type Object is record
      Head, Tail: Ref;
      C: Cursor;
   end record;
   Void: constant Object := (null, null, null);
   procedure Add (O: in out Object; Place: in Place_Names);

end Site.Places_Path;
