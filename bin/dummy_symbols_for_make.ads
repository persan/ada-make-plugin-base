-- Only used to be able to resolve symbols provided by the make executable.
-- this makes it possibe to link the helper.
package Dummy_Symbols_For_Make is
   procedure Gmk_Expand is null with Convention => C, Export => True , External_Name => "gmk_expand";
   procedure Gmk_Alloc is null with Convention => C, Export => True , External_Name => "gmk_alloc";
   procedure Gmk_Eval is null with Convention => C, Export => True , External_Name => "gmk_eval";
   procedure Gmk_Free is null with Convention => C, Export => True , External_Name => "gmk_free";
end Dummy_Symbols_For_Make;
