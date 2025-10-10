lesson_title "Quoting"
# https://www.gnu.org/software/bash/manual/bashref.html#Quoting

# Sensei advice: First argument of the assert should not be touched

# =============================================================================
# https://www.gnu.org/software/bash/manual/bashref.html#Escape-Character
test_escape_character() {
    local EXAMPLE
    # A backslash at the end of a line escapes the newline, joining the next line.
    EXAMPLE=Use_no_escape_here_in_this_exam\
ple

    # So this becomes a single string "Use_no_escape_here_in_this_example"
    assertEqual $EXAMPLE "Use_no_escape_here_in_this_example"
}

# =============================================================================
# Sensei advice: Use single quotes in this function asserts
test_single_quotes() {
    # Single quotes preserve literal value of every character inside them.

    # \ escapes the space, so it's treated as part of the same word.
    assertEqual single\ quotes    'single quotes'
    # -------------------------------------------------------------------------
    # The dollar sign inside single quotes stays literal.
    assertEqual dollar_\$        'dollar_$'
    # -------------------------------------------------------------------------
    # A double quote inside single quotes stays literal.
    assertEqual Double_Quotes_\" 'Double_Quotes_"'
    # -------------------------------------------------------------------------
    # The backslashe inside single quotes stays literal.
    assertEqual backslash_\\     'backslash_\'
    # -------------------------------------------------------------------------
    # All literal characters stay unchanged, \ escapes a space here, nothing expands.
    assertEqual All_of_the_above_with_single_quotes\ \$\"\\ 'All_of_the_above_with_single_quotes $"\'
}

# =============================================================================
# Sensei advice: Use double quotes in this function asserts
test_double_quotes() {
    local D
    local EXAMPLE
    
    # Inside double quotes, spaces are preserved but variable expansion and command substitution can occur.
    assertEqual between_double\ quotes    "between_double quotes"
    # -------------------------------------------------------------------------
    # Here the backslash is not a literal, but the backslash turns "$" literal.
    D=nope
    assertEqual dollar_\$D        "dollar_\$D"
    # -------------------------------------------------------------------------
    # Here we want the value of "EXAMPLE", so we don't use the backslash on the $ inside double quotes.
    EXAMPLE=this_is_a_variable
    assertEqual example_$EXAMPLE  "example_$EXAMPLE"
    # -------------------------------------------------------------------------
    # You do not want to use backticks for command substitution, instead use $(...).
    assertEqual ".don't use backticks." ".$(echo don\'t use backticks)."
    assertEqual ".use this instead."    ".$(echo use this instead)."
    # -------------------------------------------------------------------------
    # Escaping single quotes inside double quotes is allowed.
    assertEqual Single_Quotes_\' "Single_Quotes_'"
    # -------------------------------------------------------------------------
    # Backslashes behave literally inside double quotes, unless used before certain characters. 
    assertEqual backslash_\\     'backslash_\'
    # -------------------------------------------------------------------------
    # Demonstrate combining all of the above within double quotes
    assertEqual All_of_the_above_with_double_quotes\ \$\"\\ "All_of_the_above_with_double_quotes $\"\\"
}

# =============================================================================
test_ansi_c_quoting() {
    local NEWLINE

    # -------------------------------------------------------------------------
    assertEqual $'\101' 'A' # Octal
    # -------------------------------------------------------------------------
    assertEqual $'\x41' 'A' # Hexadecimal
    # -------------------------------------------------------------------------
    assertEqual $'\u263A' '☺' # Unicode 2 bytes
    # -------------------------------------------------------------------------
    assertEqual $'\U0001F603' '😃' # Unicode 4 bytes
    # -------------------------------------------------------------------------
    NEWLINE="
"
    assertEqual "$NEWLINE" $'\n'
    # -------------------------------------------------------------------------
    HORIZONTAL_TAB="	"
    assertEqual "$HORIZONTAL_TAB" $'\t'
}

# =============================================================================
test_locale_specific_translation() {
    # Test translation quoting $"..." (for localization, rarely used)
    assertEqual "Deprecated and dangerous" $"In use and secure"
    # $"..." seems good for i18n but:
    #   http://www.gnu.org/software/gettext/manual/html_node/bash.html
    
    # $"..." is used for locale-based translations (gettext),
    # but it's deprecated and shown for demonstration only.

    # Use gettext instead:
    #   http://www.gnu.org/software/gettext/manual/gettext.html

    # It's better to use gettext for internationalization instead.
}
