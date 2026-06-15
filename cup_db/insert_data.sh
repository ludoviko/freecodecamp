#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Truncate tables
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 echo "Reading from games.csv ($YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS)"

 #Inserting Winners into teams table
  if [[ $WINNER != "winner" ]]
    then
      WINNER_TEST=$($PSQL "select name from teams where name='$WINNER'")

      if [[ -z $WINNER_TEST ]]
      then
        WINNER_INSERT_RESULT=$($PSQL "insert into teams (name) values ('$WINNER')")
        if [[ -z $WINNER_INSERT_RESULT ]]
        then 
          echo "Insertion failed"
        else
          echo "Successful insertion"
        fi
      fi
  fi 

 #Inserting Opponents into teams table
  if [[ $OPPONENT != "opponent" ]]
    then
      OPPONENT_TEST=$($PSQL "select name from teams where name='$OPPONENT'")

      if [[ -z $OPPONENT_TEST ]]
      then
        OPPONENT_INSERT_RESULT=$($PSQL "insert into teams (name) values ('$OPPONENT')")
        if [[ -z $OPPONENT_INSERT_RESULT ]]
        then 
          echo "Insertion failed "
        else
          echo "Successful insertion into teams"
        fi
      fi
  fi 

done 

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  echo "Reading from games.csv ($YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS)"

  if [[ $WINNER != "winner" ]]
    then
      WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
      if [[ -z $WINNER_ID ]]
      then
        echo "$WINNER not found in table"
      fi

      OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      if [[ -z $OPPONENT_ID ]]
      then
        echo "$OPPONENT not found in table"
      fi

      if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
      then
          echo "Data not inserted into games."
      else
        GAMES_INSERT_RESULT=$($PSQL "insert into games (winner_id, opponent_id, round, year, winner_goals, opponent_goals) values ($WINNER_ID, $OPPONENT_ID, '$ROUND', $YEAR, $WINNER_GOALS, $OPPONENT_GOALS)")

        if [[ -z $GAMES_INSERT_RESULT ]]
        then
          echo "Insertion into games failed"
        else  
          echo "Successful insertion into games"
        fi
      fi
  fi
done

