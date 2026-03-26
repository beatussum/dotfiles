{
  configurations.home.modules.yazi = {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";

      settings = {
        mgr = {
          ratio = [ 2 5 3 ];
          sort_by = "natural";
          sort_translit = true;
          mouse_events = [ "click" "scroll" "drag" ];
        };
      };
    };
  };
}
