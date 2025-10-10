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
  # Declare a global variable named 'counter' and assigned 0
  counter=0
  # The while loop runs as long as the condition inside [ ] is true
  # Here, it continues while 'counter' is less than 5
  while [ $counter -lt 5 ]; do
    # Increment 'counter' by 1 each iteration
    (( counter++ ))
  done

  # When the loop ends, counter should be 5 (since it stops once counter is no longer < 5)
  assertEqual $counter 5
}


test_until_loops() {
  # Declare a global variable named 'counter' and assigned 10
  counter=10
  # The 'until' loop runs until the condition inside [ ] becomes true
  # It keeps looping while counter is NOT less than 7
  until [ $counter -lt 7 ]; do
    # Decrement counter by 1 each iteration
    (( counter-- ))
  done

  # Loop exits when counter < 7 (first time this happens is when counter == 6)
  assertEqual $counter 6
}
