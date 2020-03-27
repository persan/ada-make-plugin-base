package Gnumake_Plugin is
   procedure Initialize with
     Export => True,
     Convention => C,
     External_Name => $Init_Method_Name;
   type Flags is (Default, No_Expand);

private
   type Register_Method is access procedure;
   procedure Register (F :  Register_Method);
end Gnumake_Plugin;
