pragma Ada_2012;
with Ada.Containers.Vectors;
package body Gnumake_Plugin is
   GPLFLAG : Integer with
     Export => True,
     External_Name => "plugin_is_GPL_compatible";
   package V is new Ada.Containers.Vectors (Index_Type => Natural, Element_Type => Register_Method);
   Methods : V.Vector;

   procedure Register (F :  Register_Method) is
   begin
      Methods.Append (F);
   end;
   procedure Initialize  is
   begin
      for I of Methods loop
         I.all;
      end loop;
   end;

end Gnumake_Plugin;
