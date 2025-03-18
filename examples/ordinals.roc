app [main!] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br",
    humanize: "../package/main.roc",
}

import cli.Stdout
import humanize.Ordinal

main! = |_|
    List.range({ start: At(1), end: At(50) })
    |> List.map Ordinal.humanize
    |> Str.join_with(", ")
    |> Stdout.line!

# This program's outputs:
#
# 1st, 2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th, 10th,
# 11th, 12th, 13th, 14th, 15th, 16th, 17th, 18th, 19th, 20th,
# 21st, 22nd, 23rd, 24th, 25th, 26th, 27th, 28th, 29th, 30th,
# 31st, 32nd, 33rd, 34th, 35th, 36th, 37th, 38th, 39th, 40th,
# 41st, 42nd, 43rd, 44th, 45th, 46th, 47th, 48th, 49th, 50th
#
# The actual output is on one line, but it is shown split up here for readability
