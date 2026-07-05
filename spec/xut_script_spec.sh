#!/bin/sh

Describe 'xut invocation as script'
  It 'Completes successfully with -sld arguments'
    When run script ./xut -sl
    The status should be success
  End

  It 'Completes update with -u argument'
    When run script ./xut -u
    The stdout should include 'Warning: No updates available'
    The status should be success
  End

  It 'Completes successfully with -x clean argument'
    When run script ./xut -x clean
    The status should be success
  End
End
