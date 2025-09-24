{ pkgs, ... }: {
  # channel = "stable-24.05"; # keep stable or switch to "unstable" for newer base pkgs
  channel = "unstable";

  packages = [
    pkgs.jdk21
    pkgs.unzip
    pkgs.flutter

    pkgs.androidsdk
    pkgs.androidsdkplatformtools
    pkgs.androidsdktools
    pkgs.androidemulator
  ];

  env = {};

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];
    workspace = {
      onCreate = { };
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };
  };
}
