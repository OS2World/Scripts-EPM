.* EBOOKIE (IPFTAGS.DEF)
.* last used link = 141
:userdoc.
:title.MLEPM User's Manual
:h1.Preface
:lm margin=1.
:p.(c) Martin Lafaix 1994, 1995.
:p.This manual describes the features of MLEPM.  It is intended for
the user who is new to MLEPM.  However, it is not meant to be a
tutorial; it is assumed that the user has had some experience with
EPM.  The information on how to use the package, therefore, is
presented here in a reference or summary manner.  Tables and lists
summarize key functions and commands.  If you cannot find what you are
looking for, refer to the index for cross referencing.
:p.MLEPM is a set of macros.  Although a discussion of superficial
tailoring is presented herein, the macro language (the E language)
which allows the EPM's programmability is not discussed in this manual
at all.  For information on the E language, users should refer to The
EPM Editor Technical Reference.
:note.EPM will be used as an abbreviation for the Enhanced Editor
throughout this document.
:h2.Related Manuals
:lm margin=1.
:p.The following manual contains information related to the E editor:
:ul compact.
:li.The Enhanced Editor User's Guide
:li.The EPM Editor Technical Reference Manual
:li.Rexx Information in OS/2 2.0 Information
:eul.
:h2.Special Notice
:p.The term :hp2.OS/2:ehp2. is a trademark of the IBM Corporation.
:p.MLEPM is (c) Martin Lafaix 1994, 1995.
:p.Author&colon. Martin Lafaix
.br
Address&colon.
:xmp.
   16, rue de Dijon
   06000 Nice
   France

   email: lafaix&atsign.alto.unice.fr
:exmp.
:h1.Release Notes
:p.This is the fourth public release of MLEPM (v0.034.000).

:p.:hp8.It's a beta version.:ehp8.
:p.It contains the following improvements since v0.033.000:

:ul compact.
:li.:link reftype=hd res=122.mpopupmenu:elink. revisited (for
EPM v5.60+);
:li.bug fix in MATCHKEY;
:li.An enhanced HTML mode, :link reftype=hd res=141.HTMLmode:elink. (It can
be used with EBOOKIE);
:li..userstring no longer used to store file language;
:li.On-the-fly highlighting was broken with EPM v5.51a.
:eul.

:p.v0.033.000 added the following:

:ul compact.
:li.Full EPM 6 support;
:li.User-defined highlighting rules in C/C++ mode are now used;
:li.Autosave mode works again when editing files with on-the-fly
highlighting (see :link reftype=hd res=140.mautosave:elink.);
:li.A new :link reftype=hd res=138.mmarkarea:elink. function, used to select area bounded by
delimiters (strings, ...);
:li.In C/C++ mode, Alt+1 over a :hp2.#include:ehp2.
directive loads the corresponding file.
:eul.

:h1.Getting Started

:p.The following sections describe the basics of MLEPM:
prerequisites, installation and FAQ.

:h2.Prerequisite
:p.The included .EX files have been compiled for EPM v5.51a and EPM
v6.00c.  EPM v5.51a is the version included with Warp.  If you have an
earlier version of EPM, you may have to recompile the macros with the
corresponding ETPM compiler, but I highly recommend you to grab EPM
v5.51a from, say, software.watson.ibm.com&colon./pub/os2/ews (do not
use the one in /pub/os2/os2fixes, it's an older version&xclm.).

:p.If you have a newer version (such as v5.60 or v6), you may have to
recompile the macros with the corresponding ETPM compiler.  It will
allowed you to use Extended GREP, and things like that.  MLEPM has
been tested with both EPM v5.51a and EPM v6.00c.  Please use the EPM
v5.60+ specific profile file (:hp2.profile.600:ehp2.), as
it is tailored for theses versions.

:h2.Installation
:lm margin=1.
:ol.
:li.Unpack this package.
:li.Depending on you editor's version, either unpack ex.551 or ex.600
(or, if you're using a different version, use the MAKEMACS.CMD script
to rebuild the macros for your editor -- ETPM is required for this
step).
:li.Copy all .ex files somewhere along your :hp2.EPMPATH:ehp2..
:li.Put MPOPUP.EXE somewhere along your :hp2.PATH:ehp2..  Start
:hp2.MPOPUP.EXE:ehp2. (and put a Program Object referring to it in your
startup folder)
:li.Load epm and edit the :hp2.styles.smp:ehp2. file.  Customize the
included styles (via the "Style" dialog, Ctrl+Y), if needed.
:p.[This step IS important!]
:li.Enable the profile support, if not already done:
:p.Bring up the "command" dialog (Ctrl+I), Enter the following
command: PROFILE ON. Save your options (Options/Save options)
:li.Merge :hp2.profile.551:ehp2. or :hp2.profile.600:ehp2. with your
:hp2.profile.erx:ehp2.
(if you were not using a :hp2.profile.erx:ehp2., just rename
:hp2.profile.nnn:ehp2. to :hp2.profile.erx:ehp2., and put it somewhere
along your :hp2.EPMPATH:ehp2.).
:li.Exit EPM, and restart it.  Try loading a new C file, and play with
it...
:eol.
:p.That's all!
:h2.Common Q&amp.A
:p.This section contains commonly asked questions on MLEPM.
:dl break=all.
:dt.What is MLEPM?
:dd.
:p.MLEPM provides hooks, popup menus, [auto]highlighting and "modes"
for EPM.
:dt.Why MLEPM?
:dd.
:p.Well, that's a good question.  MLEPM is a set of macros I started
to develop more than two years ago.  I did it to make EPM suits my
needs/preferences.  Before using EPM, I was (and still am &colon.-)
used to Emacs.  But then, there was no correct implementation of Emacs
for OS/2.  So, I decided to use EPM, and hence MLEPM...
:note.MLEPM does NOT try to emulate Emacs look and feel/behavior
:dt.Is MLEPM loaded?
:dd.
:p.Use the :link reftype=hd res=136.mversion:elink. function.  If you
get an error, well, MLEPM is not loaded.  Check in the message box
(Option/Messages...): if it contains "Link :  file not found"
messages, MLEPM's .EX files are probably not somewhere along your
:hp2.EPMPATH:ehp2..
.br
If the message box contains "Link completed, module #...", are you
sure you're loading all required .EX?
.br
If the message box does not contains one of the previous statement, it
look like you're not loading MLEPM.  Is the profile support enabled?
And, if yes, does a :hp2.profile.erx:ehp2. exists somewhere along your
:hp2.EPMPATH:ehp2.?  And, if yes, is there any incorrect
:hp2.profile.erx:ehp2. earlier in the :hp2.EPMPATH:ehp2.?
:dt.I'm loading an existing C file, and it's not highlighted&xclm.
:dd.
:p.MLEPM does not automatically highlights preexisting files.  Use
the :link reftype=hd res=111.mhilite:elink. function (you just have to
do that ONCE PER file).
:dt.It does not highlights my C/... file on the fly&xclm.
:dd.
:p.Is MPOPUP.EXE up and running?  If yes (that is, there's a
MLPOPUP entry in the task list), is autohighlighting enabled? (Call
the :link reftype=hd res=104.mautohilite:elink. command  --  if it
says "AUTOHILITE : OFF", then enable it.)
:dt.Loading an highlighted file is slower than before&xclm.
:dd.
:p.Yes, indeed.  It takes a few seconds to rebuild highlightings from
Extended Attributes.
:dt.MLEPM does not highlight keywords, constants, ... in my
files&xclm.
:dd.
:p.It does not do that by default, mainly because I don't like it
&colon.-)
.br
Another thing to take in consideration: the more item you highlight,
the longer it will take to highlight/load/save your files.  And, due
to an EPM limitation, attributes can't exceed 64KB when saved.
:dt.I edited one of my files with another editor, and it looks like
highlighting is out-of-synch for this file now...
:dd.
:p.Use the :link reftype=hd res=124.mrehilite:elink. function to
re-synchonize highlighting.
:dt.I'm using EPM v5.60 or v6.  Is MLEPM of any use for me?
:dd.
:p.Yes, absolutely, MLEPM works great with EPM v5.60+.  Be sure to use
the specific profile file, :hp2.profile.600:ehp2..
:p.When used with such a version, MLEPM brings you improved editing
modes, hooks, more powerful highlighting schemes (but it's definitely
slower than native EPM v6 highlighting), and much more.
:p.There's a major difference in the way MLEPM and EPM v6 handle
highlighting.  EPM v6 is great for highlighting keywords and
line-oriented files, and it is fast (less than 3 seconds to
highlight :hp2.stdctrl.e:ehp2.).  But it's not very powerful:
multi-lines comments are not highlighted, and you can only use
keywords (or a starting and an ending delimiter, if they are on the
same line) -- you cannot use regular expressions.  On the opposite,
MLEPM is slower (1 minute to highlight the same file -- but you just
have to do it once), but multi-lines comments are handled just fine,
and all functions definitions can be highlighted -- you can use
regular expressions (and even the 'extended' regular expressions,
introduced with EPM v5.60).
:p.There's one feature of MLEPM which is completely superseded by EPM
v6 : Popup menus.  They works fine, but EPM's implementation is simply
better.
:edl.
:h1.Basic Packages
:p.MLEPM is composed of three main package, MLHOOK, MLHILITE and
MLTOOLS.  There's a minor package, too: MATCHKEY.
:h2.MATCHKEY
:lm margin=1.
:p.This package mimics the Emacs parent matching.  Opening tokens
("(", "[" and "{") insert the matching one, too.
:p.By "mimics", I mean, when you press a closing token key, it will
temporarily highlight the matching token.
:p.To use it, put MATCHKEY.EX
somewhere along your EPMPATH, and insert
the following statement in your profile.erx (you can issue the
command via the "command" dialog (Ctrl+I), if you just want to try
it)&colon.
:xmp.
      link MATCHKEY
