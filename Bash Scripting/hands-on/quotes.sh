VAR1="123"
VAR2='123'

echo $VAR1
echo $VAR2

echo "VAR1 = $VAR1, VAR2 = $VAR2"

echo 'VAR1 = $VAR1, VAR2 = $VAR2'
# => single quotes remove the meaning of $, just text

VIRUS="covid19"

echo "In 2020, there is a virus called $VIRUS which killed $8 million of people"
# Problem: I want to print the variable of VIRUS ("covid19") and "$8" text
# Solve: Add a backward slash \
echo "In 2020, there is a virus called $VIRUS which killed \$8 million of people" 
