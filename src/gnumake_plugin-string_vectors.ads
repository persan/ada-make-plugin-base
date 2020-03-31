with Ada.Containers.Indefinite_Vectors;
package Gnumake_Plugin.String_Vectors is new
  Ada.Containers.Indefinite_Vectors (Index_Type => Positive, Element_Type => String);
