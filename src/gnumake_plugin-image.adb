pragma Ada_2012;
with Ada.Strings.Unbounded;
function Gnumake_Plugin.Image
  (Item : Gnumake_Plugin.String_Vectors.Vector) return String
is
   Ret : Ada.Strings.Unbounded.Unbounded_String;
   use Ada.Strings.Unbounded;
begin
   for I of Item loop
      if Length (Ret) > 0 then
         Append (Ret, " ");
      end if;
      Append (Ret, I);
   end loop;
   return To_String (Ret);
end Gnumake_Plugin.Image;
