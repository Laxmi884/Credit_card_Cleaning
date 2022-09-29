/* ----------------------------------------------------------------------------------- */
/* BAN110 - Final Project                                                              */
/* Group 6
			Babin Karki
			Gisella Escobar
			Karan Saxena
			Laxmikant Mukkawar
			Narayani Kangatharan
			Suman K C                                                                 
   Aug 2022                                                                            */
/* ----------------------------------------------------------------------------------- */
FILENAME REFFILE '/home/u61462018/BAN110ZAA/FinalProject/CreditCards.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=Creditcards
	REPLACE;
RUN;

/* Review the Dataset */
PROC CONTENTS DATA=Creditcards ORDER=VARNUM; RUN;

/* Print an example of the Dataset information */
TITLE 'List of 10 Creditcard information';
PROC PRINT DATA=Creditcards (OBS=10);
RUN;

/* Review variables */
PROC FREQ DATA=Creditcards;
TABLES  ClientNum
		Customer_Age 
		Gender 
		Attrition_Flag
		Dependent_Count
		Education_Level 
		Marital_Status 
		Income_Category 
		Avg_Utilization_Ratio	
		Card_Category 
		Months_on_book 
		Total_Relationship_Count 
		Months_Inactive_12_mon	
		Contacts_Count_12_mon  
		Credit_Limit
	    Total_Revolving_Bal  
	    Avg_Open_To_Buy  
	    Total_Amt_Chng_Q4_Q1  
	    Total_Trans_Amt	 
	    Total_Trans_Ct	 
	    Total_Ct_Chng_Q4_Q1  / missing;
TITLE 'Missing values Review';
RUN;

/*       Update variables with lowercase to unify the information      */
DATA Creditcards_U;
SET Creditcards;
Gender1 = lowcase(Gender);
Education_Level1 = lowcase(Education_Level);
Marital_Status1 = lowcase(Marital_Status);
DROP Gender Education_Level Marital_Status;
RENAME Gender1 = Gender;
RENAME Education_Level1=Education_Level;
RENAME Marital_Status1=Marital_Status;
RUN;

PROC FREQ DATA=Creditcards_U;
TABLES  Gender 
		Attrition_Flag
		Education_Level 
		Marital_Status;
RUN;

/* ---------------------------------------------------------------------------------------  */
/* PLOT  Numerical variables  					    										*/ 
/* ---------------------------------------------------------------------------------------  */
/* 							Customer_Age, Credit_Limit, 
   							Months_on_book, 
   							Avg_Utilization_Ratio, 
  							Avg_Open_To_Buy, 
  							Total_Relationship_Count,
 							Months_Inactive_12_mon,
							Contacts_Count_12_mon,
							Total_Revolving_Bal, 
							Total_Amt_Chng_Q4_Q1,
							Total_Trans_Ct,
							Total_Trans_Amt, 
							Total_Ct_Chng_Q4_Q1   */

TITLE 'Analysis of Customer Age';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Customer_Age /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;

TITLE 'Analysis of Avg_Utilization_Ratio';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Avg_Utilization_Ratio /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;
	
TITLE 'Analysis of Months_on_book';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Months_on_book /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;		
TITLE 'Analysis of Total_Relationship_Count';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Relationship_Count /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	
	 
TITLE 'Analysis of Months_Inactive_12_mon';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Months_Inactive_12_mon /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;			 

TITLE 'Analysis of Contacts_Count_12_mon';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Contacts_Count_12_mon /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	
	
TITLE 'Analysis of Credit_Limit';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Credit_Limit /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	

TITLE 'Analysis of Total_Revolving_Bal';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Revolving_Bal /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	

TITLE 'Analysis of Avg_Open_To_Buy';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Avg_Open_To_Buy /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	

TITLE 'Analysis of Total_Amt_Chng_Q4_Q1';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Amt_Chng_Q4_Q1 /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;
	
TITLE 'Analysis of Total_Trans_Amt';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Trans_Amt /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;	

