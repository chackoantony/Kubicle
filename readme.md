### Environment 

Ruby 3.0.0
### Run program
`$ ./optimus_grime 5x5 1,3 4,4`

### Run tests 

`$ ruby test_runner.rb`

### Algorithm

The algorithm computes offset and direction for navigation by subtracting the next point's coordinates from the current point's coordinates. Then moves according to following rules.

* if X offset is positive move offset times east. 
* if X offset is negative move offset times west.
* if Y offset is positive move offset times north.
* if Y offset is negative move offset times south.