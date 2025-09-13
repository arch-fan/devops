{ pkgs, ... }:
{
    programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          theme = "autumn";
          editor = {
            cursor-shape.insert = "bar";
            auto-completion = true;
            true-color = true;
          };
        };
        languages = {
          language = [{
            name = "docker-compose";
            file-types = [{ glob = "compose.yml"; }];
          }];
        };
        extraPackages = with pkgs; [
          nixd
          docker-compose-language-service
          dockerfile-language-server-nodejs
          yaml-language-server
        ];
  };
}