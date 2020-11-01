function Invoke-LoanDepot {
<#
.SYNOPSIS
  
  Challenge instructions:  Create a powershell function or cmdlet that takes 
  an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns 
  the first recurring character in that Input string. In 'abcdedcba', 'd' 
  would be the first recurring character, so the cmdlet/function should 
  return 'd' for that sample input.
  
.DESCRIPTION

  Cmdlet receives string input and breaks string into a fixed array. Each
  character is referenced in a dictionary and added if not found. If a
  match is found, that character is returned.

.EXAMPLE

  Invoke-LoanDepot -foo 'abcdedcba'

  d

  This example maps to the challenge instructions.

.NOTES

  * Spaces and special characters will be evaluated if included in the input.
  A future update could add a parameter to regex out all non alphanum.

  * If part of a larger project, code could be refactored into a class.

  Author:    Colyn Via
  Date:      10/31/2020
  Version:   1.0
#>
    [CmdletBinding()]
    param (
        [ValidateNotNullOrEmpty()]
        [Alias('foo')]
        [Parameter(mandatory=$true)]
        [String]
        $String
    )

    [hashtable]$CharacterMap = @{}

    $split = $String -split ""

    for($x=1; $x -lt $split.count; $x++){
        $char = $split[$x]
        if($CharacterMap.ContainsKey($char)){
            return $char
        }
        $CharacterMap.add($char,'')
    }

    Write-Verbose 'No duplicate char found.'
}
