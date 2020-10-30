#! /bin/bash

cut -f 2 possible_voters.txt | grep -v Age > use_this_file.txt

#separate the ages from the name and header into a new file

while read line; do if [ "$line" -lt 18 ]; then echo "no"; else echo "yes"; fi; done < use_this_file.txt > Eligibility.txt

#create a new file that contains original data
#in addition to whether or not the person is eligible to vote (18+)

grep -v Person possible_voters.txt > voters.txt

#remove the header from the originial file

paste voters.txt Eligibility.txt > combined_data.txt

#combine the original data file with the new data file

echo 'Person Age(years) Eligible?' > header.txt

#create a new header

cat header.txt combined_data.txt | column -t > we_the_people.txt

#combine the header with the data into a patriotic file

echo -e "\nFirst 10 Lines of Original File: \n"; head possible_voters.txt | column -t

#print the 1st 10 lines of the original file

echo -e "\nFirst 10 Lines of New File: \n"; head we_the_people.txt

#print the 1st 10 lines of the new file

echo -e "\nThere are $(grep yes we_the_people.txt | wc -l) eligible voters!"

#print the total number of eligible voters in the data set
