#!/bin/sh

Describe 'xut root usage'

  It 'Error should be thrown when run as root'
    When run script ./xut
    The stdout should include 'Error: Please run the program as a user!'
    The status should be failure
  End

End
