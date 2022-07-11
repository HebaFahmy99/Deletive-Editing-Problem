# Deletive-Editing-Problem-
Deletive Editing problem solved by using Prolog 
Daisy loves playing games with words. Recently, she has been playing the following Deletive Editing word game with Daniel.
Daisy picks a word, for example, "DETERMINED". On each game turn, Daniel calls out a letter, for example, 'E', and Daisy removes the first occurrence of this letter from the word, getting "DTERMINED". On the next turn, Daniel calls out a letter again, for example, 'D', and Daisy removes its first occurrence, getting "TERMINED". They continue with 'I', getting "TERMNED", with 'N', getting "TERMED", and with 'D', getting "TERME". Now, if Daniel calls out the letter 'E', Daisy gets "TRME", but there is no way she can get the word "TERM" if they start playing with the word "DETERMINED".
Daisy is curious if she can get the final word of her choice, starting from the given initial word, by playing this game for zero or more turns. Your task it help her to figure this out.

% deletiveEditing(Initial,End).
Each word consists of at least one and at most 30 uppercase English letters; Initial is the Daisy's initial word for the game; End is the final word that Daisy would like to get at the end of the game.
