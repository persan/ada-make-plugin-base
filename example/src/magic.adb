with Gnumake_Plugin.Generic_Plugin;
with Gnumake_Plugin.Image;
package body Magic is

   package Plugin_Magic is new Gnumake_Plugin.Generic_Plugin
     (Name     => "magic",
      Min_Args => 1,
      Max_Args => 0,
      Flags    => Gnumake_Plugin.Default,
      Worker   => Magic);

   package Plugin_Magic2 is new Gnumake_Plugin.Generic_Plugin
     (Name     => "magic2",
      Worker   => Magic);

   package Plugin_Expand is new Gnumake_Plugin.Generic_Plugin
     (Name     => "expand",
      Worker   => Expand);

   package Plugin_Eval is new Gnumake_Plugin.Generic_Plugin
     (Name     => "testeval",
      Worker   => Eval);

   -------------------
   -- Sample_Method --
   -------------------

   function Magic
     (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String
   is
      Ret : Gnumake_Plugin.String_Vectors.Vector;
   begin
      for I of Argv loop
         Ret.Append ("___" & I & "___");
      end loop;
      return Gnumake_Plugin.Image (Ret);
   end Magic;

   function Expand
     (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String
   is
   begin
      return Gnumake_Plugin.Expand ("${EXPAND}") & " expanded" & String'(Argv (1));
   end Expand;

   function Eval
     (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String
   is
   begin
      Gnumake_Plugin.Eval ("$(error fail on line 2)", Lineno => 2, File_Name => "test.mk");
      return "";
   end Eval;

end Magic;
