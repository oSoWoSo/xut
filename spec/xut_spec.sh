#!/bin/sh

Describe 'xut basic usage'

  It 'Usage should be displayed when invoked without arguments'
    When run script ./xut
    The stdout should include 'Usage: xut [options]'
    The status should be failure
  End

  It 'Help should be displayed when run with -h argument'
    When run script ./xut -h
    The stdout should include 'OPTIONS'
    The status should be success
  End

End
