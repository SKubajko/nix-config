_: {
  # Better notifications (works together with noice)
  programs.nixvim.plugins.notify = {
    enable = true;

    stages = "slide";
    timeout = 2500;
    topDown = true;
    # render = {__raw = "\"wrapped-compact\"";};
  };
}
