with Gnumake_Plugin.Generic_Plugin;
package body @_Project_Name_@ is

   -- Instaniate to register the methods.
   package Plugin is new Gnumake_Plugin.Generic_Plugin
     (Name     => "@_sample_@",
      Min_Args => 1,
      Max_Args => 0,
      Flags    => Gnumake_Plugin.Default,
      Worker   => @_Sample_@_Method);


   -----------------------
   -- @_Sample_@_Method
   -----------------------

   function @_Sample_@_Method
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
   end @_Sample_@_Method;

end @_Project_Name_@;
