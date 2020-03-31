with Gnumake_Plugin.String_Vectors;
package Magic is
   function Magic_Method (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return  Gnumake_Plugin.String_Vectors.Vector;
   function Expand (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return  Gnumake_Plugin.String_Vectors.Vector;
   function Eval (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return  Gnumake_Plugin.String_Vectors.Vector;
end Magic;
