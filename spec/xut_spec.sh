#!/bin/sh

Describe 'xut basic usage'
  It 'shows usage when no arguments'
    When run script ./xut
    The stdout should include 'Usage:'
    The status should be success
  End

  It 'shows error when run as root'
    id() { echo 0; } # stub id to simulate root
    When run script ./xut
    The stdout should include 'Error:'
    The status should be failure
  End

  It 'shows help with -h'
    When run script ./xut -h
    The stdout should include 'OPTIONS'
    The status should be success
  End
End