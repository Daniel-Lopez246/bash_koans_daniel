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
  # The function 'output_stdout' just runs: printf "out to stdout"
  # '2>' redirects stderr to a file.
  # '1>&2' redirects stdout (1) to the same destination as stderr (2).
  # Therefore, stdout will also go into tmp/redirect_test3.txt.
  output_stdout 2> tmp/redirect_test3.txt 1>&2

  # Create local variable 'contents' and assign the contents of the file we just wrote to.
  local contents=$(cat tmp/redirect_test3.txt)

  # The function should have written "out to stdout" to the file.
  assertEqual "$contents" "out to stdout"

}

test_redirecting_stderr_to_stdout() {
  # The function 'output_stderr' just runs: printf "out to stderr" 1>&2
  # '1>' redirects stdout to a file.
  # '2>&1' redirects stderr to the same place as stdout.
  # So both streams end up in tmp/redirect_test4.txt.
  output_stderr 1> tmp/redirect_test4.txt 2>&1

  # Create local variable 'contents' and assign the contents of the file we just wrote to.
  local contents=$(cat tmp/redirect_test4.txt)

  # The function should have written "out to stderr" to the file.
  assertEqual "$contents" "out to stderr"

}

test_redirecting_stdout_and_stderr_to_file() {
  # The function 'output_both' runs: printf "out to stdout" and printf "out to stderr" 1>&2
  # '1>' redirects stdout to tmp/redirect_test5.txt
  # '2>' redirects stderr to tmp/redirect_test6.txt
  # This keeps the two outputs separate.
  output_both 1> tmp/redirect_test5.txt 2> tmp/redirect_test6.txt

  # Create local variable 'contents5' and assign the stdout contents of the file we just wrote to.
  local contents5=$(cat tmp/redirect_test5.txt)
  # Create local variable 'contents6' and assign the stderr contents of the file we just wrote to.
  local contents6=$(cat tmp/redirect_test6.txt)

  # Verify that stdout and stderr each went to the correct file.
  assertEqual "$contents5" "out to stdout"
  assertEqual "$contents6" "out to stderr"

}
