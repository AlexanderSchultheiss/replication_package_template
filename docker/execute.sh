#! /bin/bash

if [ "$1" == '' ]
then
  echo "Either fully run DiffDetective as presented in the paper (replication) or a do quick setup validation (validation)."
  echo "-- Examples --"
  echo "Run simulation: './experiment.sh replication'"
  echo "Validate the setup: './experiment.sh validation'"
  exit
fi

echo "Starting $1"

cd /home/user || exit

echo "Files in WORKDIR"
ls -l
echo ""

if [ "$1" == 'replication' ]
then
    echo "Running full replication."
    echo ""
    echo ""
    echo ""
    java -jar Main.jar
elif [ "$1" == 'validation' ]
then
    echo "Running a short validation."
    echo ""
    echo ""
    echo ""
    echo "NOT IMPLEMENTED ... EXIT"
else
    echo "Either fully run DiffDetective as presented in the paper (replication) or a do quick setup validation (validation)."
    echo "-- Examples --"
    echo "Run simulation: './experiment.sh replication'"
    echo "Validate the setup: './experiment.sh validation'"
    exit
fi
