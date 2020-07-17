# IVF_Center_Profit_Projection

## QUESTION

An IVF Hospital Chain with a nationwide capacity of 1000 patients per month and 100 patients per center have been instructed to do annual budget planning. As part of the same, they are analyzing patient footfalls and revenues.

The chain follows a package pricing system. They makes $1000 profit per baby born, $200 for a twin, $-1000 for a triplet and $-2000 when it is a quadruplet. It makes no profit when there is a miscarriage. 

The average footfall per month follows an uniform distribution between 72 to 84 per center. Analyzing the data from the past, you found there is a 25% chance of twin, 5% chance for a triplet, 1% chance of a quadruplet and 4% chance of miscarriage. 

Given the CEO wants a detailed profit projection, can you help the IVF chain?

#---------------------------------------------- LOGIC -------------------------------------------
#1. Total number of center need to be calculated from total capacity and capacity per center.
#2. Need to simulate the total profit for each center.
#3. Need to define all the package and their type along with their profit scheme.
#4. One generalised user defined function can be generated, so that the profit calculation for 
#   each center can be done even if the package, center count or patient count changes.
#5. The profit calculation process can be iterated using a loop for number of times equal to the 
#   number of centers.
#6. The entire process is then iterated for each month throughout the year to get the annual 
#   budget.
#7. In a single dataframe all the total number of patients from each package and total profit 
#   for each center is stored, to give the detailed annual profit projection to the CEO.

#----------------------------------------- DATA CONTAINER ---------------------------------------
#1. One to save the total number of center.
#2. One vector to save the pakage type name.
#3. One vector for storing the profit for each package.
#4. One vector for defining the probability of occurring each package.
#5. One for storing the maximum average patients that can come in a center and one to store the 
#   minimum number of the same.
#6. One to store the average footfall per month generated randomly from an uniform distribution
#   between 72 and 82.
#7. A sample to find the number of babies born to each patient.
#8. Count of patients falling in each package.
#9. One to calculate total profit of each center.

#--------------------------------------------- FUNCTIONS ----------------------------------------
#1. One user defined function to calculate the profit of each center and save the same in a 
#   dataframe. And inside the function a for loop has been used to iterate the process for each 
#   centers month-wise. As argument all the total number of centers, package type, profit for 
#   each package, probability of each package in each center and the maximum and minimum number 
#   of patients has been passed to make the function more generalised. And at last the whole 
#   process is iterated for each 12 month.

#--------------------------------------------- PROCEDURE ----------------------------------------
#1. runif() - To generate a random number from a uniform distribution between 72 and 82.
#2. round() - To round off the random number generated from the runif() function.
#3. sample() - To create a sample of size equal to the number generated from runif().
#4. sum() - To find the sum.
#5. data.frame() - To create a dataframe.
#6. for - To create a for loop.
#7. colSums() - To find the sum of the columns passed as argument of a dataframe.

#--------------------------------------------- SOLUTION -----------------------------------------

