generic
   type Message is private;
package Mail_Box is
   type Messages is array(Positive range <>) of Message;

   protected type Object(Size: Positive) is
      entry Put(M: in Message);
      entry Get(M: out Message);
   private
      Content: Messages (1..Size);
      First: Positive := 1;
      Last: Positive := Size;
      Count: Natural := 0;
   end;
   type Ref is access Object;
end Mail_Box;
