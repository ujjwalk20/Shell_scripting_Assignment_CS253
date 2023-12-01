#!/bin/bash

echo "Please enter the input filename:"
read filename1
echo "\n Please enter the output filename: "
read filename2
if [[ -z $filename1 || -z $filename2 ]] #to check empty or not
then echo "Please provide both the filename to continue"
else ls -l $filename1 $filename2  
fi

awk -F ',' '{printf("%s %s %s %s %s %s %s %s \n", $1, $2, $3,$5,$6,$7,$10,$11)}' college.csv > output.txt
awk -F ',' '{printf("%s %s %s %s %s %s %s %s \n", $1, $2, $3,$5,$6,$7,$10,$11)}' college.csv | awk '$3 == "Bachelor\47s" {print $1}'  >> output.txt


tail -n+2 college.csv | awk -F ',' '{printf("%s %s\n",$6,$7)}'  | sort -k 1 | awk 'BEGIN { print "Geography: Average Admission Rate"}
$1=="Distant" && $2=="Rural" {DR+=$3; c1+=1}
$1=="Distant" && $2=="Town" {DT+=$3; c2+=1}
$1=="Fringe" && $2=="Rural" {FR+=$3; c3+=1}
$1=="Fringe" && $2=="Town" {FT+=$3; c4+=1}
$1=="Large" && $2=="City" {LC+=$3; c5+=1}
$1=="Large" && $2=="Suburb" {LS+=$3; c6+=1}
$1=="Mid-size" && $2=="City" {MC+=$3; c7+=1}
$1=="Mid-size" && $2=="Suburb" {MS+=$3; c8+=1}
$1=="Remote" && $2=="Rural" {RR+=$3; c9+=1}
$1=="Remote" && $2=="Town" {rt+=$3; c10+=1}
$1=="Small" && $2=="City" {SC+=$3; c11+=1}
$1=="Small" && $2=="Suburb" {SS+=$3; c12+=1}
END{
printf( "Distant Rural: %.4f \n" ,DR/c1);
printf( "Distant Town: %.4f \n",DT/c2);
printf( "Fringe Rural: %.4f \n" ,FR/c3);
printf ("Fringe Town: %.4f \n",FT/c4);
printf ("Large City: %.4f \n", LC/c5);
printf ("Large Suburb: %.4f \n" ,LS/c6);
printf ("Mid-size City: %.4f \n",MC/c7);
printf ("Mid-size Suburb: %.4f \n",MS/c8);
printf ("Remote Rural: %.4f \n",RR/c9);
printf ("Remote Town: %.4f \n", rt/c10);
printf ("Small City: %.4f \n",SC/c11);
printf ("Small Suburb: %.4f \n",SS/c12)
}' >>output.txt

tail -n+2 college.csv | sort -r -t, -nk16 | awk -F, 'NR==1, NR==5 {print $1}' OFS='\n' >> output.txt