TITLE 'Analysis of Total_Trans_Ct';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Trans_Ct /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;

TITLE 'Analysis of Total_Ct_Chng_Q4_Q1';
ods graphics on;
PROC univariate data=Creditcards_U noprint;
  	 histogram Total_Ct_Chng_Q4_Q1 /  normal(percents=20 40 60 80 midpercents) 
   	odstitle = title;
RUN;

/* --------------------------------------------------------------------------------------- */
/* Frequency Chart for CATEGORICAL VARIABLES                  			                   */
/* --------------------------------------------------------------------------------------- */
/* 										Attrition_Flag, 
										Gender Education_Level,
										Marital_Status, 
										Income_Category,  
										Card_Category     */
/* Grapgh using PROC CHART */
TITLE 'Frequencie Chart for Gender';
PROC CHART DATA=Creditcards_U;
   VBAR gender/ DISCRETE;
RUN;
/* Grapgh using PROC SGPLOT */
TITLE 'Frequencie Chart for Gender';
PROC SGPLOT DATA=Creditcards_U;
VBAR gender ;
RUN;
/* Grapgh using PROC GCHART */
TITLE 'Frequencie Chart for Gender';
PROC GCHART DATA=Creditcards_U;
VBAR gender;
RUN;

/* Gender after lowercase unification */
PROC FREQ DATA=Creditcards_U;
TABLES  Gender;
RUN;

TITLE 'Frequencie Chart for Attrition Flag';
PROC GCHART DATA=Creditcards_U;
VBAR Attrition_Flag;
RUN;

PROC FREQ DATA=Creditcards_U;
TABLES  Attrition_Flag;
RUN;

/* ---Frequency Chart for Education Level  */
TITLE 'Frequencie Chart for Education Level';
PROC GCHART DATA=Creditcards_U;
VBAR Education_Level;
RUN;

/* ---Frequency Chart for Marital Status  */
TITLE 'Frequencie Chart for Marital Status';
PROC GCHART DATA=Creditcards_U;
   VBAR Marital_Status;
RUN;


/* ---Frequency Chart for Income Category  */
TITLE 'Frequencie Chart for Income Category';
PROC GCHART DATA=Creditcards_U;
   VBAR Income_Category;
RUN;

/* ---Frequency Chart for Card_Category  */
TITLE 'Frequencie Chart for Card Category';
PROC GCHART DATA=Creditcards_U;
   VBAR Card_Category;
RUN;

/* ------------------------------------------------------------------------------   */
/* MEANS FOR NUMERICAL VARIABLES  to see min, max, std dev ...                      */
/* ------------------------------------------------------------------------------   */
PROC MEANS DATA=Creditcards;
VAR  	Customer_Age 
		Dependent_Count
		Months_on_book 
		Months_Inactive_12_mon	
		Contacts_Count_12_mon  
		Credit_Limit
	    Avg_Utilization_Ratio
	    Avg_Open_To_Buy  
	    Total_Revolving_Bal  
	    Total_Relationship_Count 
	    Total_Amt_Chng_Q4_Q1  
	    Total_Trans_Amt	 
	    Total_Trans_Ct	 
	    Total_Ct_Chng_Q4_Q1;
	    TITLE 'List of Numerical Variables';
RUN;

/*  ------------------------------------------------------------  */
/*  ----------------   TRANSFORMATION  -----------------------   */

/*  ATTRITION FLAG in Binary  */
DATA Creditcards_T;
SET Creditcards_U;
IF Attrition_Flag='Existing Customer' THEN  Attrition_Flag1=0;
ELSE Attrition_Flag1=1;
DROP Attrition_Flag;
RENAME Attrition_Flag1=Attrition_Flag;
RUN;

/* ---------------------------------------------------- */
/*  Gender in Binary  */
DATA Creditcards_T;
SET Creditcards_T;
IF lowcase(Gender)='m' THEN  GenderB=1;
ELSE GenderB=0;
DROP Gender;
RENAME GenderB=Gender;
RUN;

