; brainfuck interpreter

#include <Arrays.au3>

Func elementof($x, $array)
	For $element In $array
		If $element = $x Then
			Return True
		EndIf
	Next
	Return False
EndFunc

$maxArray=30000 ; Size of usable Array
Dim $keywords[8]=["+","-","<",">",".",",","[","]"] ; All brainfuck keywords
Dim $ValueArray[$maxArray] ; Array to work with
Dim $JumpersOpen[1] ; Array for open jumping marks [
Dim $JumpersClosed[1] ; Array for closing jumping marks ]

Func Interpreter($key) ;Function interpretes the sourcecode
	Local $ret
	Switch $key
		Case "+"
			$ValueArray[$ptr] += 1
			$ret = 0
		Case "-"
			$ValueArray[$ptr] -= 1
			$ret = 0
		Case ">"
			$ptr += 1
			$ret = 0
		Case "<"
			If Not $ptr = 0 Then
				$ptr -= 1
				$ret = 0
			Else
				$ptr = $maxArray - 1
				$ret = 1
			EndIf
		Case "["
			$ret = 0
		Case "]"
			$ret = 0
		Case ","
			$ValueArray[$ptr] = ConsoleRead(False,True)
		Case "."
			$ret = ConsoleWrite(Chr($ValueArray[$ptr]))
		Case Else
			$ret = -1
	EndSwitch
	Return $ret
EndFunc