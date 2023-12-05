{ pkgs
, config
, lib
, ...
}:
with lib;
with builtins; let
  cfg = config.vim.languages.haskell;

  defaultServer = "hls";
  servers = {
    hls = {
      package = [ "haskell-language-server" ];
      lspConfig = ''
        lspconfig.hls.setup {}
      '';
    };
  };
in
{
  options.vim.languages.haskell = {
    enable = mkEnableOption "Haskell language support";

    treesitter = {
      enable = mkOption {
        description = "Enable Haskell treesitter";
        type = types.bool;
        default = config.vim.languages.enableTreesitter;
      };
      package = nvim.options.mkGrammarOption pkgs "haskell";
    };

    lsp = {
      enable = mkOption {
        description = "Enable Haskell LSP support";
        type = types.bool;
        default = config.vim.languages.enableLSP;
      };
      server = mkOption {
        description = "Haskell LSP server to use";
        type = with types; enum (attrNames servers);
        default = defaultServer;
      };
      package = nvim.options.mkCommandOption pkgs {
        description = "Haskell LSP server";
        inherit (servers.${cfg.lsp.server}) package;
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.treesitter.enable {
      vim.treesitter.enable = true;
      vim.treesitter.grammars = [ cfg.treesitter.package ];
    })

    (mkIf cfg.lsp.enable {
      vim.lsp.lspconfig.enable = true;
      vim.lsp.lspconfig.sources.haskell-lsp = servers.${cfg.lsp.server}.lspConfig;
    })
  ]);
}
