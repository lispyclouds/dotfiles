--[[
                        WX0kxol:;,,           ,;:lodk0XW
                   WNKkdc;,                           ;cokKNW
                WXOdc,            ,;;;::::;;;,            ,:oOXW
             WNOo:         ;codkO0KXXXNNNNXXXK0Okdoc;         ;oOXW
           WKxc         ,oOXNW                    WNX0xc         :xKW
         WKd;           ,oKW                          W0:          ;dKW
       WXx;               :OW                          0:            ;dKW
      NOc      :do,        ;xN                         0:              :kN
     Xd,     ;xXWNk:        ,oKW                       0:        ::     ,oKW
   WKl     ,oKW   WKl         :OW                      0:       ,xKo,     c0W
  W0c     ;xN       Xx;        ;xN                     0:       ,kWNk:     :OW
 W0c     :OW         WO:         lKW                   0:       ,kW W0c     :0W
 Xl     :OW           WKo         :OW                  0:       ;OW  W0c     cK
Nx,    ;OW              Nx;        ,dX                 O;       ;0    W0:     oN
O:    ,dN              NKx;          lKW              Wk,       cK     Wk,    ;k
o     cK            WXkl,             :kXN            Nd        lX      Xl     l
:    ,xW           Nkc                 ,:dX           Kc       ,xW      Wk,    ;
,    ;0          WKo,        ;l:          l0W        Nd,       cK        Kc
     cK         W0c        ;xKWXd,         :kN      Wk;       ;kW        Xl
     lX         0c        l0W   Nk:         ,dX    Nx;       ,dN         No
     lX        Kl        lK      W0l          c0WN0l,       ,dN          No
     cK       Nx,       c0         Xd,         ;lc,        :kN           Kc
,    ;OW      Kc       ,xW          Nk:                  ;dKW           WO;    ,
c     dN     Wk,       :0            WKl,              :dKW             Nd     :
x,    :OW    Nd        lX              X0d,          lkXW               0:     d
Kc     lX    No        oN                NO:         lKW               Xo     :0
WO;     dN   No        dN                 WKl         :OW             Nx,    ,kW
 Nx,    ,dN  Xl        dN                   Xx;        ;xN           Nx,    ,dN
  Nd,    ,oX Xl        dN                    WO:         lKW        Xd,     oX
   Nd,     c0Xl        dN                     WKl         :ON     WKl     ,dX
    Nk;     ;o:        dN                       Nx;        ,dX   Xx:     ;xN
     W0c               dN                        WOc         l0Xkc      cOW
       Xx;             dN                         WKo,        ;:,     ;dXW
        WKd;           dN                           Nx;             ,o0W
          WKd;         c0NW                          Nk;          ;o0N
            WXkc,       ,:oxOKXNW              WNXKOxo:,       ,cxKW
               N0dc,         ,;clodxxkkkkkkxxdolc;,         ,:d0N
                  NKko:,                                ,:lx0NW
                     WN0kdl:;,                     ,:ldk0XW
                          WX0kdl:,,          ,,:cox0XWW
--]]

vim.o.shadafile = "NONE"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("nvim is bootstrapping.")

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

vim.filetype.add({
  extension = {
    edn = "clojure",
    tfvars = "hcl",
  },
})

require("general")
require("ux")
require("mappings")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logipat",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "rrhelper",
        "spec",
        "tar",
        "tarPlugin",
        "vimball",
        "vimballPlugin",
      },
    },
  },
})

vim.o.shadafile = ""
