### Tic Tac Toe
-------------------

This is an implementation of the popular Tic Tac Toe game using Ruby and applying Test Driven Development.

~~The main task was to make it unbeatable so I placed the logic which instead of predicting outcomes it simply reacts to the opponent's move by countering any possible traps and setting them up as well if possible.~~

##### Update

After endless reading and practise, I have implemented a basic version of the [Minimax algorithm](http://en.wikipedia.org/wiki/Minimax). By basic I mean it will not lose and occasionaly can pull of a nice trap but it can do with refinement i.e it knows that a win achieved in less moves has a higher value than one achieved in more.
I left the AI class which I descibed above, just so you can see how much more efficient and elegant the algorithm and recursion are in this scenario vs heuristics.

To play the game do the following:

Clone the repository:

`git clone git@github.com:Maikon/TicTacToe_Ruby.git`

Change into the directory:

`cd TicTacToe_Ruby`

To run it:

`ruby lib/run.rb`

Or if you are in the the `lib` directory simply type:

`./run.rb`

If the above fails to run due to permissions, do the following first:
`chmod a+x run.rb`
