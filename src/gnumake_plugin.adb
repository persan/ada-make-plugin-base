pragma Ada_2012;
with Ada.Containers.Vectors;
with Gnumake_Plugin.Low_Level.Gnumake_H;
with Interfaces.C.Strings;
package body Gnumake_Plugin is

   ----------
   -- Eval --
   ----------

   procedure Eval
     (Item : String; Lineno : Natural; File_Name : String)
   is
      use Interfaces.C.Strings;
      Arg   : chars_ptr;
      Floc  : aliased Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Floc;
   begin
      Floc := Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Floc'(Filenm => New_String (File_Name) ,
                                                           Lineno => Interfaces.C.unsigned_long (Lineno));
      Arg := Interfaces.C.Strings.New_String (Item);
      Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Eval (Arg, Floc'Access);
      Interfaces.C.Strings.Free (Arg);
      Interfaces.C.Strings.Free (Floc.Filenm);
   end Eval;

   ------------
   -- Expand --
   ------------

   function Expand (Item : String) return String is
      Arg   : Interfaces.C.Strings.chars_ptr;
      Reply : Interfaces.C.Strings.chars_ptr;
   begin
      Arg := Interfaces.C.Strings.New_String (Item);
      Reply := Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Expand (Arg);
      return Ret : String := Interfaces.C.Strings.Value (Reply) do
         Gmk_Free (Reply);
         Interfaces.C.Strings.Free (Arg);
      end return;
   end Expand;

   --------------
   -- Gmk_Free --
   --------------

   procedure Gmk_Free (Str : Interfaces.C.Strings.chars_ptr) is
   begin
      Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Free (Str);
   end Gmk_Free;

   ---------------
   -- Gmk_Alloc --
   ---------------

   function Gmk_Alloc
     (Size : Interfaces.C.Unsigned) return Interfaces.C.Strings.chars_ptr
   is
   begin
      return Gnumake_Plugin.Low_Level.Gnumake_H.Gmk_Alloc (Size);
   end Gmk_Alloc;

   GPLFLAG : Integer with
     Export => True,
     External_Name => "plugin_is_GPL_compatible";


   package V is new Ada.Containers.Vectors (Index_Type => Natural, Element_Type => Register_Method);
   Methods : V.Vector;

   procedure Register (F :  Register_Method) is
   begin
      Methods.Append (F);
   end;
   procedure Initialize  is
   begin
      for I of Methods loop
         I.all;
      end loop;
   end;

end Gnumake_Plugin;