:exmp.
:p.Don't use it if you don't like it&xclm. &colon.-)
:p.This package is totally independent.  It's an adaptation of the
original MATCHKEY, included in the EPM package.
:h2.MLHILITE
:lm margin=1.
:p.Preliminary notes
:p.This package is designed to be used as an external module.  Put
MLHILITE.EX somewhere along your EPMPATH, and insert the following
statement in your profile.erx (you can issue the command, if you just
want to try it):
:xmp.
        link MLHILITE
:exmp.
:p.Autohighlighting requires MLHOOK to be loaded and MPOPUP.EXE to be
up and running.
:p.This package provides functions which allows you
highlight/unhighlight a whole file, or only parts of it.  It also
allows you to specify rules used to highlight a given language.
:p.It provides the following functions:
:ul compact.
:li.:link reftype=hd res=104.mautohilite:elink.
:li.:link reftype=hd res=111.mhilite:elink.
:li.:link reftype=hd res=112.mhiliteadd:elink.
:li.:link reftype=hd res=113.mhiliteclr:elink.
:li.:link reftype=hd res=114.mhilitedef:elink.
:li.:link reftype=hd res=121.mpackhilite:elink.
:li.:link reftype=hd res=124.mrehilite:elink.
:li.:link reftype=hd res=130.munhilite:elink.
:li.:link reftype=hd res=131.munhilitemark:elink.
:eul.
:p.And, it defines those two hook-functions:
:ul compact.
:li.:link reftype=hd res=100.hilite_mode_hook:elink.
:li.:link reftype=hd res=101.hilite_modify_hook:elink.
:eul.
:h2.MLHOOK
:lm margin=1.
:p.Preliminary notes
:p.This package is designed to be used as an external module.  Put
MLHOOK.EX somewhere along your EPMPATH, and insert the following
statement in your profile.erx (you can issue the command, if you just
want to try it):
:xmp.
        link MLHOOK
:exmp.
:p.This package provides hooks for main events; namely:
:ul compact.
:li.:link reftype=hd res=139.fake&us.autosave:elink.
:li.:link reftype=hd res=102.load_hook:elink.
:li.:link reftype=hd res=120.modify_hook:elink.
:li.:link reftype=hd res=133.save_hook:elink.
:li.:link reftype=hd res=134.select_hook:elink.
:eul.
:p.And it defines the following functions, which allows you to
use/define hooks:
:ul compact.
:li.:link reftype=hd res=103.maddhook:elink.
:li.:link reftype=hd res=140.mautosave:elink.
:li.:link reftype=hd res=106.mcallhook:elink.
:li.:link reftype=hd res=116.minitializehook:elink.
:li.:link reftype=hd res=125.mrevcallhook:elink.
:li.:link reftype=hd res=128.msethook:elink.
:li.:link reftype=hd res=136.mversion:elink.
:eul.
:p.A :hp2.hook:ehp2. is a place you can attach functions to.  It's
generally associated with a specific event.
:p.It allows you to do a special action whenever the event occurs.
For example, if you want to adapt the menu bar to the current file,
you can add a function on the :hp2.select&us.hook:ehp2. hook.
:h2.MLTOOLS
:lm margin=1.
:p.Preliminary notes
:p.This package is designed to be used as an external module.  Put
MLTOOLS.EX somewhere along your EPMPATH, and insert the following
statement in your profile.erx (you can issue the command, if you just
want to try it):
:xmp.
        link MLTOOLS
:exmp.
:p.This package mainly works on attributed (aka highlighted) files, so
it's recommended that you use it with a highlighting-package (as
MLHILITE).  If you want to use the mode hook, you have to link MLHOOK,
too.
:p.Popup menus require the MPOPUP.EXE program to be running.
:p.It provides the following functions:
:ul compact.
:li.:link reftype=hd res=105.mautoindent:elink.
:li.:link reftype=hd res=137.mdebug:elink.
:li.:link reftype=hd res=108.mfind:elink.
:li.:link reftype=hd res=109.mfindfunction:elink.
:li.:link reftype=hd res=110.mgo:elink.
:li.:link reftype=hd res=115.mindentline:elink.
:li.:link reftype=hd res=117.mloadattributes:elink.
:li.:link reftype=hd res=138.mmarkarea:elink.
:li.:link reftype=hd res=118.mnext:elink.
:li.:link reftype=hd res=119.mnextfunction:elink.
:li.:link reftype=hd res=122.mpopupmenu:elink.
:li.:link reftype=hd res=123.mquicksave:elink.
:li.:link reftype=hd res=126.msaveattributes:elink.
:li.:link reftype=hd res=127.msetfilemode:elink.
:li.:link reftype=hd res=129.msetstatusline:elink.
:li.:link reftype=hd res=132.newtop:elink.
:eul.
:p.And, it defines this hook-function:
:ul compact.
:li.:link reftype=hd res=135.show_mode_hook:elink.
:eul.
:p.:hp2.Popup Menus:ehp2.

:p.The popup menu feature is version-dependant.  If you are currently
using EPM v5.51a (or earlier), it is not easily customizable, but it
nonetheless allows you to use popup menus, and that's quite nice
&colon.-)

:p.If you're using EPM v5.60 or higher, then, you can define
mode-dependant and/or smart popup menus.  See
:hp2.mpopupmenu:ehp2. for more details.

:p.If you're using EPM v5.51a, MLEPM defines five different popup
menus:

