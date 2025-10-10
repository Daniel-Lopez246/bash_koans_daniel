lesson_title "Redirection"

test_redirecting_stdout_to_file() {

  # The function 'output_stdout' writes text to stdout (file descriptor 1).
  # The function 'output_stdout' just runs: printf "out to stdout"
  # The '>' operator redirects stdout to a file.
  output_stdout > tmp/redirect_test.txt

  # Create local variable 'contents' and assign the contents of the file we just wrote to.
  local contents=$(cat tmp/redirect_test.txt)

  # The function should have written "out to stdout" to the file.
  assertEqual "$contents" "out to stdout"

}

test_redirecting_stderr_to_file() {
  # '2>' redirects stderr to a file.
  # The function 'output_stderr' just runs: printf "out to stderr" 1>&2
  # '1>&2' redirects stdout (1) to the same destination as stderr (2).
  # Therefore, stdout will also go into tmp/redirect_test3.txt.
  output_stderr 2> tmp/redirect_test2.txt

  # Create local variable 'contents' and assign the contents of the file we just wrote to.
  local contents=$(cat tmp/redirect_test2.txt)

  # The function should have written "out to stderr" to the file.
  assertEqual "$contents" "out to stderr"
}

test_redirecting_stdout_to_stderr() {
  output_stdout 2> tmp/redirect_test3.txt 1>&2

  local contents=$(cat tmp/redirect_test3.txt)

  assertEqual "$contents" "out to stdout"

}

test_redirecting_stderr_to_stdout() {
  output_stderr 1> tmp/redirect_test4.txt 2>&1

  local contents=$(cat tmp/redirect_test4.txt)

  assertEqual "$contents" "out to stderr"

}

test_redirecting_stdout_and_stderr_to_file() {
  output_both 1> tmp/redirect_test5.txt 2> tmp/redirect_test6.txt

  local contents5=$(cat tmp/redirect_test5.txt)
  local contents6=$(cat tmp/redirect_test6.txt)

  assertEqual "$contents5" "out to stdout"
  assertEqual "$contents6" "out to stderr"

}
