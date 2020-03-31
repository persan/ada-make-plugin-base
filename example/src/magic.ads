pragma License (Modified_GPL);
with Gnumake_Plugin.String_Vectors;
package Magic is
   function Magic (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String;
   function Expand (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String;
   function Eval (Nm : String; Argv : Gnumake_Plugin.String_Vectors.Vector) return String;
end Magic;
