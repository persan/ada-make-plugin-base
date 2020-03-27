with Gnumake_Plugin.String_Vectors;

generic
   Name : in String;
   Min_Args : Natural := 1;
   Max_Args : Natural := 1;
   Flags : Gnumake_Plugin.Flags := Gnumake_Plugin.Default;
   with function Worker (Nm : String; Argv : String_Vectors.Vector) return  String_Vectors.Vector;

package Gnumake_Plugin.Generic_Plugin is
   pragma Elaborate_Body;
   pragma Compile_Time_Error (not Gnumake_Plugin.Generic_Plugin'Library_Level, "Must be instasietd at library level");
   pragma Compile_Time_Error (Max_Args > 255 , "Max_args must be less then 255");

end Gnumake_Plugin.Generic_Plugin;