:ol compact.
:li.The "char mark" popup;
:li.The "non-char mark" popup;
:li.The "outside mark" popup;
:li.The "no mark" popup;
:li.And the "EPM" popup.
:eol.
:p.The first popup is displayed when clicking inside a "char" mark.
It contains the following options:
:font facename=Courier size=14x14.
:xmp.
Unmark               Alt+U
Delete mark          Alt+D
Fill mark
Reflow mark
Uppercase selection  Ctrl+F3
Lowercase selection  Ctrl+F4
Sort
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Copy                 Ctrl+Ins
Cut                  Shift+Del
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Style...             Ctrl+Y
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Proof
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Print mark...
:exmp.
:font facename=default.
:p.The second popup is displayed when clicking inside a "non-char"
mark, that is, a "block" or "line" mark.  It contains the following
options:
:font facename=Courier size=14x14.
:xmp.
Unmark               Alt+U
Delete mark          Alt+D
Fill mark
Reflow mark
Uppercase selection  Ctrl+F3
Lowercase selection  Ctrl+F4
Sort
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Shift left 1         Ctrl+F7
Shift left 2
Shift left 3
Shift right 1        Ctrl+F8
Shift right 2
Shift right 3
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Copy                 Ctrl+Ins
Cut                  Shift+Del
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Style...             Ctrl+Y
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Proof
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
Print mark...
:exmp.
:font facename=default.
:p.The third popup is displayed when clicking outside a mark.  That
is, a mark exists, but you are "outside".  It contains the following
options:
:font facename=Courier size=14x14.
:xmp.
Copy mark
Move mark    Alt+M
Overlay mark
Adjust mark  Alt+A
컴컴컴컴컴컴컴컴컴
Unmark       Alt+U
:exmp.
:font facename=default.
:p.This fourth popup is displayed when there's no mark in the current
ring.  It contains the following options:
:font facename=Courier size=14x14.
:xmp.
Mark word        Alt+W
Mark identifier  Ctrl+W
Find identifier
컴컴컴컴컴컴컴컴컴컴컴컴�
Uppercase word   Ctrl+F1
Lowercase word   Ctrl+F2
컴컴컴컴컴컴컴컴컴컴컴컴�
Center line      Shift+F5
Scroll to top
:exmp.
:font facename=default.
:p.The fifth (and last) popup is usually associated with the third
mouse button (if any), and contains the following "generic" options:
:font facename=Courier size=14x14.
:xmp.
Paste                 Shift+Ins
~Import text file...
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
~Save                 F2
~Rename...            F7
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
~Make
~Build all
컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
~Print file...
Search...             Ctrl+S
:exmp.
:font facename=default.
:note.The "Make" and "Build all" options are not yet completed.
:p.If you want to modify these popup menus, you'll have to edit
:hp2.mpopup.rc:ehp2., and to rebuild MPOPUP's resources.  If you want
to add an option, you may have to define a corresponding
"accelerator", via the :hp2.buildacceltable:ehp2. function.
(Please, do not use accelerators values in range 9200..9299, as they
may by used in upcoming versions of MLEPM.)
:p.:hp2.Highlighting-Related Functions:ehp2.
:p.:link reftype=hd res=108.mfind:elink., :link reftype=hd
res=109.mfindfunction:elink., :link reftype=hd res=110.mgo:elink.,
:link reftype=hd res=117.mloadattributes:elink., :link reftype=hd
res=118.mnext:elink., :link reftype=hd res=119.mnextfunction:elink.
and :link reftype=hd res=126.msaveattributes:elink..
:p.:hp2.Miscellaneous:ehp2.
:p.:link reftype=hd res=105.mautoindent:elink., :link reftype=hd
res=137.mdebug:elink., :link reftype=hd res=115.mindentline:elink.,
:link reftype=hd
res=123.mquicksave:elink., :link reftype=hd res=138.mmarkarea:elink.
:link reftype=hd
res=127.msetfilemode:elink., :link reftype=hd
res=129.msetstatusline:elink., :link reftype=hd res=132.newtop:elink.
and :link reftype=hd res=135.show&us.mode&us.hook:elink..
:h1.Editing Modes
:lm margin=1.
:p.MLEPM includes many editing modes, and you can easily add your own.
:ul compact.
:li.:link reftype=hd res=200.cmode:elink.
:li.:link reftype=hd res=201.emode:elink.
:li.:link reftype=hd res=141.htmlmode:elink.
:li.:link reftype=hd res=202.listmode:elink.
:li.:link reftype=hd res=203.pmode:elink.
:li.:link reftype=hd res=204.rcmode:elink.
:li.:link reftype=hd res=205.rexxmode:elink.
:eul.
:h2 res=200.The C/C++ Mode
:p.This mode could be used while editing C or C++ files.  It provides
autoindentation, autohighlighting, and autoexpansion.  It defines the
following functions:
:ul compact.
:li.C&us.mode
:li.c&us.load&us.hook
:li.mhilite&us.C&us.mark
:li.:link reftype=hd res=107.mcindentstyle:elink.
:li.indent&us.C&us.line
:eul.
:p.It redefines the following key:
:ul compact.
:li.Alt+1
:eul.
:p.Turning autoexpansion off (EXPAND OFF) does not turn
autohighlighting off, but you'll lose the benefits of autoindentation.
The standard EPM auto-expansion may appears annoying at first, but you
can
now tailor it with :hp2.mcindentstyle:ehp2., and it's easy to become
'addicted'...
:p.By default, CMODE recognize the following extensions:
:xmp.
      C H PH IH SQC CPP HPP CXX XH XPH XIH
:exmp.
:p.If you want to use CMODE while editing a file with another
extension, you can use the :hp2.C&us.mode:ehp2. function.  It will
switch the current editing mode to be CMODE.
:p.The Alt+1 combination allows you to edit a file specified in a
:hp2.#include:ehp2. directive:
:xmp.
   #include "foo.h"
   #include <os2.h>
:exmp.
:p.Pressing Alt+1 on the first line will search foo.h in the current
directory, while pressing Alt+1 over the second will search os2.h
along the INCLUDE environment variable.
:h2 res=201.The E Mode
:p.This mode could be used while editing E files.  It provides
autoindentation and autoexpansion.  It defines the following
functions:
:ul compact.
:li.E&us.mode
:li.e&us.load&us.hook
:li.indent&us.E&us.line
:eul.
:p.This editing mode does not specifies specific highlighting hints.
If you want to use autohighlighting in E files, you'll have to use,
for example, the MLHILITE package.
:p.Turning autoexpansion off (EXPAND OFF) does turn autoindentation
off, too.
:p.By default, EMODE recognize the 'E' extension only.  If you want to
use EMODE while editing a file with another extension, you can use the
:hp2.E&us.mode:ehp2. function.  It will switch the current editing
mode to be EMODE.
:h2 res=141.HTML Mode

:p.:hp8.Not completed yet:ehp8.

