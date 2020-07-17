#--------------------------------------------- QUESTION -----------------------------------------
#An IVF Hospital Chain with a nationwide capacity of 1000 patients per month and 100 patients
#per center have been instructed to do annual budget planning. As part of the same, they are 
#analyzing patient footfalls and revenues.

#The chain follows a package pricing system. They makes $1000 profit per baby born, 
#$200 for a twin, $-1000 for a triplet and $-2000 when it is a quadruplet. 
#It makes no profit when there is a miscarriage. 

#The average footfall per month follows an uniform distribution between 72 to 84 per center. 
#Analyzing the data from the past, you found there is a 25% chance of twin, 5% chance for a 
#triplet, 1% chance of a quadruplet and 4% chance of miscarriage. 

#Given the CEO wants a detailed profit projection, can you help the IVF chain?

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

#Total number of center
IVF_capacity = 1000
IVF_capacity_per_center = 100
IVF_center_count = IVF_capacity/IVF_capacity_per_center

#Creating the package details such as name, profit margin and their probabilty of occurring.
package_type = c("Single", "Twin", "Triplet", "Quadruplet", "Miscarriage")
package_profit = c(1000,200,-1000,-2000,0)
package_prob = c(0.65, 0.25, 0.05, 0.01, 0.04)

#Maximum and minimum number of average footfall per month per center.
min_avg_patient = 72
max_avg_patient = 82

#Creatin the user defined function to simulate the profit calculation for each center.
profit_projection = function (IVF_center_count, package_type, package_profit, package_prob, 
                              min_avg_patient, max_avg_patient)
{
  detailed_profit_projection = data.frame()
  
  #For loop to iterate the process for each IVF Center over the year for 12 months.
  for (j in 1:12)
  {
    #For loop to iterate the process for each IVF Center for a single month.
    for (i in 1:IVF_center_count)
    {
      #Number of average patient per center
      patient_count = round(runif(1, min_avg_patient, max_avg_patient))
      
      #Sample to find the distribution of the patient type
      baby_per_patient = sample(package_type, size = patient_count, replace=TRUE, 
                                prob = package_prob)
      
      #Finding the number of patients in each package type
      patient_per_package = c(sum(baby_per_patient=="Single"), sum(baby_per_patient=="Twin"),
                              sum(baby_per_patient=="Triplet"), 
                              sum(baby_per_patient=="Quadruplet"), 
                              sum(baby_per_patient=="Miscarriage"))
      
      #Profit of each center
      profit_per_hospital = sum(patient_per_package * package_profit)
      
      #Creating a data frame to save the details of one center
      profit_projection_dataframe = data.frame(
        Month_Number = j,
        Center_Number = i,
        Total_Patient_Footfall = patient_count,
        Single_Baby_Count = sum(baby_per_patient=="Single"),
        Twin_Count = sum(baby_per_patient=="Twin"),
        Triplet_Count = sum(baby_per_patient=="Triplet"),
        Quadruplet_Count = sum(baby_per_patient=="Quadruplet"),
        Miscarriage_Count = sum(baby_per_patient=="Miscarriage"),
        Total_Profit = profit_per_hospital)
      
      #Concatenating the dataframes to save data for all the centers year-wise.
      detailed_profit_projection = rbind(detailed_profit_projection, profit_projection_dataframe)
    }
  }
  
  #Adding an extra row to save the total of each column
  detailed_profit_projection = rbind(detailed_profit_projection, data.frame
                                     (Month_Number = "Annual Total", Center_Number = "=",
                                       t(colSums(detailed_profit_projection[, c(-1,-2)]))))
  
  return(detailed_profit_projection)
}

#Calling the function
IVF_chain_profit_details = data.frame(profit_projection(IVF_center_count, package_type, 
                                                        package_profit, package_prob, 
                                                        min_avg_patient, max_avg_patient))

print("The detailed annual profit projection for the IVF Chain :")
print(IVF_chain_profit_details)
#------------------------------------------ END -------------------------------------------------