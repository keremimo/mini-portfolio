{ pkgs, lib, config, ... }:
{
  languages.ruby.enable = true;
  languages.ruby.version = "3.4.5";
  services.postgres.enable = true;
  services.postgres.initialScript = "CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres' SUPERUSER;";
  services.postgres.initialDatabases = [{ name = "hello_dev"; }]; packages = [ pkgs.git pkgs.openssl pkgs.libyaml] ++ lib.optionals pkgs.stdenv.isDarwin [ pkgs.libllvm ];
}

