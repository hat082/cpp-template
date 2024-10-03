# CPP DEV FLAKE
A basic template for cpp development modified from this repo: https://github.com/tfc/cpp-nix-2023/tree/part1

Usage:
```shell
git clone https://github.com/hat082/cpp-template.git --depth 1 <project name> && \
```

Then run:
```shell
direnv allow .
```

If language server doesn't work, try deleting `compile_commands.json`, and running:

```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && cp compile_commands.json ..
```
