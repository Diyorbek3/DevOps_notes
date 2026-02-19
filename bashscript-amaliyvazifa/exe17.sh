#!/bin/bash
# Author: Diyorbek
# Date: 2026-02-19

#!/bin/bash
function logging()
 {
  MESSAGE=$@
  SET_MESSAGE="Random Number is:$MESSAGE"
  echo "$SET_MESSAGE"
  logger -i -p user.info "$SET_MESSAGE"
 }
logging $RANDOM
logging $RANDOM
logging $RANDOM
