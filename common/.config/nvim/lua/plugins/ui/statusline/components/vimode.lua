local utils = require('heirline.utils')

local mode_display = {
    provider = function(self)
        return " %2(" .. self.mode_names[self.mode] .. "%)"
    end,
    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { bg = self.bg_colors[mode], fg = "surface0", bold = true, }
    end,
}

local l_brakcet = {
    provider = "",
    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.bg_colors[mode] }
    end
}

local r_brakcet = {
    provider = "",
    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.bg_colors[mode] }
    end
}

local vi_mode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    static = {
        mode_names = {
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },
        bg_colors = {
            n = "mauve",
            i = "green",
            v = "blue",
            V = "blue",
            ["\22"] = "blue",
            c = "yellow",
            s = "purple",
            S = "purple",
            ["\19"] = "purple",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "red",
        },
    },
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}

return utils.insert(vi_mode, l_brakcet, mode_display, r_brakcet)
