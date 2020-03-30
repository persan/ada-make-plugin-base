with Gnumake_Plugin.Generic_Plugin;
package body Magic is

   package Plugin is new Gnumake_Plugin.Generic_Plugin
     (Name     => "magic",
      Min_Args => 1,
      Max_Args => 0,
      Flags    => Gnumake_Plugin.Default,
      Worker   => Magic_Method);

   package Plugin2 is new Gnumake_Plugin.Generic_Plugin
     (Name     => "magic2",
      Worker   => Magic_Method);

   -------------------
   -- Sample_Method --
   -------------------

   function Magic_Method
     (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return Gnumake_Plugin.String_Vectors.Vector
   is
      Ret : Gnumake_Plugin.String_Vectors.Vector;
   begin
      for I of Argv loop
         Ret.Append ("___" & I & "___");
      end loop;
      return Ret;
   end Magic_Method;

end Magic;
