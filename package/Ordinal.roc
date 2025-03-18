module [humanize]

## Humanizes ordinal numbers
humanize : Int * -> Str
humanize = |ordinal|
    # determine suffix using a peculiar heuristic.
    suffix =
        if ordinal % 100 > 10 and ordinal % 100 < 14 then
            "th"
        else
            when ordinal % 10 is
                1 -> "st"
                2 -> "nd"
                3 -> "rd"
                _ -> "th"
    Str.concat (Num.to_str ordinal) suffix

expect humanize 1 == "1st"
expect humanize 2 == "2nd"
expect humanize 3 == "3rd"
expect humanize 4 == "4th"
expect humanize 10 == "10th"
expect humanize 11 == "11th"
expect humanize 12 == "12th"
expect humanize 13 == "13th"
expect humanize 14 == "14th"
expect humanize 21 == "21st"
expect humanize 22 == "22nd"
expect humanize 23 == "23rd"
expect humanize 24 == "24th"
expect humanize 100 == "100th"
expect humanize 111 == "111th"
expect humanize 112 == "112th"
expect humanize 113 == "113th"
expect humanize 121 == "121st"
expect humanize 122 == "122nd"
expect humanize 123 == "123rd"
expect humanize 1000 == "1000th"
expect humanize 1001 == "1001st"
expect humanize 1002 == "1002nd"
expect humanize 1003 == "1003rd"
