/* mlhook.e - this is the E part of the MlHook package       950915 */

/* Copyright (c) 1994, 1995 Martin Lafaix.  All Rights Reserved.    */

/* 950809: Martin Lafaix (lafaix@alto.unice.fr)                     */
/*                                                                  */
/*  .Taking care of the new EPM 6.x defxxx handling (a new          */
/*   fake_autosave function added -- autosaving re-enabled).        */
/*  .Defining mautosave : just like plain AUTOSAVE, but working     */
/*   with fake_autosave (that is, files which are highlighted on    */
/*   the fly).                                                      */
/*                                                                  */
/* 950131: Martin Lafaix (lafaix@mimosa.unice.fr)                   */
/*                                                                  */
/*  .Defining mversion : this function returns the current MLEPM    */
/*   version.                                                       */
/*                                                                  */
/* 940510: Martin Lafaix (lafaix@sophia.inria.fr)                   */
/*                                                                  */
/*  .Defining minitializehook : this function applies the defined   */
/*   load_hooks on the already loaded files (It's a kludge, but     */
/*   it's EPM fault, as it loads profile.erx AFTER having loaded    */
/*   the commandline files... Silly, IMHO :( )                      */
/*                                                                  */
/* 940507: Martin Lafaix (lafaix@sophia.inria.fr)                   */
/*                                                                  */
/*  .The following events can be 'hooked' : load, save, select and  */
/*   modify.  (In fact, you can define your own hooks.  See save)   */
/*          maddhook msethook mcallhook mrevcallhook                */
/*          save_hook load_hook select_hook modify_hook             */
/*                                                                  */

