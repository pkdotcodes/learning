 #!/bin/bash

NAME=$1
GREETING="Hi there"
HAT_TIP="*tip of the hat*"
HEAD_SHAKE="*slow head shake*"

 # if your name is Dace
if [ "$NAME" = "Dave" ]; then
    # greet
    echo $GREETING
# if your name is steve
elif [ "$NAME" = "Steve" ]; then
    # tip that
    echo $HAT_TIP
# else
else
    #shake hand
    echo $HEAD_SHAKE
fi





l