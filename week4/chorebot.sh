ROOMAMATE=$1
CHORES=(dishes trash vaccuming)

echo "Assingning a chore to $ROOMMATE..."
echo "${(CHORES[$RANDOM % 3]}" >> chores_log.txt
echo "Done!"