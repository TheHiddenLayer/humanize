module [humanize]

ByteUnit : [Byte, KiloByte, MegaByte, GigaByte, TeraByte, PetaByte, ExaByte]

units = [
    { value: 1000000000000000000, unit: ExaByte },
    { value: 1000000000000000, unit: PetaByte },
    { value: 1000000000000, unit: TeraByte },
    { value: 1000000000, unit: GigaByte },
    { value: 1000000, unit: MegaByte },
    { value: 1000, unit: KiloByte },
    { value: 1, unit: Byte },
]

unit_to_str : ByteUnit -> Str
unit_to_str = |unit|
    when unit is
        Byte -> "B"
        KiloByte -> "KB"
        MegaByte -> "MB"
        GigaByte -> "GB"
        TeraByte -> "TB"
        PetaByte -> "PB"
        ExaByte -> "EB"

humanize : U64 -> Str
humanize = |bytes|
    when List.find_first units (|u| bytes >= u.value) is
        Ok({ value, unit }) ->
            amount = Num.div_trunc(bytes, value)
            amount_as_str = Num.to_str amount
            unit_as_str = unit_to_str unit
            "${amount_as_str} ${unit_as_str}"

        _ -> "0 B"

# Tests
expect humanize 0 == "0 B"
expect humanize 1 == "1 B"
expect humanize 12 == "12 B"
expect humanize 123 == "123 B"
expect humanize 1234 == "1 KB"
expect humanize 12345 == "12 KB"
expect humanize 123456 == "123 KB"
expect humanize 1234567 == "1 MB"
expect humanize 12345678 == "12 MB"
expect humanize 123456789 == "123 MB"
expect humanize 1234567890 == "1 GB"
expect humanize 12345678901 == "12 GB"
expect humanize 123456789012 == "123 GB"
expect humanize 1234567890123 == "1 TB"
expect humanize 12345678901234 == "12 TB"
expect humanize 123456789012345 == "123 TB"
expect humanize 1234567890123456 == "1 PB"
expect humanize 12345678901234567 == "12 PB"
expect humanize 123456789012345678 == "123 PB"
