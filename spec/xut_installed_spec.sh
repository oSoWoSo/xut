#!/bin/sh

Describe 'xut invocation as installed command'

  It 'Completes installation with -sli arguments'
    When run script xut -sli fasd
    The stdout should include 'Usage:'
    The status should be success
  End

  It 'Completes update with -u argument'
    When run script xut -u
    The stdout should include 'Error:'
    The status should be failure
  End

  It 'Completes successfully with -x clean argument'
    When run script xut -x clean
    The stdout should include 'OPTIONS'
    The status should be success
  End

End