/* ---------------------------------------------------- */
/*  Education_Level                                     */
/*Educational_Level Frequency before making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES education_level;
RUN;

DATA Creditcards_T;
SET Creditcards_T;
IF Education_Level ='unknown' THEN education_flag=0;
ELSE IF Education_Level ='uneducated' THEN education_flag=1;
ELSE IF Education_Level = 'high school' THEN education_flag=2;
ELSE IF education_level ='college' THEN education_flag=3;
ELSE IF education_level ='graduate' THEN education_flag=4;
ELSE IF education_level ='post-graduate' THEN education_flag=5;
ELSE IF education_level ='doctorate' THEN education_flag=6;
DROP education_level;
RENAME education_flag=education_level;
RUN;
/*Educational_Level Frequency after making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES education_level;
RUN;
PROC PRINT DATA=creditcards_t (OBS=20);
RUN;

/* ---------------------------------------------------- */
/*  Marital_Status                                      */

/*Marital_status Frequency before making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES Marital_Status;
RUN;

DATA creditcards_t;
SET creditcards_t;
IF Marital_Status ='unknown' THEN Marital_flag=0;
ELSE IF  Marital_Status ='single' THEN Marital_flag=1;
ELSE IF Marital_Status = 'married' THEN Marital_flag=2;
ELSE IF Marital_Status ='divorced' THEN Marital_flag=3;
DROP Marital_Status;
RENAME Marital_flag=Marital_Status;
RUN;

/*Marital_status Frequency after making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES Marital_Status;
RUN;

PROC PRINT DATA=creditcards_t (OBS=20);
RUN;

/* ------------------------------------------------------ */ 
/*  Income_Category                                       */

/*Income_Category Frequency before making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES Income_Category;
RUN;

DATA creditcards_t;
SET creditcards_t;
IF Income_Category ='Unknown' THEN Income_flag=0;
ELSE IF Income_Category = 'Less than $40K' THEN Income_flag=1;
ELSE IF Income_Category ='$40K - $60K' THEN Income_flag=2;
ELSE IF Income_Category ='$60K - $80K' THEN Income_flag=3;
ELSE IF Income_Category ='$80K - $120K' THEN Income_flag=4;
ELSE IF Income_Category ='$120K +' THEN Income_flag=5;
DROP Income_Category;
RENAME Income_flag=Income_Category;
RUN;

/*Income_Category Frequency after making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES Income_Category;
RUN;

/* -------------------------------------------------------- */
/*  Card_Category                                           */
/*Income_Category Frequency before making it numerical*/
PROC FREQ DATAa=Creditcards_t;
TABLES Card_Category;
RUN;

DATA creditcards_t;
SET creditcards_t;
IF Card_Category ='Blue' THEN Card_flag=1;
ELSE IF Card_Category = 'Silver' THEN Card_flag=2;
ELSE IF Card_Category ='Gold' THEN Card_flag=3;
ELSE IF Card_Category = 'Platinum' THEN Card_flag=4;
DROP Card_Category;
RENAME Card_flag=Card_Category;
RUN;

/*Income_Category Frequency after making it numerical*/
PROC FREQ DATA=Creditcards_t;
TABLES Card_Category;
RUN;

/* ======================================================================================= */
/*  OUTLIERS                                                                               */
/*  Aplying for each numeric variable                                                     */
/* --------------------------------------------------------------------------------------- */
/*	Customer_Age, 
   	Credit_Limit, 
   	Months_on_book, 
   	Avg_Utilization_Ratio, 
   	Avg_Open_To_Buy, 
   	Total_Relationship_Count,
   	Months_Inactive_12_mon,
   	Contacts_Count_12_mon,
	Total_Revolving_Bal, 
	Total_Amt_Chng_Q4_Q1,
	Total_Trans_Ct,
	Total_Trans_Amt, 
	Total_Ct_Chng_Q4_Q1   */ 