:p.This mode adds HTML-specific functions.  It can be used in
conjunction with EBOOKIE (it's in fact recommended).

:p.It provides the following functions:
:ul compact.
:li.HTML_mode
:li.html_load_hook
:li.html_style
:li.html_tabify
:li.mpopup_HTML_menu
:eul.

:p.This mode defines a contextual menu, which allows easy access to
its functions.

:p.By default, HTMLMODE recognize both 'HTM' and 'HTML' extensions.  If
you want to use HTMLMODE while editing a file with another extension, you
can use the :hp2.HTML_mode:ehp2. function.  It will switch the current
editing mode to be HTMLMODE.

:p.There's currently only two functions, :hp2.html_style:ehp2. and
:hp2.html_tabify:ehp2..

:p.:hp2.html_style:ehp2. is used to surround the current mark with a
beginning an ending delimiter, derived from its parameter.  For example,
:xmp.
  html_style STRONG
:exmp.
:p.adds :hp2.<STRONG>:ehp2. and :hp2.</STRONG>:ehp2. around the current
mark (or it simply inserts it if there's no mark in the current file).

:p.:hp2.html_tabify:ehp2. converts a coma- and semicolon-delimited list
into a HTML table.  For example, if you have:
:xmp.
title1, title2, title3;
item11, ,item13;
item21;
,item32
:exmp.
:p.It will be translated in:
:xmp.
<table border>
<tr><td>title1</td> <td>title2</td> <td>title3</td></tr>
<tr><td>item11</td> <td></td>       <td>item13</td></tr>
<tr><td>item21</td></tr>
<tr><td></td>       <td>item32</td></tr>
</table>
:exmp.
:p.[',' is the column delimiter and ';' is the row delimiter.]

:h2 res=202.The List Mode
:p.This mode could be used while browsing 'list' file (that is, files
like 00index.txt...).  It allows you to easily select one or more
line.  It can compute the total required size, and things like that...
:p.It redefines the following three keys:
:dl compact.
:dthd.:hp7.Key
:ddhd.Definition:ehp7.
:dt.Space
:dd.Toggle the current line state (selected or not).  It also updates
the status line.
:dt.U
:dd.Unselect all lines.  It also updates the status line.
:dt.L
:dd.Popups a list containing all selected lines.
:edl.
:p.It defines the following two functions:
:ul compact.
:li.List_mode
:li.list&us.load&us.hook
:eul.
:p.By default, LISTMODE recognize the 'LIST' and '00INDEX.TXT'
extensions.  If you want to use the LISTMODE while editing a file with
another extension, you can use the :hp2.List&us.mode:ehp2. function.
It will switch editing mode to be LISTMODE.
:p.LISTMODE modifies the status line to be:
:xmp.
      Line %l of %s   nnn Items selected  [xxx bytes] List mode   %m
:exmp.
:p.This mode is not totally completed yet.  Namely, the item count and
size is lost between sessions.  And, the size is the sum of the first
number in all selected lines.  It would be great to allow it to be
customizable.
:h2 res=203.The Pascal Mode
:p.This mode could be used while editing Pascal files.  It provides
autoindentation and autoexpansion.  It defines the following
functions:
:ul compact.
:li.Pascal&us.mode
:li.p&us.load&us.hook
:eul.
:p.This editing mode does not specifies specific highlighting hints.
If you want to use autohighlighting in Pascal files, you'll have to
use, for example, the MLHILITE package.
:p.Turning autoexpansion off (EXPAND OFF) does turn autoindentation
off, too.
:p.By default, PMODE recognize the 'PAS' and 'PASCAL' extension only.
If you want to use PMODE while editing a file with another extension,
you can use the :hp2.Pascal&us.mode:ehp2. function.  It will switch the
current editing mode to be PMODE.
:h2 res=204.The RC Mode
:p.This mode could be used while editing RC (i.e., resource script)
file.  It provides autoindentation, autoexpansion and optionally
auto-capitalization of keywords.  It defines the following functions:
:ul compact.
:li.RC&us.mode
:li.rc&us.load&us.hook
:li.indent&us.RC&us.line
:eul.
:p.This editing mode does not specifies specific highlighting hints.
If you want to use autohighlighting in resources files, you'll have to
use, for example, the MLHILITE package.
:p.Turning autoexpansion off (EXPAND OFF) does turn autoindentation
off, too.
:p.By default, RCMODE recognize the 'RC' and 'DLG' extension only.  If
you want to use RCMODE while editing a file with another extension,
you can use the :hp2.RC&us.mode:ehp2. function.  It will switch the
current editing mode to be RCMODE.
:h2 res=205.The REXX Mode
:p.This mode could be used while editing REXX scripts (i.e.,
command files).  It provides autoindentation and autoexpansion. It
defines the
following functions:
:ul compact.
:li.REXX&us.mode
:li.rexx&us.load&us.hook
:li.indent&us.REXX&us.line
:eul.
:p.This editing mode does not specify specific highlighting hints.
If you want to use autohighlighting in resources files, you'll have to
use, for example, the MLHILITE package.
:p.Turning autoexpansion off (EXPAND OFF) does turn autoindentation
off, too.
:p.By default, REXXMODE recognize the following extensions:
:xmp.
      BAT CMD EXC EXEC ERX XEDIT
:exmp.
:p.If you want to use REXXMODE while editing a file with another
extension, you can use the :hp2.REXX&us.mode:ehp2. function.  It will
switch the current editing mode to be REXXMODE.
:h1.MLEPM Commands
:p.All functions names are prefixed with an "m", in order to prevent
name-clash with future (possible) EPM functions.  (We can't expect
them to share the same definition, can we? &colon.-)
:p.Whenever a function has the string "hilite" in it, this string can
be replaced with "highlight".  And if a part of a function name is
enclosed in square-brackets, this part is optional.  So, the function
:xmp.
        mhilite[file]
:exmp.
:p.stands for
:xmp.
        mhilite, mhighlight, mhilitefile and mhighlightfile
:exmp.
:p.MLEPM adds the following commands:
:p.:link reftype=hd res=139.fake&us.autosave:elink.
.br
:link reftype=hd res=100.hilite&us.load&us.hook:elink.
.br
:link reftype=hd res=101.hilite&us.modify&us.hook:elink.
.br
:link reftype=hd res=102.load&us.hook:elink.
.br
:link reftype=hd res=103.maddhook:elink.
.br
:link reftype=hd res=104.mautohilite:elink.
.br
:link reftype=hd res=105.mautoindent:elink.
.br
:link reftype=hd res=140.mautosave:elink.
.br
:link reftype=hd res=106.mcallhook:elink.
.br
:link reftype=hd res=107.mcindentstyle:elink.
.br
:link reftype=hd res=137.mdebug:elink.
.br
:link reftype=hd res=108.mfind:elink.
.br
:link reftype=hd res=109.mfindfunction:elink.
.br
:link reftype=hd res=110.mgo:elink.
.br
:link reftype=hd res=111.mhilite[file]:elink.
.br
:link reftype=hd res=112.mhiliteadd:elink.
.br
:link reftype=hd res=113.mhiliteclr:elink.
.br
:link reftype=hd res=114.mhilitedef:elink.
.br
:link reftype=hd res=115.mindentline:elink.
.br
:link reftype=hd res=116.minitializehook:elink.
.br
:link reftype=hd res=117.mloadattributes:elink.
.br
:link reftype=hd res=138.mmarkarea:elink.
.br
:link reftype=hd res=118.mnext:elink.
.br
:link reftype=hd res=119.mnextfunction:elink.
.br
:link reftype=hd res=120.modify&us.hook:elink.
.br
:link reftype=hd res=121.mpackhilite:elink.
.br
:link reftype=hd res=122.mpopupmenu:elink.
.br
:link reftype=hd res=123.mquicksave:elink.
.br
:link reftype=hd res=124.mrehilite[file]:elink.
.br
:link reftype=hd res=125.mrevcallhook:elink.
.br
:link reftype=hd res=126.msaveattributes:elink.
.br
:link reftype=hd res=127.msetfilemode:elink.
.br
:link reftype=hd res=128.msethook:elink.
.br
:link reftype=hd res=129.msetstatusline:elink.
.br
:link reftype=hd res=130.munhilite[file]:elink.
.br
:link reftype=hd res=131.munhilitemark:elink.
.br
:link reftype=hd res=136.mversion:elink.
.br
:link reftype=hd res=132.nextop:elink.
.br
:link reftype=hd res=133.save&us.hook:elink.
.br
:link reftype=hd res=134.select&us.hook:elink.
.br
:link reftype=hd res=135.show&us.mode&us.hook:elink.
.* Functions (alphabetical order)
:h2 res=139.fake&us.autosave
:p.Syntax
:p.  :hp4.fake&us.autosave:ehp4.
:p.This hook is used to replace EPM default autosave feature.  You
have to use it if you want to use on-the-fly highlighting with EPM
v5.60+ (with EPM v5.51a, you only have to use it if you want autosave
with autohighlighting).
:xmp.
        maddhook 'modify&us.hook 'fake&us.autosave
:exmp.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=100.hilite&us.load&us.hook
:p.Syntax
:p.  :hp4.hilite_load_hook:ehp4.
:p.This hook is used to find out a file's language.  Add this hook on
load_hook:
:xmp.
        maddhook load_hook hilite_load_hook
:exmp.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=101.hilite&us.modify&us.hook
:p.Syntax
:p.  :hp4.hilite_modify_hook:ehp4.
:p.This hook enables autohighlighting.  Add this hook on
:hp2.modify_hook:ehp2.&colon.
:xmp.
        maddhook modify_hook hilite_modify_hook
:exmp.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=102.load&us.hook
:p.Syntax
:p.  :hp4.load_hook:ehp4.
:p.This hook is called whenever a new file is loaded (or renamed).
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=103.maddhook
:p.Syntax
:p.  :hp4.maddhook:ehp4. hook function
:p.This function adds the function :hp2.function:ehp2. to the
:hp2.hook:ehp2. function list.  Be careful, hooks are case-sensitive.
:p.Example:
:xmp.
        maddhook load_hook default_load
:exmp.
:p.This example adds the default_load function to the load_hook
function list.  The default_load function will be called whenever the
load_hook will be called (that is, whenever a file is loaded or
named).
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=104.mautohilite
:p.Syntax
:p.  :hp4.mautohilite:ehp4.
:p.This command actives or deactivates autohighlighting.  The following
parameters are allowed:  on, off, 0, 1 or nothing.
:p.Examples:
:xmp.
        mautohilite
        mautohilite on
:exmp.
:p.The first example shows the current state.  The second sets
autohighlighting mode on.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=105.mautoindent
:p.Syntax
:p.  :hp4.mautoindent:ehp4. [|on|off]
:p.This command sets the indentation mode (on by default).  If no
parameters are given, it shows the current indentation state.
Autoindentation is mode-dependant.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=140.mautosave
:p.Syntax
:p.  :hp4.mautosave:ehp4. [#### | ON | OFF | ? | DIR]
:p.Use MAUTOSAVE to display or set the autosave values.  The
parameters are:
:dl compact.
:dt.[none]
:dd.Displays the current values on the message line, and places an
MAUTOSAVE command in the command window where you can change it.
:dt.####
:dd.Sets the current autosave count to the specified number.
:dt.ON
:dd.Sets the current autosave count to the default value.
:dt.OFF
:dd.Sets the current autosave count to 0, turning off autosaves.
:dt.?
:dd.Displays the current values in a window, with a button you can
select to list all files in the autosave directory.
:dt.DIR
:dd.Lists all files in the autosave directory.
:edl.
:p.The autosave values displayed are the autosave count (after this
many changes are made to the file, an automatic save is done to a
temporary file) and the autosave file name (the file which is saved
whenever the autosave count is reached).  The default autosave count
is set through the Configure window.  The autosave path is also set in
the Configure window; the autosave file name is constructed from the
autosave path, the current file name, and a unique 3-digit extension.
:p.You must issue this command from the Command window.
:note.Use this function in place of EPM's autosave when dealing with
automatically highlighted files.
:p.Package:  :hp4.MLHOOK:ehp4.
:h2 res=106.mcallhook
:p.Syntax
:p.  :hp4.mcallhook:ehp4. hook
:p.This function calls every functions of the :hp2.hook:ehp2.
function list, in the first-inserted, first-executed order.  You can
use this function with your own hooks.  This function is used for
"entry" hooks.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=107.mcindentstyle
:p.Syntax
:p.  :hp4.mcindentstyle:ehp4. n
:p.This command modifies the C-code indentation style.  Three styles
are actually recognized (-1 is the default):
:xmp.
        1        int dummy(int a)        3        int dummy(int a)
                 {                                {
                   int b;                           int b;

                   if(a)                            if(a)
                     {                              {
                     b=a;                             b=a;
                     }                              }
                   else                             else
                     b=a+1;                           b=a+1;
                 }                                }

        2        int dummy(int a)
                 {
                   int b;

                   if(a) {
                     b=a;
                   }
                   else
                     b=a+1;
                 }
:exmp.
:p.If :hp2.n:ehp2. is negative, braces will not be automatically
added.
:p.Example:
:xmp.
        mcindentstyle 2
:exmp.
:p.The second indent style will be used (it does not "reflow" the
previously entered code.)
:p.Package: :hp4.CMODE:ehp4.
:h2 res=137.mdebug
:p.Syntax
:p.  :hp4.mdebug:ehp4.
:p.This function puts all MLEPM-related debug information in a
temporary file (.mlepm).
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=108.mfind
:p.Syntax
:p.  :hp4.mfind:ehp4. start_fid dest_fid style
:p.This function copies the first line of items of style :hp2.style:ehp2.
, from :hp2.start_fid:ehp2. to :hp2.dest_fid:ehp2..
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=109.mfindfunction
:p.Syntax
:p.  :hp4.mfindfunction:ehp4.
:p.This function pops up a listbox containing all functions defined in
current file, with option to jump to a specific function.  A function
is something which has the "Function" style.  If a function spans on
more than one line, only the first line is shown in the listbox.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=110.mgo
:p.Syntax
:p.  :hp4.mgo:ehp4. style string
:p.This function locates the specified :hp2.string:ehp2. with the given
:hp2.style:ehp2. in current file.  If the string is found, the cursor
is moved.  Otherwise, nothing occurs.  :hp2.string:ehp2. should be the
beginning of the desired style.  :hp2.mgo:ehp2. finds the first
matching string.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=111.mhilite[file]
:p.Syntax
:p.  :hp4.mhilite[file]:ehp4.
:p.This command highlights the current file.  If the file's language
has a specific highlight function, this function is used.  Otherwise,
language's rules are used.  A specific highlight function is a
function whose name follows the format:
:xmp.
        'mhilite_'language'_mark'
:exmp.
:note.The CMode package defines such a function, :hp2.mlhilite_C_mark:ehp2..
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=112.mhiliteadd
:p.Syntax
:p.  :hp4.mhiliteadd:ehp4. language level style expr
:p.This command defines a new language rule.  If :hp2.language:ehp2.
has not be previously defined, an error occurs.  :hp2.level:ehp2.
is an integer (in range 1..4) which defines the "priority" of the
rule.  Level 1 is the highest priority.  (See example below for more
explanations on levels.)  :hp2.style:ehp2. is any style defined in the
"Style..." dialog box (reachable via the Edit menu).  Specifying an
unknown style name is not an error -- but no style will be assigned
to the matching expressions in files.  (Styles ARE case-sensitive.)
 :hp2.expr:ehp2. is a string which specifies the matching expressions.
Its format is:
:xmp.
        <delim>expr1<delim>[expr2<delim>]
:exmp.
:p.where :hp2.<delim>:ehp2. is any character, and :hp2.expr1:ehp2. a
regular expression.  (If present, :hp2.expr2:ehp2. is a regexp, too.)
 A matching expression is defined by expr1, or, if expr2 is present,
included between expr1 and expr2.
:p.Examples:
:xmp.
        mhiliteadd REXX 1 Commentaire _/\*_\*/_
        mhiliteadd REXX 4 Function ~^[a-zA-Z_][a-zA-Z0-9_]*&colon.~
:exmp.
:p.The first line defines a rule which matches a REXX comment.  The
language is REXX, the level is 1, the style name is "Commentaire", and
the expression is composed of a "_" delimiter, a first expression,
"/\*" and a second one, "\*/".  The first expression matches the REXX
opening comment, and the second matches the closing comment token.
Note the "\" character in front of "*", as both expressions are
regular expressions.
:p.The second line defines a REXX label, that is, something which
starts on column 1, composed of letters, digits or underscores, and
immediately followed by "&colon.".  Note that the REXX label rule
level is 4, too.  This means that, if a text matching the rule (A) is
found inside a region of text which has already been matched by a rule
(B) of a higher level, the rule (A) will not be applied on this
matching occurrence.  While I realize it's not that clear &colon.),
let me try an example.  Suppose we have the following REXX fragment:
:xmp.
        /* bla bla bla
        foo: ggffggf
        bar: 940401
        */
        baz:
:exmp.
:p.The first rule matches the comment ("/* bla ...  */"), and the
second matches "baz&colon.".  It does not match "foo&colon." nor
"bar&colon.", as theses two expressions are in a region of text which
as been recognized by our first rule (of a higher level).
:p.So, here is the golden rule on levels:
:p."A rule of a level l does not apply to an expression if this
expression is enclosed in an expression matched by a rule of a level m
<= l."
:p.Note the "<="; It means that the rules' order is important in a
given level.  Rules are tried in a first-defined/first-tried order.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=113.mhiliteclr
:p.Syntax
:p.  :hp4.mhiliteclr:ehp4. language [level]
:p.This command erases rules defined for a specified language.  If
:hp2.language:ehp2. has not been previously defined, an error occurs.
If :hp2.level:ehp2. is given, only rules of level :hp2.level:ehp2.
will be removed; otherwise, ALL rules will be removed.
:p.Example:
:xmp.
        mhiliteclr REXX 4
:exmp.
:p.It will remove the "REXX label" rule (assuming we were using the
previously defined samples statements.)
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=114.mhilitedef
:p.Syntax
:p.  :hp4.mhilitedef:ehp4. language extensions
:p.This command defines a new language, or redefines an existing one.
A file whose extension matches one in :hp2.extensions:ehp2. will be
handled with the rules defined for :hp2.language:ehp2..  If an
extension is part of more than one language, the last defined language
will win the race.  Extensions are case-insensitive.
:p.Example:
:xmp.
        mhilitedef REXX CMD ERX
:exmp.
:p.It defines the REXX language.  Files ending with ".cmd" or ".erx"
will be recognized as "REXX" files.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=115.mindentline
:p.Syntax
:p.  :hp4.mindentline:ehp4.
:p.This function indents the current line.  It's mode dependant.  It
can be assigned to a key; put the following in your profile if you
want to assign it to the tab key:
:xmp.
        buildaccel '*' 0 9 1236 mindentline
        activateaccel
:exmp.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=116.minitializehook
:p.Syntax
:p.  :hp4.minitializehook:ehp4.
:p.This function forces the load_hook to be executed.  It's required
by the silly EPM profile.erx handling, as, when calling epm,
command-line specified files are loaded before profile.erx is
executed.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=117.mloadattributes
:p.Syntax
:p.  :hp4.mloadattributes:ehp4. [Not yet completed]
:p.This function loads current file attributes from its EAs.  It
supports the new (compact) attribute format.  It can read attributes
from an old EPM file, though...
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=138.mmarkarea
:p.Syntax
:p.  :hp4.mmarkarea:ehp4. [mouse]
:p.This function marks the current area/token.  If :hp2.mouse:ehp2. is
1, then it uses current mouse position.  Otherwise, it uses current
cursor position.
:p.If the current position is over a "balanceable" symbol, then the
so delimited area is marked.  A balanceable symbol is one of:
:xmp.
        ()[]{}'"
:exmp.
:p.Otherwise, it acts like :hp2.marktoken:ehp2..
:note.This function is bound to Ctrl+W by default.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=118.mnext
:p.Syntax
:p.  :hp4.mnext:ehp4. style [P]
:p.This function locates the next (or previous, if P is specified)
item of style :hp2.style:ehp2..  If such an item is found, the cursor
is moved.  Otherwise, nothing occurs.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=119.mnextfunction
:p.Syntax
:p.  :hp4.mnextfunction:ehp4. [P]
:p.This function locates the next (or previous, if P is specified)
function header.  If such a function is found, the cursor is moved.
Otherwise, nothing occurs.  This function can be assigned to a key,
allowing you quick movements in your files.  Put the following in your
profile.erx if you want to assign "mnextfunction P" to Alt+up_arrow
and "mnextfunction" to Alt+down_arrow:
:xmp.
        buildaccel '*' 34 24 1234 mnextfunction
        buildaccel '*' 34 22 1235 mnextfunction P
        activateaccel
:exmp.
:p.[34 stands for AF_VIRTUALKEY+AF_ALT, 24 is the down_arrow keycode,
and 22 is the up_arrow keycode.  1234 and 1235 can be any numbers, but
they have to be unique.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=120.modify&us.hook
:p.Syntax
:p.  :hp4.modify_hook:ehp4.
:p.This hook is called whenever a file is modified.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=121.mpackhilite
:p.Syntax
:p.  :hp4.mpackhilite:ehp4. [Not yet completed]
:p.This command packs highlight-attributes, in order to save space and
time while saving attributes.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=122.mpopupmenu
:p.Syntax
:p.  :hp4.mpopupmenu:ehp4. [menu]

:p.:hp8.Due to a bug in EPM v6.00c, you cannot assign a user-defined
action to MB2.  In fact, if you do a single clic with mouse button 2,
EPM's default popup menu is always displayed.  If you want the
user-defined action to take place, use a modifier (like Shift, Ctrl
or Alt) or press the button a bit longer.  (This may have been
corrected in newer version, I don't know.):ehp8.

:p.This function popups a menu.  The popped up menu depends on the
cursor location and the current editing mode.

:p.If the current editing mode defines a
:xmp.
        'mpopup_'language'_menu'
:exmp.
:p.function, then it is called and the corresponding popup menu is
displayed.  If no such function has been defined, a default menu is
used (who actually depends on the cursor position and selection
state).

:p.Depending on your EPM version, the definition of mode dependant
menu varies:

:ul compact.
:li.If you're using EPM v5.51a (or earlier), you'll have to edit
:hp2.mpopup.rc:ehp2., add a new popup menu and rebuild MPOPUP's
resources.  If you want to add an option, you may have to define a
corresponding "accelerator", via the :hp2.buildacceltable:ehp2.
function.  (Please, do not use accelerators values in range
9200..9299, as they may by used in upcoming versions of MLEPM.)
:p.The function must then call the :hp2.mpopup:ehp2. function, with
the menu ID as its unique parameter.  For example:
:xmp.
defc mpopup_C_menu
compile if EVERSION < 5.60
   'MH_gotoposition'
   call mpopup(1234)
compile else
   -- ...
compile endif
:exmp.
:li.If you're using EPM v5.60 (or higher), then simply define a popup
menu and show it:
:xmp.
defc mpopup_C_menu
compile if EVERSION < 5.60
   -- ...
compile else
   universal activemenu, previouslyactivemenu

   if previouslyactivemenu = '' then
      previouslyactivemenu = activemenu
   endif
   menuname = 'popup1'
   activemenu = menuname

   deletemenu menuname, 0, 0, 0
   buildsubmenu  menuname, 80, '', '', 0 , 0
   'MH_gotoposition'
   ch = substr(textline(.line), .col, 1)
   gray_if_space = 16384*(ch=' ')
   buildmenuitem menuname, 80, 8000, 'Mark word'\9'Alt+W',      'MARKWORD', 0, mpfrom2short(HP_POPUP_MARKWORD, gray_if_space)
   buildmenuitem menuname, 80, 8001, 'Mark token'\9'CtrL+W',    'MARKTOKEN', 0, mpfrom2short(HP_POPUP_MARKTOKEN, gray_if_space)
   showmenu menuname,1
compile endif
:exmp.
:eul.

:p.If the :hp2.menu:ehp2. parameter is used, it is passed to the
mode-dependant function.  It allows you to use 3-buttons mouse, for
example, with different menus for each button.

:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=123.mquicksave
:p.Syntax
:p.  :hp4.mquicksave:ehp4. [|on|off]
:p.This command sets the quicksave mode (on by default).  When in
quicksave mode, using the F2 key saves the file, but not its
attributes.
:p.This is much faster than the standard save, so it can be use for
intermediate saves (say, before compiling...).
:note.It does NOT reset the .modify counter -- this gives you the
opportunity to save the file with its attributes later.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=124.mrehilite[file]
:p.Syntax
:p.  :hp4.mrehilite[file]:ehp4.
:p.This command first unhighlights the file, and then rehighlights
it.  It's just the same as issuing :hp2.munhilite:ehp2. followed by
:hp2.mhilite:ehp2..
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=125.mrevcallhook
:p.Syntax
:p.  :hp4.mrevcallhook:ehp4. hook
:p.This function calls every functions of the hook function list, in
the last-inserted, first-executed order.  You can use this function
with your own hooks.  This function is used for "exit" hooks.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=126.msaveattributes
:p.Syntax
:p.  :hp4.msaveattributes:ehp4. [Not yet completed]
:p.This function save the current file attributes in its EAs.  They
are saved in the new (compact) attribute format.
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=127.msetfilemode
:p.Syntax
:p.  :hp4.msetfilemode:ehp4. filemode
:p.This function sets the current file mode.  It can be any string
(but a short one is recommended, though...).  The filemode will be
shown on the statusline if this statusline contains "%t".
:p.Example:
:xmp.
        msetfilemode 'C++ mode'
:exmp.
:p.The current file mode will now be "C++ mode".  This string will
appears in the statusline if it contains "%t".  (The show_mode_hook
has to be in effect.)
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=128.msethook
:p.Syntax
:p.  :hp4.msethook:ehp4. hook function
:p.This function clears the hook function list, and sets
:hp2.function:ehp2. as the only member of the hook function list.
Use this function with great care.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=129.msetstatusline
:p.Syntax
:p.  :hp4.msetstatusline:ehp4. newstatusline
:p.This function replaces the old :hp2.setstatusline:ehp2..  Same
usage, same effects (it just remembers the actual statusline value).
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=130.munhilite[file]
:p.Syntax
:p.  :hp4.munhilite[file]:ehp4.
:p.This command unhighlights the current file.  That is, all
attributes are removed from the file.
:note.It removes bookmarks, too.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=131.munhilitemark
:p.Syntax
:p.  :hp4.munhilitemark:ehp4.
:p.This command unhighlights the current mark.  That is, all
attributes are removed from the mark.
:p.Package: :hp4.MLHILITE:ehp4.
:h2 res=136.mversion
:p.Syntax
:p.  :hp4.mversion:ehp4.
:p.This command displays current MLEPM version.
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=132.nextop
:p.Syntax
:p.  :hp4.newtop:ehp4.
:p.This function makes the current line the top-line.  It's used by a
popupmenu option (Scroll to top).
:p.Package: :hp4.MLTOOLS:ehp4.
:h2 res=133.save&us.hook
:p.Syntax
:p.  :hp4.save_hook:ehp4. [not yet implemented]
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=134.select&us.hook
:p.Syntax
:p.  :hp4.select_hook:ehp4.
:p.This hook is called whenever a file is selected (that is, when a
file becomes active).
:p.Package: :hp4.MLHOOK:ehp4.
:h2 res=135.show&us.mode&us.hook
:p.Syntax
:p.  :hp4.show_mode_hook:ehp4.
:p.This hook is used to display the file mode in the statusline.  If
you want to have the current file mode displayed in the status line,
put the following in your profile.erx:
:xmp.
        maddhook 'select_hook 'show_mode_hook
:exmp.
:p.and define a new statusline, which contains '%t':
:xmp.
        msetstatusline 'Line %l of %s  Column %c   %f   %i     %m %t'
:exmp.
:p.If no file mode is defined, 'Text mode' will appear.
:p.[Using hooks requires a hook-package, eg MLHOOK, to be linked.]
:p.Package: :hp4.MLTOOLS:ehp4.
:h1.Changing the Default Configuration
:p.[Not yet completed...]

:p.If you want to change the default configuration, the first place to
look at is your :hp2.profile.erx:ehp2. file.  In it, you can
[re]define many things, including all highlighting rules, key
bindings, etc.  In fact, all functions described herein can be called
from your profile.

:p.If you want to change some settings for a specific file (like the
default tab width or margins, you can use the standard ADD_EA function to
specify EPM.TABS and EPM.MARGINS values).

:p.But it's true you cannot always customize an editing mode the way
you like (say, if you want a different indentation scheme, or ...).
To do that, you have to edit the corresponding editing mode.

:h1.Creating New Editing Modes
:p.[Not yet completed...]

:p.Editing modes are .EX files, loaded from :hp2.profile.erx:ehp2., so
you have to have a minimum E knowledge, and, most importantly, an E
compiler (ETPM).

:p.The easiest way to create a new editing mode is to copy and adapt
an already existing editing mode (be lazy &colon.-).

:p.MLEPM includes some editing modes, for mainstream languages:

:xmp.
emode.e
pmode.e
rcmode.e
rexxmode.e
cmode.e
listmode.e
:exmp.

:p.The first four modes are very simple to understand.  The fifth,
CMODE, is more complex, as it defines an "highlighting hint", to help
the highlighting process (it is used to highlight function headers,
which are hard to find with regular expressions).  The last mode,
LISTMODE, is somewhat different, in that it's not really an editing
mode -- it's here to gives you ideas of what can be done.

:p.:hp2.Editing modes basics:ehp2.

:p.The first question is "What's that, and what can be done?". The
answer is that it's generally a key map and possibly a set of
functions.  It can do many things, but it most commonly provides
syntax expansion and automatic indentation.  It can also be used to
define mode-dependant menus, or ...

:p....

:h1.Key Definitions Summary
:p.MLEPM does not redefines many keys.  Anyway, here are the
"Standard" keys [re]defined by MLTOOLS, :hp2.profile.erx:ehp2.,
C&us.Mode and MATCHKEY, respectively:
:dl tsize=20 compact.
:dthd.:hp7.Key
:ddhd.Definition:ehp7.
:dt.F2
:dd.:link reftype=hd res=123.mquicksave:elink.
.br
This key allows you to quickly save a file, if :hp2.mquicksave:ehp2.
is enabled.  If not, the usual behavior occurs.
:dt.Ctrl+W
:dd.:link reftype=hd res=138.mmarkarea:elink.
.br
This key allows you to quickly mark a delimited token/area.
:dt.Alt+UpArrow
:dd.:link reftype=hd res=119.mnextfunction P:elink.
.br
This key allows you to go to the previous function header.  If such a
header does not exists, nothing occurs.
:dt.Alt+DownArrow
:dd.:link reftype=hd res=119.mnextfunction:elink.
.br
This key allows you to go to the next function header.  If such a
header does not exists, nothing occurs.
:dt.Alt+1
:dd.This key allows you to edit the file named on current line.  When
editing a C/C++ file, it understands the "#include" directive.  That
is, if the current line is "#include <os2.h>" it will search
:hp2.os.h:ehp2. along the :hp2.INCLUDE:ehp2. path, and if the current
line is "#include "os2.h"", :hp2.os2.h:ehp2. will be searched in the
current directory.
:dt.(
:dd."()"
:dt.[
:dd."[]"
:dt.{
:dd."{}"
.br
This key is also redefined by CMODE.
:dt.), ], }
:dd.These keys temporarily highlight the corresponding matching token.
If the matching token is out of display, the containing line will
be shown in the message area.  And, if there's no matching token,
"Matching token not found" is displayed instead.
:edl.
:h1.A Sample PROFILE.ERX
:p.This section describes a sample PROFILE.ERX.  Each section of the
file is followed by an explanation.  (Refer to your version-dependant
version, PROFILE.551 or PROFILE.600, for version-specific hints.)

:font facename=Courier size=14x14.
:xmp.
/* profile.erx                                               950918 */
/*                                                                  */
/* This file is executed whenever you start EPM                     */

/* defining useful constants                                        */
MYPATH = ''
MYACCEL = 9300
:exmp.
:font facename=default.
:p.If, for any reason, you don't want to put MLEPM's .EX files
somewhere along your EPMPATH, you can set MYPATH to the directory
they reside in (don't forget the ending backslash, as in
"d&colon.&bsl.src&bsl.epm&bsl.emacros&bsl.").
:p.MYACCEL is used below, when defining accelerators.  9300 is a good
value, as it does not interfere with EPM's predefined values.
:font facename=Courier size=14x14.
:xmp.
/* Linking additional EPM modules                                   */
link MYPATH'MATCHKEY'
link MYPATH'MLHOOK'
link MYPATH'MLTOOLS'
link MYPATH'MLHILITE'
link MYPATH'CMODE'
link MYPATH'EMODE'
link MYPATH'REXXMODE'
link MYPATH'RCMODE'
/* link MYPATH'PMODE'  -- commented out as I don't use Pascal...    */
link bkeys
:exmp.
:font facename=default.
:p.In the previous section, we link all needed files.  If you don't
need a specific mode, just comment-out or remove the corresponding
line.  :hp2.bkeys:ehp2. is EBOOKIE, a great editing mode for "tagged"
files (such as IPF).  It's available from software.watson.ibm.com in
/pub/os2/epm/EBOOKE.ZIP.
:p.We don't have to link standard .EX (such as EPM.EX and EXTRA.EX);
they're already loaded.
:font facename=Courier size=14x14.
:xmp.
/* C/C++ and highlighting Mode hook                                 */
msethook 'modify_hook 'hilite_modify_hook
maddhook 'load_hook   'hilite_load_hook
maddhook 'load_hook   'c_load_hook
maddhook 'load_hook   'e_load_hook
maddhook 'load_hook   'rexx_load_hook
maddhook 'load_hook   'rc_load_hook
:exmp.
:font facename=default.
:p.The first hook enables on-the-fly highlighting (remember, MLPOPUP
should be running for this to work).  The second hook enables generic
mode recognition.  The next four hooks enable specific mode
recognition.
:font facename=Courier size=14x14.
:xmp.
/* I like mode in status line                 (here )              */
msetstatusline 'Line %l of %s  Column %c   %f   %i  %t     %m'
maddhook 'select_hook 'show_mode_hook
:exmp.
:font facename=default.
:p.This section redefines the status line, and add mode name in it.
You have to redefines the status line with the :hp2.msetstatusline:ehp2.
function if you want to display the mode name.  Do not use the
:hp2.setstatusline:ehp2. function.
:font facename=Courier size=14x14.
:xmp.
/* Defining global keys                                             */
buildaccel '*' 34 24 MYACCEL+1 mnextfunction
buildaccel '*' 34 22 MYACCEL+2 mnextfunction P
buildaccel '*' 34 23 MYACCEL-1 ml_hilite_line
activateaccel
:exmp.
:font facename=default.
:p.The first two lines define nice shortcut keys (namely, Alt+UpArrow
and Alt+DownArrow, which allows you to go to the preceding and
following function, respectively).
:p.The third line is required if you want to use on-the-fly
highlighting.  If you have redefined MYACCEL in the first section of
this PROFILE, use 9299 instead of MYACCEL-1.  If you use another
value, on-the-fly highlighting will NOT work.
:font facename=Courier size=14x14.
:xmp.
/* Adding a 'Headers...' item in the Search menu for mfindfunction  */
buildmenuitem 'default 3 2997 \0 4 0 mfindfunction'
buildmenuitem 'default 3 2998 Headings... 0 0 mfindfunction'
showmenu default
:exmp.
:font facename=default.
:p.The first line adds a separator at the end of the "Search" menu.
The second line adds a "Headings..." item next to it.  This item is
associated with the :hp2.mfindfunction:ehp2. function.  The last line
activates the newly defined menu.
:font facename=Courier size=14x14.
:xmp.
/* Defining mouse bindings (popup menus)                            */
register_mouse 1 2 CLICK 0 mpopupmenu 0
register_mouse 1 3 CLICK 0 mpopupmenu 10
:exmp.
:font facename=default.
:p.The first line defines the MB2 popup menu.  If you don't have a
3-key mouse, remove the second line, or change it so that it will
assign the MB3 popup menu to, say, Shift+MB2, or whatever you like.
(To do that, change the value which follows CLICK: it is 0 for no
Shift, or the sum of any combination of 1 for the Shift key, 2 for
the Ctrl key, and 4 for the Alt key.)
:font facename=Courier size=14x14.
:xmp.
/* Highlighting schemes                                             */
:exmp.
:font facename=default.
:p.The following sections define highlighted sequences.  Feel free to
tailor them, but keep in mind that more than five regexps can induce a
long highlighting time...
:p.[Please note that the following examples are for EPM v5.51a only.
EPM v5.60 and higher use extended regular expressions, so you have to
backslash parents, etc.]
:font facename=Courier size=14x14.
:xmp.
/* C, C++ */
mhilitedef C 'C H PH IH SQC CPP HPP CXX XH XPH XIH'
mhiliteadd C 1 'Commentaire' '_/\*_\*/_'
mhiliteadd C 1 'Commentaire' '_//.*_'
mhiliteadd C 4 'Case' '_^[ \t]*case .*_'
mhiliteadd C 4 'Directive' '_#[ \t]*[^d].*_'

/* Standard ML */
mhilitedef ML 'SML'
mhiliteadd ML 1 'Commentaire' '_(\*_\*)_'

/* E macros */
mhilitedef E 'E'
mhiliteadd E 1 'Commentaire' '_/\*_\*/_'
mhiliteadd E 1 'Commentaire' '_--.*_'
mhiliteadd E 1 'Commentaire' '_^;.*_'
mhiliteadd E 4 'Function' '_^def.*_'
mhiliteadd E 4 'Directive' '_^[ \t]*compile.*_'

/* Rexx macros */
mhilitedef REXX 'CMD ERX'
mhiliteadd REXX 1 'Commentaire' '_/\*_\*/_'
mhiliteadd REXX 4 'Case' '_when.*then_'
mhiliteadd REXX 4 'Function' '~^[a-zA-Z_][a-zA-Z0-9_]*&colon.~'

/* Scheme */
mhilitedef SCHEME 'SCM'
mhiliteadd SCHEME 1 'Commentaire' '_;.*_'
mhiliteadd SCHEME 4 'Function' '_(define (.*_'

/* IDL (SOM, ...) */
mhilitedef OIDL 'IDL CSC SC PSC CS2'
mhiliteadd OIDL 1 'Commentaire' '_/\*_\*/_'
mhiliteadd OIDL 1 'Commentaire' '_//.*_'
mhiliteadd OIDL 1 'Commentaire' '_--.*_'
mhiliteadd OIDL 1 'Commentaire' '_# .*_'
mhiliteadd OIDL 4 'Case' '~^[a-zA-Z].*&colon.~'

/* DOS (SYS BAT) */
mhilitedef DOS 'SYS BAT'
mhiliteadd DOS 1 'Commentaire' '_^REM.*_'

/* IPF (IPF, IPP) */
mhilitedef IPF 'IPF IPP'
mhiliteadd IPF 1 'Commentaire' '_^\.\*.*_'
mhiliteadd IPF 4 'Function' '_^&colon.h[0-3].*_'

/* Take ride of the silly (imho) EPM profile handling               */
minitializehook

'sayerror Profile processed'
:exmp.
:font facename=default.
:p.The :hp2.minitializehook:ehp2.  statement is REQUIRED.  I mean
it&xclm.  Do not remove it, or else MLEPM would not recognize
pre-loaded files.
:euserdoc.
