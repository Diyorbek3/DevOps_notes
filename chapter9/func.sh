#!/bin/bash
TEST="/tmp/filename"

# call delete_file; fail... 
delete_file

# write delete_file()
delete_file(){
  echo "Deleting $TEST..."
}	
