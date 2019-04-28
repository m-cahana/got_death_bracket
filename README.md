# GOT Death Bracket
Here's the [bracket](https://docs.google.com/spreadsheets/d/1qO1VtPIcr4XO5EWyME2dB7oirR33QjUoLIR_AF8UK5A/edit?usp=sharing
). The rules are simple: 
1. Predict if each character will be (A) alive, (D) dead but not white walker, or (W) white walker *at the end of each episode.* 1 point for each correct answer.
2. Correctly answer bonus questions for tiebreakers.


To run the code in this repository, you'll need to set up a file called `paths.R` in the root. This file is ignored by git, and should specify your local Dropbox folder path like so:

```
dropbox <- "path"
```

You'll also need to set up a file called `paths.txt` in order to run the makefile in this repository. This file is also ignored by git, and should specify your local Dropbox folder path like so:

```
path
```

Once you set up `paths.R` and `paths.txt` files, you should be able to run this repository by typing `make` into your command line (making sure that you're located in the root of this repository when doing so). If you want to re-run the entire project from scratch, delete all files in the Dropbox folder "results" and execute `make`. 
