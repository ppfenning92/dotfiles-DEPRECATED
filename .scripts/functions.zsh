#!/bin/bash

nestGenerateAll() {
  
  singular=$1
  plural="${singular}s"
  
        
  if [ $2 ] 
  then plural=$2
  fi

  echo $singular
  echo $plural
  nest g mo $plural
  nest g co $plural
  nest g s $plural
  nest g gu $plural\/$plural
  nest g cl $plural\/$singular
}

#export nestGenerateAll