;
;  Usage:
;
;  Preliminary notes
;
;     This package is designed to be used as an external module.
;     Put MLHOOK.EX somewhere along your EPMPATH, and insert the
;     following statement in your profile.erx (you can issue the
;     command, if you just want to try it) :
;
;        link MLHOOK
;
;     All functions names are prefixed with an 'm', in order to
;     prevent name-clash with future (possible) EPM functions.
;     (We can't expect them to share the same definition, can we? :)
;
;     This package provides hooks for main events.
;
;  maddhook hook function
;
;     This function adds the function 'function' to the hook function
;     list.  Be careful, hooks are case-sensitive.
;
;     Example:
;
;        maddhook load_hook default_load
;
;     This example adds the default_load function to the load_hook
;     function list.  The default_load function will be called
;     whenever the load_hook will be called (that is, whenever a file
;     is loaded or named).
;
;  msethook hook function
;
;     This function clears the hook function list, and sets 'function'
;     as the only member of the hook function list.  Use this function
;     with great care.
;
;  mcallhook hook
;
;     This function calls every functions of the hook function list,
;     in the first-inserted, first-executed order.  You can use this
;     function with your own hooks.  This function is used for 'entry'
;     hooks.
;
;  mrevcallhook hook
;
;     This function calls every functions of the hook function list,
;     in the last-inserted, first-executed order.  You can use this
;     function with your own hooks.  This function is used for 'exit'
;     hooks.
;
;  minitializehook
;
;     This function forces the load_hook to be executed.  It's
;     required by the silly EPM profile.erx handling, as, when calling
;     epm, command-line specified files are loaded before profile.erx
;     is executed.
;
;  save_hook [not yet implemented]
;
;  load_hook
;
;     This hook is called whenever a new file is loaded (or renamed).
;
;  select_hook
;
;     This hook is called whenever a file is selected (that is, when a
;     file becomes active).
;
;  modify_hook
;
;     This hook is called whenever a file is modified.
;
;  mversion
;
;     This function returns current MLEPM version.
;


compile if not defined(BLACK)
const
   ml_hook_is_external = 1
   INCLUDING_FILE = 'MLHOOK.E'
   EXTRA_EX = 0
   RING_OPTIONAL = 1
   DEFAULT_AUTOSAVE = 100
   include 'stdconst.e'
   include 'english.e'
compile else
   const ml_hook_is_external = 0
compile endif

definit
   universal ML_array_ID
   do_array 1, ML_array_ID, 'MLARRAY'
   'maddhook load_hook default_load'
;   'maddhook save_hook default_save'
   'maddhook select_hook default_select'
   'maddhook modify_hook default_modify'

defc mversion
   sayerror 'MLEPM version 0.034.000'

defc msethook
   universal ML_array_ID
   parse arg hook function
   if isadefc(function)=0 then
      sayerror 'Unknown function in msethook : 'function
   endif
   if get_array_value(ML_array_ID,'hook.'hook'.0', item) then
      item=0
   endif
   item=1
   do_array 2, ML_array_ID, 'hook.'hook'.0', item
   do_array 2, ML_array_ID, 'hook.'hook'.'item, function
   return

defc maddhook
   universal ML_array_ID
   parse arg hook function
   if isadefc(function)=0 then
      sayerror 'Unknown function in maddhook : 'function
   endif
   if get_array_value(ML_array_ID,'hook.'hook'.0', item) then
      item=0
   endif
   item=item+1
   do_array 2, ML_array_ID, 'hook.'hook'.0', item
   do_array 2, ML_array_ID, 'hook.'hook'.'item, function
   return

defc mcallhook
   universal ML_array_ID
   parse arg hook
   call get_array_value(ML_array_ID,'hook.'hook'.0', items)
   for i = 1 to items
      do_array 3, ML_array_ID, 'hook.'hook'.'i, function
      function
   endfor

defc mrevcallhook
   universal ML_array_ID
   parse arg hook
   call get_array_value(ML_array_ID,'hook.'hook'.0', items)
   for i = items to 1 by -1
      do_array 3, ML_array_ID, 'hook.'hook'.'i, function
      function
   endfor

defc minitializehook
   getfileid firstid
   do forever
      'mcallhook load_hook'
      nextfile
      getfileid nextid
      if nextid=firstid then
         leave
      endif
   enddo
   'mcallhook select_hook'

defload
   universal ML_array_ID
   call get_array_value(ML_array_ID,'hook.load_hook.0', items)
   for i = 1 to items
      do_array 3, ML_array_ID, 'hook.load_hook.'i, function
compile if EVERSION >= 5.60
      'postme' function
compile else
      function
compile endif
   endfor

defselect
   universal ML_array_ID
   call get_array_value(ML_array_ID,'hook.select_hook.0', items)
   for i = 1 to items
      do_array 3, ML_array_ID, 'hook.select_hook.'i, function
compile if EVERSION >= 5.60
      'postme' function
compile else
      function
compile endif
   endfor

defmodify
   universal ML_array_ID
   call get_array_value(ML_array_ID,'hook.modify_hook.0', items)
compile if EVERSION >= 5.60
   .autosave = 0
compile endif
   for i = 1 to items
      do_array 3, ML_array_ID, 'hook.modify_hook.'i, function
compile if EVERSION >= 5.60
      'postme' function
compile else
      function
compile endif
   endfor

defc mautosave
   universal ML_array_ID
   universal vAUTOSAVE_PATH
compile if RING_OPTIONAL
   universal ring_enabled
compile endif
   getfileid fileid
   do_array 3, ML_array_ID, fileid'.autosave', autosav
   do_array 3, ML_array_ID, fileid'.modify', modif
   uparg=upcase(arg(1))
   if uparg=ON__MSG then                  /* If only says AUTOSAVE ON,  */
compile if DEFAULT_AUTOSAVE > 0
      autosav = DEFAULT_AUTOSAVE
compile else
      autosav=10                          /* default is every 10 mods. */
compile endif
   elseif uparg=OFF__MSG then
      autosav = 0
   elseif isnum(uparg) then            /* Check whether numeric argument. */
      autosav = uparg
   elseif uparg='DIR' then
      'dir' vAUTOSAVE_PATH
   elseif uparg='' then
      'commandline mautosave' autosav
   elseif uparg='?' then
 compile if RING_OPTIONAL
     if ring_enabled then
 compile endif
      if 6=winmessagebox(AUTOSAVE__MSG, CURRENT_AUTOSAVE__MSG||autosav\10||NAME_IS__MSG||MakeTempName()\10\10LIST_DIR__MSG, 16436)  -- YESNO + MB_INFORMATION + MOVEABLE
      then
         'dir' vAUTOSAVE_PATH
      endif
 compile if RING_OPTIONAL
     else
        call winmessagebox(AUTOSAVE__MSG, CURRENT_AUTOSAVE__MSG||autosav\10||NAME_IS__MSG||MakeTempName()\10\10NO_LIST_DIR__MSG, 16432)  -- OK + MB_INFORMATION + MOVEABLE
     endif
 compile endif
      return
   else
      sayerror AUTOSAVE_PROMPT__MSG
      return
   endif
   sayerror CURRENT_AUTOSAVE__MSG||autosav', 'NAME_IS__MSG||MakeTempName()

defc fake_autosave
   universal ML_array_ID, vDEFAULT_AUTOSAVE
   getfileid fileid
   if get_array_value(ML_array_ID, fileid'.autosave', autosav) then
      autosav = 0
   endif
   call get_array_value(ML_array_ID, fileid'.modify', modif)
   if autosav and modif>=autosav then
      if leftstr(.filename,1,1) <> '.' | .filename = UNNAMED_FILE_NAME then
         sayerror AUTOSAVING__MSG
         'xcom save "'MakeTempName()'"'
          sayerror 0
          modif = 0
      endif
   endif
   modif = modif+1
   do_array 2, ML_array_ID, fileid'.modify', modif
   .autosave = 1

/* taken from select.e */
compile if not defined(LOCAL_MOUSE_SUPPORT)
 const LOCAL_MOUSE_SUPPORT = 0
compile endif
const
  TransparentMouseHandler = "TransparentMouseHandler"

compile if ml_hook_is_external=0
defproc select_edit_keys()
   /* Dummy proc for compatibility.  Select_edit_keys() isn't used any more.*/
compile endif

defc default_select
compile if LOCAL_MOUSE_SUPPORT
   universal LMousePrefix
   universal EPM_utility_array_ID
compile endif
;compile if WANT_EBOOKIE = 'DYNALINK'
   universal bkm_avail
;compile endif
;compile if WANT_EPM_SHELL
   universal shell_index
   if shell_index then
      is_shell = leftstr(.filename, 15) = ".command_shell_"
      SetMenuAttribute( 103, 16384, is_shell)
;     SetMenuAttribute( 104, 16384, is_shell)
   endif
;compile endif
compile if LOCAL_MOUSE_SUPPORT
   getfileid ThisFile
   OldRC = Rc
   rc = get_array_value(EPM_utility_array_ID, "LocalMausSet."ThisFile, NewMSName)
   if RC then
      if rc=-330 then
         -- no mouseset bound to file yet, assume blank.
         LMousePrefix = TransparentMouseHandler"."
      else
         call messagenwait('RC='RC)
      endif
      RC = OldRC
   else
      LMousePrefix = NewMSName"."
   endif
compile endif

;compile if WANT_EBOOKIE
; compile if WANT_EBOOKIE = 'DYNALINK'
   if bkm_avail <> '' then
; compile endif
      call bkm_defselect()
; compile if WANT_EBOOKIE = 'DYNALINK'
   endif
; compile endif
;compile endif  -- WANT_EBOOKIE

/* taken from load.e */
defc default_load
   universal load_ext
   universal ML_array_ID
; compile if WANT_EBOOKIE = 'DYNALINK'
   universal bkm_avail
; compile endif
   universal vDEFAULT_TABS, vDEFAULT_MARGINS, vDEFAULT_AUTOSAVE, load_var
   universal default_font
; compile if WANT_LONGNAMES='SWITCH'
;   universal SHOW_LONGNAMES
; compile endif

   load_var = 0

   .tabs     = vDEFAULT_TABS
   .margins  = vDEFAULT_MARGINS
   .autosave = vDEFAULT_AUTOSAVE
; compile if WANT_LONGNAMES
;  compile if WANT_LONGNAMES='SWITCH'
;   if SHOW_LONGNAMES then
;  compile endif
;   longname = get_EAT_ASCII_value('.LONGNAME')
;   if longname<>'' then
;      filepath = leftstr(.filename, lastpos('\',.filename))
;      .titletext = filepath || longname
;   endif
;  compile if WANT_LONGNAMES='SWITCH'
;   endif
;  compile endif
; compile endif
   load_ext = filetype()
   keys edit_keys    -- defaults for non-special filetypes
   if .font < 2 then    -- If being called from a NAME, and font was set, don't change it.
      .font = default_font
   endif
;compile if WANT_BOOKMARKS
   if .levelofattributesupport < 2 then  -- If not already set (e.g., NAME does a DEFLOAD)
      'loadattributes'
      call attribute_on(1)
      call attribute_on(8)
   endif
;compile endif
;compile if WANT_EBOOKIE
; compile if WANT_EBOOKIE = 'DYNALINK'
   if bkm_avail <> '' then
; compile endif
      if bkm_defload()<>0 then keys bkm_keys; 'msetfilemode EBOOKIE'; endif
; compile if WANT_EBOOKIE = 'DYNALINK'
   endif
; compile endif
;compile endif  -- WANT_EBOOKIE
;compile if INCLUDE_BMS_SUPPORT
   if isadefproc('BMS_defload_exit') then
      call BMS_defload_exit()
   endif
;compile endif

   -- fake_autosave initializations
   getfileid fileid
   dummy = 0
   do_array 2, ML_array_ID, fileid'.autosave', vDEFAULT_AUTOSAVE
   do_array 2, ML_array_ID, fileid'.modify', dummy

-- sayerror 'DEFLOAD occurred for file '.filename'.'  -- for testing

/* taken from modify.e -- SHOW_MODIFY_METHOD == '' */
defc default_modify
   if .autosave and .modify>=.autosave then
      if leftstr(.filename,1,1) <> '.' | .filename = UNNAMED_FILE_NAME then
         sayerror AUTOSAVING__MSG
         'xcom save "'MakeTempName()'"'
         .modify=1                  /* Reraise the modify flag. */
          sayerror 0
      endif
   endif
;compile if INCLUDE_BMS_SUPPORT  -- Put this at the end, so it will be included in any of the above
   if isadefproc('BMS_defmodify_exit') then
      call BMS_defmodify_exit()
   endif
;compile endif

compile if EVERSION >= 6
   EA_comment 'Provides hooks for main EPM events'
compile endif
