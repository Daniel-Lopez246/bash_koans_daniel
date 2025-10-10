lesson_title "Conditions"

test_if_condition() {

# Assigns 'ok' to local variable 'test'
  local test='ok'

# Check if variable 'test' equals 'ok'
# If true, assign 'YES' to variable 'assert'
  if [ $test = 'ok' ]; then
    local assert='YES'
  fi

# This is verifying that 'assert' is 'YES', which confirms the if condition executed correctly
  assertEqual $assert 'YES'
}


test_if_condition_with_else() {

# Assigns 'nope' to local variable 'test'
  local test='nope'

# Check if variable 'test' equals 'ok'
# If true, assign 'YES' to variable 'assert'
# Else, assign 'NO' to variable 'assert'
  if [ $test == 'ok' ]; then
    local assert='YES'
  else
    local assert='NO'
  fi

# This is verifying that 'assert' is 'NO', which confirms the if-else condition executed correctly
  assertEqual $assert 'NO'
}

test_if_condition_with_variables() {
# Assigns 'OMG' to local variable 'variable'
# Assigns 'OMG' to local variable 'condition'
  local variable="OMG"
  local condition='OMG' #__

# Check if variable 'variable' equals variable 'condition'
# If true, assign 'ok' to variable 'assert'
  if [  "$variable" = "$condition" ]; then
    local assert='ok'
  fi

# This is verifying that 'assert' is 'ok', which confirms the if condition executed correctly
  assertEqual $assert 'ok'

}

test_multiple_if_conditions() {

# Assigns 'zomg' to local variable 'test'
  local test='zomg' # __

# Check if variable 'test' equals 'ok'
# If true, assign 'no' to variable 'assert'
# Else If, check if variable 'test' equals 'zomg'
# If true, assign 'YES' to variable 'assert'
  if [ $test = 'ok' ]; then
    local assert='no'
  elif [ $test = 'zomg' ]; then
    local assert='YES'
  fi

# This is verifying that 'assert' is 'YES', which confirms the if-elif condition executed correctly
  assertEqual $assert 'YES'

}

test_directory_if_conditions() {
# Check if 'src' directory exists
# If true, assign 'yes' to 'assert'
  if [ -d src ]; then
    local assert='yes'
  fi

# This is verifying that 'assert' is 'yes', which confirms the directory existence check
  assertEqual $assert 'yes'

# Check if nonexistrnt directory does NOT exists
# If true, assign 'no' to 'assert'
  if [ ! -d NOT_EXISTENT_DIR ]; then
    local assert='no'
  fi

# This is verifying that 'assert' is 'no', which confirms the nondirectory existence check
  assertEqual $assert 'no'

}

test_file_if_conditions() {
# Check if 'README.md' file exists
# If true, assign 'yes' to 'assert'
  if [ -f README.md ]; then
    local assert='yes'
  fi

# This is verifying that 'assert' is 'yes', which confirms the file existence check
  assertEqual $assert 'yes'

}

# TODO add koans for 'man test' entries
