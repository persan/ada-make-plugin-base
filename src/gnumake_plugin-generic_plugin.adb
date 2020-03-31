pragma Ada_2012;
with Gnumake_Plugin.Low_Level.Gnumake_H;
with Gnumake_Plugin.Image;
with Interfaces.C.Strings;
with System;

package body Gnumake_Plugin.Generic_Plugin is
   use Gnumake_Plugin.Low_Level.Gnumake_H;
   function Local
     (Nm   : Interfaces.C.Strings.chars_ptr;
      Argc : Interfaces.C.Unsigned;
      Argv : System.Address) return Interfaces.C.Strings.chars_ptr with Convention => C;


   -----------
   -- Local --
   -----------
   function Local
     (Nm   : Interfaces.C.Strings.chars_ptr;
      Argc : Interfaces.C.Unsigned;
      Argv : System.Address) return Interfaces.C.Strings.chars_ptr
   is
      use     Interfaces.C;
      type Chars_Ptr_Vector is array (0 .. Argc - 1) of Interfaces.C.Strings.chars_ptr;
      Args : Chars_Ptr_Vector with
        Import => True,
        Address => Argv;
      Args_Impl : String_Vectors.Vector;
      Ret : String_Vectors.Vector;
   begin
      for I of Args loop
         Args_Impl.Append (Interfaces.C.Strings.Value (I));
      end loop;
      return Interfaces.C.Strings.New_String (Worker (Interfaces.C.Strings.Value (Nm), Args_Impl));
   end Local;

   procedure Init is
   begin
      Gmk_Add_Function (Name => Interfaces.C.Strings.New_String (Name),
                        Func => Local'Unrestricted_Access,
                        Min_Args => Interfaces.C.Unsigned (Min_Args),
                        Max_Args => Interfaces.C.Unsigned (Max_Args),
                        Flags => Gnumake_Plugin.Flags'Pos (Flags));
   end Init;
begin
   Register (Init'Unrestricted_Access);
end Gnumake_Plugin.Generic_Plugin;
