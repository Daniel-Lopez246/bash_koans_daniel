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

  local test='zomg' # __

  if [ $test = 'ok' ]; then
    local assert='no'
  elif [ $test = 'zomg' ]; then
    local assert='YES'
  fi

  assertEqual $assert __

}

test_directory_if_conditions() {
  if [ -d src ]; then
    local assert='yes'
  fi

  assertEqual $assert __

  if [ ! -d NOT_EXISTENT_DIR ]; then
    local assert='no'
  fi

  assertEqual $assert __

}

test_file_if_conditions() {
  if [ -f README.md ]; then
    local assert='yes'
  fi

  assertEqual $assert __

}

# TODO add koans for 'man test' entries
