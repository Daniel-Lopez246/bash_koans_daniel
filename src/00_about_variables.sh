# About environment variables

lesson_title "Variables"

test_setting_the_variable() {
  # Declare a local variable named 'variable' and assign 1
  local variable=1
  # Check that the value of 'variable' is 1
  assertEqual 1 $variable
}

test_using_double_quotes() {
  # Declare a local variable named 'variable' and assign 2
  local variable=2
  # Double quotes allow variable expansion
  assertEqual "foo $variable" "foo 2"
}

test_unsetting_variables() {
  # Declare a local variable named 'newVariable' and assign "Foooo"
  local newVariable="Foooo"
  # unset removes the variable's value
  unset newVariable
   # After unsetting, the variable is empty
  assertEqual $newVariable ""
}

# Variables defined in global namespace are available everywhere
# Declare a global variable named 'THIS_VARIABLE_IS_GLOBAL' and assign 42
THIS_VARIABLE_IS_GLOBAL=42
test_global_variables() {
  # Access the global variable directly inside a function
  assertEqual $THIS_VARIABLE_IS_GLOBAL 42
}

# In this function we define a global variable, it becomes available outside
function_with_a_global_variable() {
  # Declare a global variable named 'THIS_VARIABLE_IS_GLOBAL' and assign 42
  THIS_VARIABLE_IS_GLOBAL_FROM_A_FUNCTION=42
}
# Run the function
function_with_a_global_variable

test_global_variables_from_functions() {
  # Check that the variable defined inside the function is now globally accessible
  assertEqual $THIS_VARIABLE_IS_GLOBAL_FROM_A_FUNCTION 42
}

# In this function we define a local variable, it is not accessible outside
function_with_a_local_variable() {
  # Declare a local variable named 'THIS_VARIABLE_IS_LOCAL' and assign 42
  local THIS_VARIABLE_IS_LOCAL=42
}
# Run the function
function_with_a_local_variable

test_local_variables() {
  # Local variable is not visible outside its function, so it should be empty here
  assertEqual $THIS_VARIABLE_IS_LOCAL ""
}

test_variable_name_expansion_within_text() {
  # Declare a local variable named 'var1' and assign "myvar"
  local var1=myvar

  # __ = this_is_myvar_yay
  # ${var1} expands to "myvar", so this becomes "this_is_myvar_yay"
  assertEqual this_is_${var1}_yay this_is_myvar_yay

}

test_only_exported_variables_are_accessible_by_another_process() {
  # Declare a local variable named 'MY_EXPORTED_VARIABLE' and assign 43
  local MY_EXPORTED_VARIABLE=43

  # Variable was not exported, so process sees nothing
  assertEqual "$(support/variable_check)" ""

  # Declare a global variable named 'MY_EXPORTED_VARIABLE' and assign 43
  MY_EXPORTED_VARIABLE=43

  # Variable was not exported, so process sees nothing
  assertEqual "$(support/variable_check)" ""
  
  # Variable was exported
  export MY_EXPORTED_VARIABLE=43

  # Now the variable is exported and visible to processes
  assertEqual "$(support/variable_check)" 43
}

