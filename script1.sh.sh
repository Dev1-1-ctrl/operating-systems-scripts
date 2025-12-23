#!/bin/bash

 #Explaning a function to do copying the folders
 function copy_files {
   source_folder=$1
   destination_folder=$2

    #Check if the source amd destination folder exists 
    if [ ! -d "$source_folder" ]; then
      echo "Inaccuarcy: Orginal folder not found"
      return
     fi

     if [ -d "$destination_folder" ]; then
   echo "The desired folder is already there.Would you like to swap it out for something new?(t/n)"
   read choice
   if [ "$choice" != "t" ]; then
	   echo "copy task cancelled"
    return
        fi
       fi
      
       #copy files from source to destination folder
        cp -r "$source_folder"/* "$destination_folder"
    
       # check if the copy task was sucessfully or not
       if [ $? -eq 0 ]; then
	 echo "Copy task has been done sucessfully"
        else
          echo "Copy task has been failed"
        fi
   }
   
    # Read the file source and destination folder from file
    if [ $# -eq 1 ]; then
      filename=$1
      while read line; do
	source_folder=$(echo $line | cut -d " " -f 1)
        destination_folder=$(echo $line | cut -d " " -f 2)
        copy_files $source_folder $destination_folder
      done < $filename
   # If no command line parameter are specified, lead the user for typein
    else
      echo "Please provide the source folder:"
      read source_folder 
      echo "please provide the destination folder:"
      read destination_folder
      copy_files $source_folder $destination_folder
     fi   
