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

vim.opt.shadafile = "NONE"

-- initial config
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.filetype.add({
  extension = {
    edn = "clojure",
  },
})

-- bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn
local pack_path = fn.stdpath("data") .. "/site/pack/packer/start"
local fmt = string.format
local ensure = function(user, repo)
  local install_path = fmt("%s/%s", pack_path, repo)

  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

ensure("wbthomason", "packer.nvim")
ensure("rktjmp", "hotpot.nvim")

require("hotpot").setup({
  provide_require_fennel = true,
  compiler = {
    modules = {
      correlate = true,
    },
  },
})

-- load remaining config in fennel
require("general")
require("ux")
require("plugins")
require("mappings")
require("persistent_undo")
require("whitespace")

vim.opt.shadafile = ""
