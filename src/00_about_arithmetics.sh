lesson_title "Arithmetic evaluation"

test_arithmetic_evaluation() {
  local output
  local output2

# shellcheck disable=SC2116
  output=$(echo 1+1)
# 'echo 1+1' is executed and the result is given to 'output'

# 'assertEqual' is checking if variable 'output' and '__' are equal
# This is verifying that 'output' matches the expected value, thus checking if command substitution worked
  assertEqual "$output" '1+1'

  output2=$((1+1))

  assertEqual $output2 __

}