/*-------------------------------Age  ------------------------------------- -----------------*/	
/*   Procedure based on the standard deviation method                                        */ 

/* We are going to take only the information referred to customer with attrition Flag=1 */
PROC SQL;
CREATE TABLE CreditCards_Attrition AS
SELECT * 
FROM creditcards_t
WHERE Attrition_Flag=1;
QUIT;

PROC MEANS DATA= CreditCards_Attrition ;
   var customer_age; 
   output out=Mean_Std(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

/* ------------------------------------  Age --------------------------------------- */
TITLE "Outliers for customer age Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum customer_age );
   if _n_ = 1 then set Mean_Std;
   if customer_age lt customer_age_Mean - 2*customer_age_StdDev and not missing(customer_age)
      or customer_age gt customer_age_Mean + 2*customer_age_StdDev then put clientnum= customer_age=;
      else output = test1;
RUN;

TITLE 'Distribution of Customer Age';
  proc sgplot data=CreditCards_Attrition;
  histogram customer_age;
  density customer_age;
RUN;

TITLE 'Box plot for age';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox customer_age;
RUN;

/*-------------------------------Avg_Utilization_Ratio-----------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Avg_Utilization_Ratio; 
   output out=Mean_Std2(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for dependent count Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Avg_Utilization_Ratio );
   if _n_ = 1 then set Mean_Std2;
   if Avg_Utilization_Ratio lt Avg_Utilization_Ratio_Mean - 2*Avg_Utilization_Ratio_StdDev and not missing(Avg_Utilization_Ratio)
      or Avg_Utilization_Ratio gt Avg_Utilization_Ratio_Mean + 2*Avg_Utilization_Ratio_StdDev then put clientnum= Avg_Utilization_Ratio=;
RUN;

TITLE 'Distribution of histogram Avg_Utilization_Ratio;';
  PROC SGPLOT DATA=CreditCards_Attrition;
  histogram Avg_Utilization_Ratio;
  density Avg_Utilization_Ratio;
RUN;

TITLE 'Box plot for Avg_Utilization_Ratio';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Avg_Utilization_Ratio;
RUN;

/*---------------------------Months_on_Book----------------------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Months_on_Book; 
   output out=Mean_Std3(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Months_on_Book Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Months_on_Book );
   if _n_ = 1 then set Mean_Std3;
   if Months_on_Book lt Months_on_Book_Mean - 2*Months_on_Book_StdDev and not missing(Months_on_Book)
      or Months_on_Book gt Months_on_Book_Mean + 2*Months_on_Book_StdDev then put clientnum= Months_on_Book= ;   
RUN;

TITLE 'Distribution of Months_on_Book';
  proc sgplot data=CreditCards_Attrition;
  histogram Months_on_Book;
  density Months_on_Book;
RUN;

TITLE 'Box plot for Months of Book';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Months_on_Book;
RUN;

/*--------------------------Total_relationship_count------------------------------*/
proc means data=CreditCards_Attrition  ;
   var Total_relationship_count; 
   output out=Mean_Std4(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Months_on_Book Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Total_relationship_count );
   if _n_ = 1 then set Mean_Std4;
   if Total_relationship_count lt Total_relationship_count_Mean - 2*Total_relationship_count_StdDev and not missing(Total_relationship_count)
      or Total_relationship_count gt Total_relationship_count_Mean + 2*Total_relationship_count_StdDev then put clientnum= Total_relationship_count= ;   
RUN;

TITLE 'Distribution of Total_relationship_count';
  proc sgplot data=CreditCards_Attrition;
  histogram Total_relationship_count;
  density Total_relationship_count;
RUN;

TITLE 'Box plot for Total relationship count';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Months_on_Book;
RUN;


/*--------------------------Months_inactive_12_mon-----------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Months_inactive_12_mon; 
   output out=Mean_Std5(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Months_inactive_12_mon on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Months_inactive_12_mon );
   if _n_ = 1 then set Mean_Std5;
   if Months_inactive_12_mon lt Months_inactive_12_mon_Mean - 2*Months_inactive_12_mon_StdDev and not missing(Months_inactive_12_mon)
      or Months_inactive_12_mon gt Months_inactive_12_mon_Mean + 2*Months_inactive_12_mon_StdDev then put clientnum= Months_inactive_12_mon= ;   
RUN;

TITLE 'Distribution of Months_inactive_12_mon';
  proc sgplot data=CreditCards_Attrition;
  histogram Months_inactive_12_mon;
  density Months_inactive_12_mon;
RUN;

TITLE 'Box plot for Months inactive 12 month';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Months_inactive_12_mon;
RUN;

/*------------------------------Contacts_count_12_mon------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Contacts_count_12_mon; 
   output out=Mean_Std6(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Months_on_Book Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Contacts_count_12_mon );
   if _n_ = 1 then set Mean_Std6;
   if Months_inactive_12_mon lt Months_inactive_12_mon_Mean - 2*Months_inactive_12_mon_StdDev and not missing(Months_inactive_12_mon)
      or Months_inactive_12_mon gt Months_inactive_12_mon_Mean + 2*Months_inactive_12_mon_StdDev then put clientnum= Months_inactive_12_mon= ;   
RUN;

TITLE 'Distribution of Months_inactive_12_mon';
  proc sgplot data=CreditCards_Attrition;
  histogram Months_inactive_12_mon;
  density Months_inactive_12_mon;
RUN;


/*-------------------------------  credit_limit  --------------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var credit_limit; 
   output out=Mean_Std7(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for credit_limit Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum credit_limit );
   if _n_ = 1 then set Mean_Std7;
   if credit_limit lt credit_limit_Mean - 2*credit_limit_StdDev and not missing(credit_limit)
      or credit_limit gt credit_limit_Mean + 2*credit_limit_StdDev then put clientnum= credit_limit= ;   
RUN;

TITLE 'Distribution of credit_limit';
  proc sgplot data=CreditCards_Attrition;
  histogram credit_limit;
  density credit_limit;
RUN;
TITLE 'Box plot for credit_limit';
  proc sgplot data=CreditCards_Attrition;
  hbox credit_limit;
RUN;

/*-----------------------------------total_revolving_balance-------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var total_revolving_bal; 
   output out=Mean_Std8(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for total_revolving_balance Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum total_revolving_bal );
   if _n_ = 1 then set Mean_Std8;
   if total_revolving_bal lt total_revolving_bal_Mean - 2*total_revolving_bal_StdDev and not missing(total_revolving_bal)
      or total_revolving_bal gt total_revolving_bal_Mean + 2*total_revolving_bal_StdDev then put clientnum= total_revolving_bal= ;   
RUN;

TITLE 'Distribution of total_revolving_balance';
  proc sgplot data=CreditCards_Attrition;
  histogram total_revolving_bal;
  density total_revolving_bal;
RUN;

TITLE 'Box plot for Total Revolving Balance';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox total_revolving_bal;
RUN;


/*---------------------------------avg_open_to_buy--------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var avg_open_to_buy; 
   output out=Mean_Std9(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for avg_open_to_buy Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum avg_open_to_buy );
   if _n_ = 1 then set Mean_Std9;
   if avg_open_to_buy lt avg_open_to_buy_Mean - 2*avg_open_to_buy_StdDev and not missing(avg_open_to_buy)
      or avg_open_to_buy gt avg_open_to_buy_Mean + 2*avg_open_to_buy_StdDev then put clientnum= avg_open_to_buy= ;   
RUN;

TITLE 'Distribution of avg_open_to_buy';
  proc sgplot data=CreditCards_Attrition;
  histogram avg_open_to_buy;
  density avg_open_to_buy;
RUN;

TITLE 'Box plot for Avg Open_to_buy';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox avg_open_to_buy;
RUN;

/*--------------------Total_trans_amt-------------------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Total_trans_amt; 
   output out=Mean_Std10(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Total_trans_amt Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Total_trans_amt );
   if _n_ = 1 then set Mean_Std10;
   if Total_trans_amt lt Total_trans_amt_Mean - 2*Total_trans_amt_StdDev and not missing(Total_trans_amt)
      or Total_trans_amt gt Total_trans_amt_Mean + 2*Total_trans_amt_StdDev then put clientnum= Total_trans_amt= ;   
RUN;

TITLE 'Distribution of Total_trans_amt';
PROC SGPLOT DATA=CreditCards_Attrition;
  histogram Total_trans_amt;
  density Total_trans_amt;
RUN;

TITLE 'Box plot for Total Transaction Ammount';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Total_trans_amt;
RUN;


/*--------------------------------total_amt_chng_Q4_Q1------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var total_amt_chng_Q4_Q1; 
   output out=Mean_Std11(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for total_amt_chng_Q4_Q1 Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum total_amt_chng_Q4_Q1 );
   if _n_ = 1 then set Mean_Std11;
   if total_amt_chng_Q4_Q1 lt total_amt_chng_Q4_Q1_Mean - 2*total_amt_chng_Q4_Q1_StdDev and not missing(total_amt_chng_Q4_Q1)
      or total_amt_chng_Q4_Q1 gt total_amt_chng_Q4_Q1_Mean + 2*total_amt_chng_Q4_Q1_StdDev then put clientnum= total_amt_chng_Q4_Q1= ;   
RUN;

TITLE 'Distribution of Total_trans_amt';
PROC SGPLOT DATA=CreditCards_Attrition;
  histogram total_amt_chng_Q4_Q1;
  density total_amt_chng_Q4_Q1;
RUN;

TITLE 'Box plot for Total Transaction Ammount Change Q1 - Q4';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox total_amt_chng_Q4_Q1;
RUN;
/*------------------------------total_trans_ct----------------------------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var total_trans_ct; 
   output out=Mean_Std12(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for total_trans_ct Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum total_trans_ct );
   if _n_ = 1 then set Mean_Std12;
   if total_trans_ct lt total_trans_ct_Mean - 2*total_trans_ct_StdDev and not missing(total_trans_ct)
      or total_trans_ct gt total_trans_ct_Mean + 2*total_trans_ct_StdDev then put clientnum= total_trans_ct= ;   
RUN;

TITLE 'Distribution of Total_trans_ct';
PROC SGPLOT DATA=CreditCards_Attrition;
  histogram total_trans_ct;
  density total_trans_ct;
RUN;
TITLE 'Box plot for Total Transaction Cut';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox total_trans_ct;
RUN;


/*------------------------------total_ct_chng_Q4_Q1-----------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var total_ct_chng_Q4_Q1; 
   output out=Mean_Std13(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for total_ct_chng_Q4_Q1 Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum total_ct_chng_Q4_Q1 );
   if _n_ = 1 then set Mean_Std13;
   if total_ct_chng_Q4_Q1 lt total_ct_chng_Q4_Q1_Mean - 2*total_ct_chng_Q4_Q1_StdDev and not missing(total_ct_chng_Q4_Q1)
      or total_ct_chng_Q4_Q1 gt total_ct_chng_Q4_Q1_Mean + 2*total_ct_chng_Q4_Q1_StdDev then put clientnum= total_ct_chng_Q4_Q1= ;   
run;

title 'Distribution of Total_trans_amt';
  proc sgplot data=CreditCards_Attrition;
  histogram total_ct_chng_Q4_Q1;
  density total_ct_chng_Q4_Q1;
run;

TITLE 'Box plot for Total Cut Change Q1-Q1';
  PROC SGPLOT DATA=CreditCards_Attrition;
  hbox total_ct_chng_Q4_Q1;
RUN;



/*----------------------------Avg_utilization_ratio_1------------------*/
PROC MEANS DATA=CreditCards_Attrition  ;
   var Avg_utilization_ratio_1; 
   output out=Mean_Std14(drop=_type_ _freq_)
          mean=
          std= / autoname;
RUN;

TITLE "Outliers for Avg_utilization_ratio_1 Based on 2 Standard Deviations";
DATA _null_;
   file print;
   set CreditCards_Attrition(keep=clientnum Avg_utilization_ratio_1 );
   if _n_ = 1 then set Mean_Std14;
   if Avg_utilization_ratio_1 lt Avg_utilization_ratio_1_Mean - 2*Avg_utilization_ratio_1_StdDev and not missing(Avg_utilization_ratio_1)
      or Avg_utilization_ratio_1 gt Avg_utilization_ratio_1_Mean + 2*Avg_utilization_ratio_1_StdDev then put clientnum= Avg_utilization_ratio_1= ;   
RUN;

TITLE 'Distribution of Avg utilization ratio1';
PROC SGPLOT DATA=CreditCards_Attrition;
  histogram Avg_utilization_ratio_1;
  density Avg_utilization_ratio_1;
RUN;
TITLE 'Box plot for Avg utilization ratio1';
PROC SGPLOT DATA=CreditCards_Attrition;
  hbox Avg_utilization_ratio_1;
RUN;

/* --------------------------------------------------------------------------------------- */
/* DELETE OUTLIERS for Variable Credit Limit                                                                         */
/* --------------------------------------------------------------------------------------- */
/* Before update */ 

PROC MEANS DATA=CreditCards_Attrition;
VAR  	Customer_Age 
		Dependent_Count
		Months_on_book 
		Months_Inactive_12_mon	
		Contacts_Count_12_mon  
		Credit_Limit
	    Avg_Utilization_Ratio
	    Avg_Open_To_Buy  
	    Total_Revolving_Bal  
	    Total_Relationship_Count 
	    Total_Amt_Chng_Q4_Q1  
	    Total_Trans_Amt	 
	    Total_Trans_Ct	 
	    Total_Ct_Chng_Q4_Q1;
	    TITLE 'Proc Means for Numerical Variables';
RUN;
PROC MEANS DATA=CreditCards_Attrition;
VAR Credit_Limit;
RUN;

/* New table without outliers -- 133 observations where removed  */
PROC SQL;
CREATE TABLE CreditCards_wo_Out AS
SELECT * 
FROM CreditCards_Attrition
WHERE credit_limit not in(26723,26794,27126,27186,27512,27560,27742,27945,27992,28229,28605,28618,28831,28930,29076,
29149,29239,29295,29338,29543,29715,29865,29890,29893,30271,30540,30543,31668,31718,31782,31832,32182,32554,32563,
32838,32938,32975,33004,33180,33384,33870,34140,34162,34516);
QUIT;
PROC PRINT DATA=CreditCards_wo_Out;
RUN;


PROC MEANS DATA=CreditCards_wo_Out;
VAR Credit_Limit;
RUN;

/* --------------------------------------------------------------------------------------- */
/* PLOT HISTOGRAM & QPLOT                                                                 */ 
/* --------------------------------------------------------------------------------------- */
TITLE 'Distribution of credit_limit';
PROC SGPLOT DATA=CreditCards_wo_Out;
  histogram credit_limit;
  density credit_limit;
RUN;
TITLE 'Box plot for credit_limit';
PROC SGPLOT DATA=CreditCards_wo_Out;
  hbox credit_limit;
RUN;

PROC PRINT DATA=creditcards_t (OBS=5); RUN;

/* -------------- */
PROC REPORT DATA=CreditCards_wo_Out;
column customer_age gender income_category ;
define customer_age / group;
RUN;


/* export file to work on pivots tables */
PROC EXPORT DATA=CreditCards_wo_Out 
OUTFILE='/home/u61462018/BAN110ZAA/FinalProject/CreditCardsW.xlsx'
DBMS=xlsx
REPLACE;
RUN;





