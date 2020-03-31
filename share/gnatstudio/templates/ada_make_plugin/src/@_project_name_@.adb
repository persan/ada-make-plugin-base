with Gnumake_Plugin.Generic_Plugin;
package body @_Project_Name_@ is

   -- Instaniate to register the methods.
   package Plugin is new Gnumake_Plugin.Generic_Plugin
     (Name     => "sample",
      Min_Args => 1,
      Max_Args => 0,
      Flags    => Gnumake_Plugin.Default,
      Worker   => Sample);


   --------------
   --  Sample  --
   --------------

   function Sample
     (Name : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return Gnumake_Plugin.String_Vectors.Vector
   is
   begin
      return Ret : Gnumake_Plugin.String_Vectors.Vector do
         --  Do something usefull
         --  
         for I of Argv loop
            Ret.Append ("___" & I & "___");
         end loop;
      end return;
   end Sample;

end @_Project_Name_@;
