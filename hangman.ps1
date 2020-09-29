class Hangman{
    [char[]]$guessingWord = "hangman";
    [char[]]$underscoresArr = $this.guessingWord.foreach{ "_" };
    [char[]]$guesses;
    [int]$isWrong = 1;
    [int]$wrongGuesses = 0;
    
    [void] UpdateWord($newWord){
        $this.guessingWord = $newWord;
        $this.underscoresArr = $this.guessingWord.foreach{ "_" };
    }
    
    [string] DisplayHangman(){
        switch ($this.wrongGuesses){
            0 {
                return "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |        |    |`n
                |        |    |`n
                |        |    |`n
                |             |`n
                |=============|`n";
            }

            1 { 
                return "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |        |    |`n
                |        |    |`n
                |             |`n
                |=============|`n" ;
            }

            2 { 
                return  "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |    |   |    |`n
                |        |    |`n
                |             |`n
                |=============|`n" ;
            }

            3 {
                return  "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |   /|   |    |`n
                |        |    |`n
                |             |`n
                |=============|`n" ;
            }

            4 { 
                return "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |   /|\  |    |`n
                |        |    |`n
                |             |`n
                |=============|`n";
            }

            5 { 
                return "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |   /|\  |    |`n
                |   /    |    |`n
                |             |`n
                |=============|`n";
            }

            6 { 
                return "`t`t|=============|`n
                |   HANGMAN   |`n
                |=============|`n
                |    +---+    |`n
                |    |   |    |`n
                |    O   |    |`n
                |   /|\  |    |`n
                |   / \  |    |`n
                |             |`n
                |=============|`n";
            }
            
            default {
                return "Error";
            }
        }
        return "Error";
    }

    [string] DisplayUnderscoresArr(){
        return $this.underscoresArr -join " ";
    }
    
    [void] Play(){
        Write-Host $this.DisplayHangman();
        Write-Host $this.DisplayUnderscoresArr();

        while($this.wrongGuesses -lt 6){
            $this.isWrong = 1;
            $guess = Read-Host "Guess";

            # Checks if letter is not already guessed
            if ($guess -in $this.guesses){
                Write-Host ("You already guessed `"{0}`"" -f $guess);
            }
            else{
                # Adding the guess to already guessed letters
                $this.guesses += $guess;
                for ($i = 0; $i -lt $this.guessingWord.length; $i++){
                    if ($this.guessingWord[$i] -eq $guess){
                        $this.underscoresArr[$i] = $guess;
                        $this.isWrong = 0;
                    }
                }
                $this.wrongGuesses += $this.isWrong;
                # Displaying
                Clear-Host;
                Write-Host $this.DisplayHangman();
                Write-Host $this.DisplayUnderscoresArr();
            }

            # Check if the word is guessed
            if ([string]$this.underscoresArr -eq [string]$this.guessingWord){
                Write-Host "Congratulations,`nYou guessed the word";
                break;
            }
        }
    }
}


$Game = [Hangman]::new();
$Game.UpdateWord("powershell");
$Game.Play();
