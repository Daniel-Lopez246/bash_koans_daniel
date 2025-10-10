lesson_title "Piping"

test_piping_output_to_another_program() {
  # The pipe lets you use the output of a program as the input of another one
  # The 'echo' outputs the string 'milk'.
  # That output is then passed to 'sed', which performs a text substitution.
  # The sed command 's/milk/beer/g' means:
  #   s → substitute
  #   milk → the text to find
  #   beer → the replacement text
  #   g → replace all occurrences (global)
  local output=$(echo 'milk' | sed -e "s/milk/beer/g")

  # The transformed output should now be "beer"
  assertEqual "$output" beer
}
