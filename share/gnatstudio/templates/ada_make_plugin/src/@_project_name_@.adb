with Gnumake_Plugin.Generic_Plugin;
with Gnumake_Plugin.Image;
package body @_Project_Name_@ is
   use Gnumake_Plugin;
   -- Instaniate to register the methods.
   package Plugin is new Generic_Plugin
     (Name     => "sample",
      Min_Args => 1,
      Max_Args => 0,
      Flags    => Gnumake_Plugin.Default,
      Worker   => Sample);


   --------------
   --  Sample  --
   --------------

   function Sample
     (Name : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String
   is
      Ret : Gnumake_Plugin.String_Vectors.Vector;
   begin
      --  Do something usefull
      --  
      for I of Argv loop
         Ret.Append ("___" & I & "___");
      end loop;
      return Image(ret);
   end Sample;

end @_Project_Name_@;
