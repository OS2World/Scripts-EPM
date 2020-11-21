/* htmlmode.e - this is the E part of the HTML mode package  950915 */

compile if not defined(BLACK)
const
   my_html_keys_is_external = 1
   INCLUDING_FILE = 'HTMLMODE.E'
   EXTRA_EX = 0
   include 'stdconst.e'
compile else
   const my_html_keys_is_external = 0
compile endif

   include 'english.e'

compile if my_html_keys_is_external = 1
   HTML_TABS = 3
   HTML_MARGINS = 1 MAXMARGIN 1
   WANT_CUA_MARKING = 'SWITCH'
   ASSIST_TRIGGER = 'ENTER'
   ENHANCED_ENTER_KEYS = 1
   ENTER_ACTION   = 'ADDATEND'
   c_ENTER_ACTION = 'ADDLINE'
   SYNTAX_INDENT = 3
compile endif

compile if EVERSION < 5.60
definit
   -- popupmenu kludge
   buildacceltable 'defaccel', 'html_tabify', AF_VIRTUALKEY+AF_ALT,0,9240
   buildacceltable 'defaccel', 'HTML_TABIFY', AF_VIRTUALKEY+AF_ALT,0,9241
   buildacceltable 'defaccel', 'html_style', AF_VIRTUALKEY+AF_ALT,0,9242
   buildacceltable 'defaccel', 'html_style EM', AF_VIRTUALKEY+AF_ALT,0,9243
   buildacceltable 'defaccel', 'html_style CITE', AF_VIRTUALKEY+AF_ALT,0,9244
   buildacceltable 'defaccel', 'html_style STRONG', AF_VIRTUALKEY+AF_ALT,0,9245
   buildacceltable 'defaccel', 'html_style CODE', AF_VIRTUALKEY+AF_ALT,0,9246
   buildacceltable 'defaccel', 'html_style SAMP', AF_VIRTUALKEY+AF_ALT,0,9247
   buildacceltable 'defaccel', 'html_style KBD', AF_VIRTUALKEY+AF_ALT,0,9248
   buildacceltable 'defaccel', 'html_style VAR', AF_VIRTUALKEY+AF_ALT,0,9249
   buildacceltable 'defaccel', 'html_style DFN', AF_VIRTUALKEY+AF_ALT,0,9250
   buildacceltable 'defaccel', 'html_style Q', AF_VIRTUALKEY+AF_ALT,0,9251
   buildacceltable 'defaccel', 'html_style LANG', AF_VIRTUALKEY+AF_ALT,0,9252
   buildacceltable 'defaccel', 'html_style AU', AF_VIRTUALKEY+AF_ALT, 0,9253
   buildacceltable 'defaccel', 'html_style PERSON', AF_VIRTUALKEY+AF_ALT,0,9254
   buildacceltable 'defaccel', 'html_style ACRONYM', AF_VIRTUALKEY+AF_ALT,0,9255
   buildacceltable 'defaccel', 'html_style ABBREV', AF_VIRTUALKEY+AF_ALT,0,9256
   buildacceltable 'defaccel', 'html_style INS', AF_VIRTUALKEY+AF_ALT,0,9257
   buildacceltable 'defaccel', 'html_style DEL', AF_VIRTUALKEY+AF_ALT,0,9258
   buildacceltable 'defaccel', 'html_style B', AF_VIRTUALKEY+AF_ALT,0,9260
   buildacceltable 'defaccel', 'html_style I', AF_VIRTUALKEY+AF_ALT,0,9261
   buildacceltable 'defaccel', 'html_style U', AF_VIRTUALKEY+AF_ALT,0,9262
   buildacceltable 'defaccel', 'html_style S', AF_VIRTUALKEY+AF_ALT,0,9263
   buildacceltable 'defaccel', 'html_style TT', AF_VIRTUALKEY+AF_ALT,0,9264
   buildacceltable 'defaccel', 'html_style BIG', AF_VIRTUALKEY+AF_ALT,0,9266
   buildacceltable 'defaccel', 'html_style SMALL', AF_VIRTUALKEY+AF_ALT,0,9267
   buildacceltable 'defaccel', 'html_style SUB', AF_VIRTUALKEY+AF_ALT,0,9268
   buildacceltable 'defaccel', 'html_style SUP', AF_VIRTUALKEY+AF_ALT,0,9269

compile endif

defc html_load_hook
   universal load_ext
   universal load_var

   if load_ext='HTM' | load_ext='HTML' then
