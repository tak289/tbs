set nocompatible
set mouse="" 
set background=dark
syntax on

if exists("*ToggleBackground") == 0
        function ToggleBackground()
                if &background == "dark"
                        set background=light
                else
                        set background=dark
                endif
        endfunction

        command BG call ToggleBackground()
        map <F7> :BG<CR>
endif

if exists("*ToggleSyntax") == 0
        function ToggleSyntax()
                if exists("g:syntax_on") == "off"
                        syntax on
                else
                        syntax off
                endif
        endfunction

        command S call ToggleSyntax()
        map <F6> :S<CR>
endif

