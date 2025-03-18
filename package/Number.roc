module [humanize]

append_and_put_comma_if_needed = |partial_digit_list, next_digit|
    appended = List.append(partial_digit_list, next_digit)
    if
        List.len(partial_digit_list) % 4 == 2
    then
        List.append(appended, List.first(Str.to_utf8(",")) |> Result.with_default(0))
        # then appended
    else
        appended

chop_if_extra_comma = |digit_list, number_of_digits|
    if
        number_of_digits % 3 == 0
    then
        List.take_last(digit_list, ((number_of_digits) // 3) * 4 - 1)
    else
        digit_list

humanize : Num * -> Str
humanize = |number|
    number_string_list = Str.to_utf8(Num.to_str(number))
    number_of_digits = List.len(number_string_list)
    reversed = List.reverse(number_string_list)
    commas = reversed |> List.walk([], |l, cur| append_and_put_comma_if_needed(l, cur))
    commas
    |> List.reverse
    |> chop_if_extra_comma number_of_digits
    |> Str.from_utf8
    |> Result.with_default("")

expect humanize 1 == "1"
expect humanize 10 == "10"
expect humanize 100 == "100"
expect humanize 1000 == "1,000"
expect humanize 10000 == "10,000"
expect humanize 100000 == "100,000"
expect humanize 1000000 == "1,000,000"
expect humanize 10000000 == "10,000,000"
expect humanize 100000000 == "100,000,000"
expect humanize 1000000000 == "1,000,000,000"
expect humanize 10000000000 == "10,000,000,000"
expect humanize 100000000000 == "100,000,000,000"
expect humanize 1000000000000 == "1,000,000,000,000"
expect humanize 10000000000000 == "10,000,000,000,000"
expect humanize 100000000000000 == "100,000,000,000,000"
expect humanize 1000000000000000 == "1,000,000,000,000,000"
# 1846 Burling Street.
