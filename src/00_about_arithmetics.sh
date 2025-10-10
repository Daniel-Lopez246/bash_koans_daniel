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

# Perform arthimetric evulation '1+1' and store in 'output2'
  output2=$((1+1))

# This is verifying that 'output2' matches the expected value, thus checking if arthimetric evulation command substitution worked
  assertEqual $output2 2

}
