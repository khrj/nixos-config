{ ... }: 

{
    services.dunst = { 
        enable = true;
        settings = {
            global = {
                monitor = 0;
                follow = "mouse";
                geometry = "250x50-24+24";
                indicate_hidden = true;
                shrink = false;
                separator_height = 0;
                padding = 16;
                horizontal_padding = 24;
                frame_width = 2;
                sort = false;
                idle_threshold = 120;
                font = "Noto Sans 8";
                line_height = 4;
                markup = "full";
                format = "<b>%s</b>\n%b";
                alignment = "left";
                show_age_threshold = 60;
                word_wrap = true;
                ignore_newline = false;
                stack_duplicates = false;
                hide_duplicate_count = true;
                show_indicators = false;
                icon_position = "off";
                sticky_history = true;
                history_length = 20;
                browser = "/usr/bin/env chromium";
                always_run_script = true;
                title = "Dunst";
                class = "Dunst";
            };
            shortcuts = {
                close = "ctrl+space";
                close_all = "ctrl+shift+space";
                history = "mod4+grave";
                context = "ctrl+shift+period";
            };
            urgency_low = {
                background = "#2f343f";
                foreground = "#d8dee8";
                timeout = 2;
            };
            urgency_normal = {
                background = "#2f343f";
                foreground = "#d8dee8";
                timeout = 4;
            };
            urgency_critical = {
                background = "#2f343f";
                foreground = "#d8dee8";
                frame_color = "#bf616a";
                timeout = 0;
            };
        };
    };
}