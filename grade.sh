CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

# 1. Cloning the student's repo
git clone $1 student-submission
echo 'Finished cloning'

# 2. Checks if the file is in the repo
set -e
if ! [[ -f ./student-submission/ListExamples.java ]]
then
echo 'ListExamples.java not found in the directory! Check the file location :)'
exit 0
fi

# 3. copies files into the grading area 
cp -r student-submission/ grading-area
cp TestListExamples.java grading-area

# 4. Compile the tests and the student's code
set +e
cd ./grading-area
javac -cp $CPATH *.java
if [[ $? != 0 ]]
then
echo 'Compilation error!!!'
exit
fi

# 5. Run the tests and report the grade
set -e
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > grade.txt
total=`head -2 grade.txt | tail -1 | grep -o "." | wc -l`
fails=`head -2 grade.txt | tail -1 | grep -o "E" | wc -l`
successes=$(($total-$fails))
echo "Tests Passed: $successes, Total Tests: $total"


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests