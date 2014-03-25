
      /****************************************************/
      /*                                                  */
      /*                                                  */
      /*       "kenMMepm" adds the ability to quickly     */
      /*    select the name of a multi-media file (or     */
      /*    Internet URL) embedded in a text file and     */
      /*    automatically launch the appropriate          */
      /*    application for viewing/listening             */
      /*    to/accessing that file.                       */
      /*                                                  */
      /*     See the kenMMepm.doc for instructions.       */
      /*                                                  */
      /*       copyright Ken Arway 1996                   */
      /*                                                  */
      /*                                                  */
      /****************************************************/


; This line is a comment because it has a semi-colon in column one


include 'STDCONST.E'

const
   FTP_APP = 'FTPPM.EXE'  -- change to match your preferences in the Internet section
   local_dir = '0'  -- change for your setup (if using FTPPM.EXE)
   KMM_MENU_MSG='~MMedia' -- remove when MYCNF.E has 'em for access by MOUSE.E 
   KMM_MENUP_MSG=\1'View/Hear/GoTo selected file or location'  -- ditto

definit  -- not used when items added to popup menu
   universal defaultmenu, activemenu
   deletemenu defaultmenu, 6, 0, 0
   buildsubmenu defaultmenu, 65, KMM_MENU_MSG, 'get_dataname'KMM_MENUP_MSG, 0, 0
   call readd_help_menu()
   call maybe_show_menu()


