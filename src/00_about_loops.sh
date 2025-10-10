lesson_title 'Loops'

test_for_loops() {
  # Declare a local variable named 'sum' (starts empty)
  local sum
  # _ is a (rather obscure) dummy variable (used for throwaway values)
  # $(seq 1 10) generates the numbers 1 through 10.
  for _ in $( seq 1 10 ); do
    # Increment 'sum' each time through the loop
    (( sum++ ))
  done
  # After 10 iterations, sum should equal 10
  assertEqual $sum 10
}

test_while_loops() {
  counter=0
  while [ $counter -lt 5 ]; do
    (( counter++ ))
  done

  assertEqual $counter 5
}


test_until_loops() {
  counter=10
  until [ $counter -lt 7 ]; do
    (( counter-- ))
  done

  assertEqual $counter 6
}
