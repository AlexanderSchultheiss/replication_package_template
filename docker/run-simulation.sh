#! /bin/bash
if [ "$1" == '' ]
then
  echo "Either fully run the simulation as presented in the paper (simulate), evaluate the results (evaluate), or a do quick setup validation (validate)."
  echo "-- Bash Examples --"
  echo "Run simulation: './simulation.sh simulate'"
  echo "Evaluate all gathered results: './simulation.sh evaluate'"
  echo "Validate the setup: './simulation.sh validate'"
  exit
fi

echo "Starting $1"

patch --help || exit
cd /home/user || exit
ls -l
echo "Files in simulation-files"
ls -l simulation-files

echo "Copying jars"
  cp target/*Runner*-jar-with* .
  cp target/ResultEval-jar-with-dependencies* .
  echo ""

if [ "$1" == 'evaluate' ]
then
    echo "Running result evaluation"
    java -jar ResultEval-jar-with-dependencies.jar
    exit
else
  echo "Files in WORKDIR"
  ls -l
  echo ""

  if [ "$1" == 'simulate' ]
  then
      echo "Running full simulation. This might take up to a month."
      echo ""
      echo ""
      echo ""
      java -jar ExperimentRunner-jar-with-dependencies.jar config-simulation.properties
  elif [ "$1" == 'validate' ]
  then
      echo "Running a (hopefully) short validation."
      echo ""
      echo ""
      echo ""
      java -jar ExperimentRunner-jar-with-dependencies.jar config-validation.properties
      echo "Running result evaluation"
      java -jar ResultEval-jar-with-dependencies.jar
  else
      echo "Either fully run the simulation as presented in the paper (simulate), evaluate the results (evaluate), or a do quick setup validation (validate)."
      echo "-- Bash Examples --"
      echo "Run simulation: './simulation.sh simulate'"
      echo "Evaluate all gathered results: './simulation.sh evaluate'"
      echo "Validate the setup: './simulation.sh validate'"
  fi
fi