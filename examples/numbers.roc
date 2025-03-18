app [main!] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br",
    humanize: "../package/main.roc",
}

import cli.Stdout
import humanize.Number

main! = |_|
    List.range({ start: At(999999), end: At(1000001) })
    |> List.map Number.humanize
    |> Str.join_with ", "
    |> Stdout.line!

# This program's outputs:
#
# 999,999, 1,000,000, 1,000,001
