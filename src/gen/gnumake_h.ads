pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package gnumake_h is

   GMK_FUNC_DEFAULT : constant := 16#00#;  --  /usr/include/gnumake.h:76
   GMK_FUNC_NOEXPAND : constant := 16#01#;  --  /usr/include/gnumake.h:77

  -- External interfaces usable by dynamic objects loaded into GNU Make.
  --   --THIS API IS A "TECHNOLOGY PREVIEW" ONLY.  IT IS NOT A STABLE INTERFACE--
  --Copyright (C) 2013-2016 Free Software Foundation, Inc.
  --This file is part of GNU Make.
  --GNU Make is free software; you can redistribute it and/or modify it under the
  --terms of the GNU General Public License as published by the Free Software
  --Foundation; either version 3 of the License, or (at your option) any later
  --version.
  --GNU Make is distributed in the hope that it will be useful, but WITHOUT ANY
  --WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
  --A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
  --You should have received a copy of the GNU General Public License along with
  --this program.  If not, see <http://www.gnu.org/licenses/>.   

  -- Specify the location of elements read from makefiles.   
   type gmk_floc is record
      filenm : Interfaces.C.Strings.chars_ptr;  -- /usr/include/gnumake.h:25
      lineno : aliased unsigned_long;  -- /usr/include/gnumake.h:26
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gnumake.h:27

   type gmk_func_ptr is access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : unsigned;
         arg3 : System.Address) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/gnumake.h:29

  -- Free memory returned by the gmk_expand() function.   
   procedure gmk_free (str : Interfaces.C.Strings.chars_ptr)  -- /usr/include/gnumake.h:42
   with Import => True, 
        Convention => C, 
        External_Name => "gmk_free";

  -- Allocate memory in GNU make's context.   
   function gmk_alloc (arg1 : unsigned) return Interfaces.C.Strings.chars_ptr  -- /usr/include/gnumake.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "gmk_alloc";

  -- Run $(eval ...) on the provided string BUFFER.   
   procedure gmk_eval (buffer : Interfaces.C.Strings.chars_ptr; floc : access constant gmk_floc)  -- /usr/include/gnumake.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "gmk_eval";

  -- Run GNU make expansion on the provided string STR.
  --   Returns an allocated buffer that the caller must free with gmk_free().   

   function gmk_expand (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/gnumake.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "gmk_expand";

  -- Register a new GNU make function NAME (maximum of 255 chars long).
  --   When the function is expanded in the makefile, FUNC will be invoked with
  --   the appropriate arguments.
  --   The return value of FUNC must be either NULL, in which case it expands to
  --   the empty string, or a pointer to the result of the expansion in a string
  --   created by gmk_alloc().  GNU make will free the memory when it's done.
  --   MIN_ARGS is the minimum number of arguments the function requires.
  --   MAX_ARGS is the maximum number of arguments (or 0 if there's no maximum).
  --   MIN_ARGS and MAX_ARGS may not exceed 255.
  --   The FLAGS value may be GMK_FUNC_DEFAULT, or one or more of the following
  --   flags OR'd together:
  --     GMK_FUNC_NOEXPAND: the arguments to the function will be not be expanded
  --                        before FUNC is called.
  -- 

   procedure gmk_add_function
     (name : Interfaces.C.Strings.chars_ptr;
      func : gmk_func_ptr;
      min_args : unsigned;
      max_args : unsigned;
      flags : unsigned)  -- /usr/include/gnumake.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "gmk_add_function";

end gnumake_h;