defc view_data
   universal dataname
   universal DataExt
   universal DataDir
   universal current_dir

   KMM_DATA_MSG='Data name is '
   current_dir = directory()  -- save the current directory
   if pos('.', .filename)<>1 & DataDir='' then
      CurrFile = .filename 
      place = lastpos('\', CurrFile)-1
      DataDir = leftstr(CurrFile, place)
      'cd' DataDir
   elseif leftstr(.filename, 8)='.DOS dir'|leftstr(.filename, 14)='.command_shell' then
      'cd' DataDir
   elseif leftstr(.filename, 5)='.tree'|leftstr(.filename, 4)='.DIR' then
      if pos('\', dataname) then
         place = lastpos('\', dataname)-1
         DataDir = leftstr(dataname, place)
         'cd' DataDir
      endif
   else 'cd' DataDir
   endif
   sayerror KMM_DATA_MSG || dataname''

;  -- User changes go below here --

;  This is the Internet section:

   if upcase(leftstr(dataname, 7))='HTTP://' then
      'start /F linkup.exe explore.exe -t 8 -q "'||dataname'"'
   elseif upcase(leftstr(dataname, 6))='FTP://' then
   compile if FTP_APP = 'FTPPM.EXE'
;  These next 10 lines are only used if FTPPM.EXE is being used for FTP access
      dataname=substr(dataname, 7)  -- this line strips out the URL type
         slash = pos('/', dataname)
         if  slash <> '0' then
            host = leftstr(dataname, (slash-1))
            rem_dir = substr(dataname, slash)
         else
            host = dataname
            rem_dir = '0'
         endif
         'start /F linkup.exe ftppm.exe '||host' anonymous name@address 0 0 "'||local_dir' "'||rem_dir'" * * 2'
;  The above 10 lines are used only for FTPPM.EXE
   compile else
;  These next 2 lines are only used if an alternate app is being used for FTP access
;         dataname=substr(dataname, 7)  -- this line strips out the URL type (remove if using WebEx for FTP)
         'start /F linkup.exe explore.exe -t 8 -q "'||dataname'"'
;  The above 2 lines are only used for alternate FTP apps
   compile endif
   elseif upcase(leftstr(dataname, 9))='GOPHER://' then
      dataname=substr(dataname, 10)  -- this line strips out the URL type
      slash = pos('/', dataname)
      host = leftstr(dataname, (slash-1))
      sub_dir = substr(dataname, (slash))
      dataname = host||' 1'||sub_dir
      'start /F linkup.exe gopher.exe "'||dataname'"'
   elseif upcase(leftstr(dataname, 9))='TELNET://' then
      dataname=substr(dataname, 10)  -- this line strips out the URL type
      'start /F linkup.exe telnetpm.exe "'||dataname'"'
   elseif upcase(leftstr(dataname, 5))='NEWS:' then
      'start /F linkup.exe explore.exe -t 8 -q "'||dataname'"'
   elseif upcase(leftstr(dataname, 7))='MAILTO:' then
      'start /F linkup.exe explore.exe -t 8 -q "'||dataname'"'
   elseif pos('@', dataname) then  -- these 3 lines must stay
      dataname = 'mailto:' || dataname  -- at the end of
      'start /F linkup.exe explore.exe -t 8 -q "'||dataname'"'  -- the Internet section


;   This is the section for other apps:

   elseif pos(DataExt, 'GIF JPG BMP TIF') then
      'start /F d:\grafx\showgif.exe "'||dataname'"'
   elseif DataExt='ZIP' then
      'start /F d:\fmanip\zipme\zipme.exe "'||dataname'"'
   elseif DataExt='ICO' then
      'start /F iconedit.exe "'||dataname'"'
;   elseif DataExt='PDF' then
;      'start /F d:\os2apps\acrobat\acroread.exe "'||dataname'"'
;   elseif DataExt='DS4' then
;      'start /WIN d:\winapps\ds41\ds40.ese "'||dataname'"'
   elseif pos(DataExt, 'HTM HTML') then
      'start /F explore.exe -t 8 -q "'||dataname'"'
   elseif DataExt='MPG' then
      'start /F d:\grafx\pmmpeg\pmmpeg.exe "'||dataname'"'
   elseif DataExt='AVI' then
      'start /F vb.exe "'||dataname'"'
   elseif pos(DataExt, 'WAV MID') then
      'start /F ab.exe "'||dataname'"'
   elseif DataExt='INF' then
      'start /F view.exe "'||dataname'"'
   elseif DataExt='HLP' then
      'start /F viewhelp.exe "'||dataname'"'
   elseif  pos(DataExt, 'DOC TXT') then
      'start /F e.exe "'||dataname'"'


;  -- No user changes are needed below this line --

   else
      KMM_DATA_MSG='Unrecognized data format: '
   endif
   call directory(current_dir)  -- restore the previous current directory
      sayerror KMM_DATA_MSG || dataname''
      DataExt=''  -- reset DataExt to null
      DataDir=''  -- reset DataDir to null


defc get_dataname
   universal dataname
   universal DataExt
   universal DataDir
   universal default_search_options
   universal current_dir

   getsearch search_command -- save user's search command
   center_search = 0
   call psave_pos(save_pos) -- save cursor's initial position

   if leftstr(.filename, 8)='.DOS dir'|leftstr(.filename, 14)='.command_shell' then
      finddirstart = 'Directory of '
      case = 'e'
      direction = '-R'
      'L '\1 || finddirstart\1'x'case||direction
      getline Dirline
      DataDir = substr(Dirline, 14)
      call prestore_pos(save_pos)  -- restore cursor's initial position
      refresh  -- removes locate circle
   endif  -- ".DOS dir" directory find

   if marktype() then
      mkt = leftstr(marktype(),1)
         if mkt <>'C' then
            sayerror 'Text must be marked with a Character mark'
         else
            getmark first_line, last_line, first_col, last_col, mark_fileid
            getline nameline, first_line
            dataname = substr(nameline,first_col,((last_col+1)-first_col))
               if pos('.', dataname)<>0 then 
                  dot = lastpos('.', dataname)+1
                  DataExt = upcase(substr(dataname, dot))
                     if DataDir='' & pos('\', dataname) then
                        place = lastpos('\', dataname)-1
                        DataDir = leftstr(dataname, place)
                     endif
               endif
         endif -- mkt
      if leftstr(.filename, 8)='.DOS dir'|leftstr(.filename, 14)='.command_shell' then
         dataname = DataDir||'\'||dataname
      endif
   sayerror 'Data name is '||dataname''
      if leftstr(.filename, 8)='.DOS dir'|leftstr(.filename, 14)='.command_shell' then
         call prestore_pos(save_pos)  -- restore cursor's initial position
         setsearch search_command  -- restore user's search command
         default_search_options    -- reset user's search options
         if .line <> .last then  -- resets the cursor's original line (sometimes)
            .line = .line+1
         else .last
         endif
      endif
   'view_data'

   else 
      getline nameline
      len = length(nameline)

      finddatastart = '~:n[^\\\.\:\$\&\@\~\#%/_-]|^.'
      case = 'c'
      direction = '-R'
      'L '\1 || finddatastart\1'x'case||direction
      if .col=1 then
         if pos('~:n[^\$\&\@\~\#%/_-]', nameline, .col, 'X')=1 then
            datastart = .col+1
         else
            datastart = 1
         endif
      else datastart = .col+1
      endif

      direction = '+F'
      finddataend = '~:n[^\\\.\:\$\~\@\#\&%/_-]|.$'
      call prestore_pos(save_pos) -- recall cursor's initial position
      'L '\1 || finddataend\1'x'case||direction
      if .col=len then
         if pos('~:n[^\$\&\@\~\#%/_-]', nameline, (.col-1), 'X') then
            dataend = .col-1
         else 
            dataend = .col
         endif
      else dataend = .col-1
      endif
      call prestore_pos(save_pos) -- recall cursor's initial position
      if .line <> .last then  -- resets the cursor's original line (sometimes)
         .line = .line+1
      else .last
      endif
      refresh   -- gets rid of the locate circle

      dataname = substr(nameline, datastart, ((dataend-datastart)+1))
         if pos('.', dataname)<>0 then 
            dot = lastpos('.', dataname)+1
            DataExt = upcase(substr(dataname, dot))
               if DataDir='' & pos('\', dataname) then
                  place = lastpos('\', dataname)-1
                  DataDir = leftstr(dataname, place)
               endif
         endif
      setsearch search_command  -- retrieve user's search command
      default_search_options    -- reset user's search options
      if leftstr(.filename, 8)='.DOS dir'|leftstr(.filename, 14)='.command_shell' then
         dataname = DataDir||'\'||dataname
      endif
      sayerror 'Data name is '||dataname''
      'view_data'
   endif -- get_dataname


defexit   -- not used when item is added to popup menu
   universal defaultmenu, activemenu
   deletemenu defaultmenu,65,0,0
   call maybe_show_menu()


