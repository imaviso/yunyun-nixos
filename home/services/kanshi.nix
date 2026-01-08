{
  lib,
  monitors ? [],
  ...
}: let
  # Convert transform number to string (kanshi uses degree strings)
  transformToString = t:
    if t == 0
    then "normal"
    else if t == 1
    then "90"
    else if t == 2
    then "180"
    else if t == 3
    then "270"
    else if t == 4
    then "flipped"
    else if t == 5
    then "flipped-90"
    else if t == 6
    then "flipped-180"
    else if t == 7
    then "flipped-270"
    else "normal";

  # Convert monitor to kanshi output config
  mkKanshiOutput = m:
    {
      criteria = m.name;
      mode = "${toString m.width}x${toString m.height}@${toString m.refreshRate}Hz";
      position = "${toString m.x},${toString m.y}";
    }
    // lib.optionalAttrs ((m.transform or 0) != 0) {
      transform = transformToString m.transform;
    };

  outputs = map mkKanshiOutput monitors;
in {
  services.kanshi = {
    enable = monitors != [];
    settings = lib.optionals (monitors != []) [
      {
        profile = {
          name =
            if builtins.length monitors > 1
            then "multi"
            else "single";
          inherit outputs;
        };
      }
    ];
  };
}
