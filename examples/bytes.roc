app [main!] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br",
    humanize: "../package/main.roc",
}

import cli.Stdout
import humanize.Byte

main! = |_|
    computerized = 1239871231
    humanized = Byte.humanize(computerized)
    Stdout.line! humanized
