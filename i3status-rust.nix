{ ... }: 

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        theme = "native";
        icons = "awesome5";
        blocks = [
          {
            block = "disk_space";
            format = "{icon} {used}/{total}";
            alert_absolute = true;
          }
          {
            block = "memory";
            format_mem = "{mem_total_used_percents}";
            format_swap = "{swap_used_percents}";
          }
          {
            block = "cpu";
          }
          {
            block = "speedtest";
            interval = 600;
            format = "{speed_down}";
          }
          {
            block = "temperature";
            interval = 10;
            format = "{average}";
            chip = "*-isa-*";
          }
          {
            block = "sound";
          }
          {
            block = "time";
            interval = 1;
            format = "%a %d %B %I:%M:%S %P";
          }
        ];
      };
    };
  };
}