compile if HTML_TABS <> 0
      if not (load_var // 2) then  -- 1 would be on if tabs set from EA EPM.TABS
         'tabs' HTML_TABS
      endif
compile endif
compile if HTML_MARGINS <> 0
      if not (load_var%2 - 2*(load_var%4)) then  -- 2 would be on if tabs set from EA EPM.MARGINS
         'ma'   HTML_MARGINS
      endif
compile endif
      'HTML_mode'
   endif

defc HTML_mode
   'msetfilemode HTML mode'
   'msetfilelanguage HTML'

defc mpopup_HTML_menu
compile if EVERSION < 5.60
   mt = leftstr(marktype(),1)
   if mt = 'L' then
      call mpopup(102)
   elseif mt = ' ' then
      call mpopup(100)
   elseif mt = 'C' then
      call mpopup(101)
   endif
compile else
   universal activemenu, previouslyactivemenu
 compile if CHECK_FOR_LEXAM
   universal LEXAM_is_available
 compile endif
   if previouslyactivemenu = '' then
      previouslyactivemenu = activemenu
   endif
   menuname = 'popup1'
   activemenu = menuname

   deletemenu menuname, 0, 0, 0
   buildsubmenu  menuname, 80, '', '', 0 , 0
   mt = leftstr(marktype(),1)
   'MH_gotoposition'
   ch = substr(textline(.line), .col, 1)
   gray_if_space = 16384*(ch=' ')
   if mt = 'L' then
      buildmenuitem menuname, 80, 9240, 'Create ~table', 'HTML_TABIFY', 0, 0
   elseif mt = ' ' then
      buildmenuitem menuname, 80, 9241, 'Create ~table...', 'HTML_TABIFY', 0, 0
      buildmenuitem menuname, 80, 9270, \0, '', 4, 0
   endif
   if mt = 'C' | mt = ' ' then
      buildmenuitem menuname, 80, 9242, 'Styl~e',        'html_style', 17, 0
      buildmenuitem menuname, 80, 9243, '~EM',           'html_style EM', 1, 0
      buildmenuitem menuname, 80, 9244, '~CITE',         'html_style CITE', 1, 0
      buildmenuitem menuname, 80, 9245, '~STRONG',       'html_style STRONG', 1, 0
      buildmenuitem menuname, 80, 9246, 'C~ODE',         'html_style CODE', 1, 0
      buildmenuitem menuname, 80, 9247, 'SA~MP',         'html_style SAMP', 1, 0
      buildmenuitem menuname, 80, 9248, '~KBD',          'html_style KBD', 1, 0
      buildmenuitem menuname, 80, 9249, '~VAR',          'html_style VAR', 1, 0
      buildmenuitem menuname, 80, 9250, '~DFN',          'html_style DFN', 1, 0
      buildmenuitem menuname, 80, 9251, '~Q',            'html_style Q', 2049, 0
      buildmenuitem menuname, 80, 9252, '~LANG',         'html_style LANG', 1, 0
      buildmenuitem menuname, 80, 9253, '~AU',           'html_style AU', 1, 0
      buildmenuitem menuname, 80, 9254, '~PERSON',       'html_style PERSON', 1, 0
      buildmenuitem menuname, 80, 9255, 'AC~RONYM',      'html_style ACRONYM', 1, 0
      buildmenuitem menuname, 80, 9256, 'A~BBREV',       'html_style ABBREV', 1, 0
      buildmenuitem menuname, 80, 9257, '~INS',          'html_style INS', 1, 0
      buildmenuitem menuname, 80, 9258, '~DEL',          'html_style DEL', 32769, 0
      buildmenuitem menuname, 80, 9259, \0,             '', 4, 0
      buildmenuitem menuname, 80, 9260, '~Bold',         'html_style B', 0, 0
      buildmenuitem menuname, 80, 9261, '~Italic',       'html_style I', 0, 0
      buildmenuitem menuname, 80, 9262, '~Underline',    'html_style U', 0, 0
      buildmenuitem menuname, 80, 9263, '~Strik through','html_style S', 0, 0
      buildmenuitem menuname, 80, 9264, '~TeleType',     'html_style TT', 0, 0
      buildmenuitem menuname, 80, 9265, \0,             '', 4, 0
      buildmenuitem menuname, 80, 9266, 'B~ig print',    'html_style BIG', 0, 0
      buildmenuitem menuname, 80, 9267, 'S~mall print',  'html_style SMALL', 0, 0
      buildmenuitem menuname, 80, 9268, 'S~ubscript',    'html_style SUB', 0, 0
      buildmenuitem menuname, 80, 9269, 'Su~perscript',  'html_style SUP', 0, 0
   endif
   showmenu menuname,1
compile endif

defc html_style
   parse arg cmd
   if cmd='' then
   else
      mt = leftstr(marktype(),1)
      if mt = ' ' then
         keyin '<'cmd'></'cmd'>'
         .col=.col-3-length(cmd)
      elseif mt = 'C' then
         call psave_pos(opos)
         call pend_mark()
         right
         keyin '</'cmd'>'
         call pbegin_mark()
         keyin '<'cmd'>'
         call prestore_pos(opos)
      endif
   endif

defc html_tabify
   parse arg row col
   if row = '' then
      row = ';'
   endif
   if col = '' then
      col = ','
   endif
   mt = leftstr(marktype(),1)
   if mt = ' ' then
      result =  entrybox('HTML - Create table','/~Create/Cancel/Help','3, 4',0,25,
compile if EVERSION >= 5.60
                         gethwnd(APP_HANDLE) || atoi(1) || atoi(9300) ||
compile else
                         atoi(1) || atoi(9300) || gethwnd(APP_HANDLE) ||
compile endif
                         'Rows count, columns count'\0)
      if result<>'' then
         parse value substr(result,2) ' z' with row ',' col .
         row=strip(row); col=strip(col)
         insertline '<table border>', .line
         insertline '</table>', .line+1
         for i = 1 to row
            insertline '<tr> 'copies('<td></td> ',col)'</tr>', .line+1
         endfor
      endif
   elseif mt = 'L' then
      getmark firstl, lastl
      insertline '<table border><tr><td>', firstl
      insertline '</td></tr></table>', lastl+2
      firstl; 'change _'row'_</td></tr><tr><td>_*M'
      firstl; 'change _'col'_</td><td>_*M'
   endif
