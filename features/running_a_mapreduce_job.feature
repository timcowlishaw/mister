Feature: Running a Mapreduce job
  In order to process large amounts of data quickly
  As a Ruby programmer
  I want to run a script as a distributed computation on a cluster of machines

  Scenario: Uploading a text file and running the word count job on it
    Given I am running a single-machine mister cluster
    And the file "example.txt" contains the following data
      """
      The integral z-squared dz
      From one to the cube root of 3
      Times the cosine
      Of three pi over nine
      Is the log of the cube root of e.
      """
    And I have uploaded the file "example.txt" to the cluster
    When I run the job "wordcount.rb" on the file "example.txt"
    And I download the file "wordcount.out" from the cluster
    Then I should see the following data in the output file "wordcount.out"
      |the        |4|
      |of         |3|
      |cube       |2|
      |root       |2|
      |3          |1|
      |From       |1|
      |Is         |1|
      |Of         |1|
      |The        |1|
      |Times      |1|
      |cosine     |1|
      |dz         |1|
      |e.         |1|
      |integral   |1|
      |log        |1|
      |nine       |1|
      |one        |1|
      |over       |1|
      |pi         |1|
      |three      |1|
      |to         |1|
      |z-squared  |1|

