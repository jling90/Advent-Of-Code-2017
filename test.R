assert <- function(fnc) {
    function (arg, expected) ifelse(fnc(arg) == expected, "yay", "no")
}