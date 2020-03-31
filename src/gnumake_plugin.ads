pragma License (Modified_GPL);
private with Interfaces.C.Strings;
package Gnumake_Plugin is
   type Flags is (Default, No_Expand);

   procedure Eval (Item      : String;
                   Lineno    : Natural;
                   File_Name : String);
   -- Run $(eval ...) on the provided string BUFFER.

   function Expand (Item : String) return String;
   -- Run GNU make expansion on the provided string Item

private
   procedure Gmk_Free (Str : Interfaces.C.Strings.chars_ptr);
   function Gmk_Alloc (Size : Interfaces.C.Unsigned) return Interfaces.C.Strings.chars_ptr;
   procedure Initialize with
     Export => True,
     Convention => C,
     External_Name => $Init_Method_Name;

   type Register_Method is access procedure;
   procedure Register (F :  Register_Method);
end Gnumake_Plugin;
