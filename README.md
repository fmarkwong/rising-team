# rising-team

- Magic hat is a game you can play with your team, where you pick a question out of a hat, as a team building exercise. Examples of questions would be “what was your childhood nickname?” Or “what is your favorite emoji and why?”.
- Can you build a game where the user can do the following:
  - Ask the hat to give you a question.
  - Ask the hat to ask questions every X seconds.
  - Ask the hat to turn off the periodic questions
  - The hat should not repeat questions that have been asked before (unless they've all been asked already)
  
## Notes
Built with Ruby 2.7.1 
  
### To run:

`ruby magic-hat.rb`
  
### To run tests:

Make sure minitest is installed

`gem install minitest`

Then run test suite

`ruby tests/test_question_data.rb`
