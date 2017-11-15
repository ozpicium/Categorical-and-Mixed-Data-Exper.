
FOR USER:
		user_info.m : 	Contains path of a working directory, the name of the evaluation/test file, and the model to be run (1 or 2). 
		
						A user may simply specify these values in the file to test any model. 
						
						Specify/Modify the values in user_info.m and Run EvalMain.m
						
						All models are already saved. They will be loaded in EvalMain.m 
				
						
						

Data Files:

		1)	lympho.txt : 	contains full traiing data
		
		2) 	lymphoTrain23.txt : 	contains training data for class 2 vs class 3 classifiers
		
		3) 	lymphoTrainX4.txt : 	contains training data for class 4 vs class {2+3} classifiers
		
		4) 	lymphoMainEvaluation.txt : contains evaluation / test data.


Code Modules:

	Utilities:
		
		1) encodeDat.m : This code can perform either one-hot encoding or binary encoding of the categorical data. By default, one-hot is performed.
		
		2) DataPrep.m : This code calls encoding function. DataPrep function may be used at multiple places during traiing and evaluation.
	
	Training and Models:
		1) TrsinImpl.m : This file contains code to prepare training data (sub-sets for one-vs-one classification) and module training calls.
		
		2) cosineKNN.m	:	This file contains the cosine KNN training code. The module function is called by TrainImpl.m
		
		3) GaussianSVM.m :	This file contains the Gaussian SVM training code. The module function is called by TrainImpl.m
		
		4) cubicSVM.m  :	This file contains the Cubic SVM training code. The module function is called by TrainImpl.m
		
		5) RUSBoost.m : 	This file contains the RUSBoot Tree training code. The module function is called by TrainImpl.m
		
	Evaluation:
		1) EvalMain.m : Main code which calls different model evaluation/test functions.
		
		2) evalModel1.m : give test data to Model-1 (RUSBoost + kNN/SVM) and get predictions.
		
		3) evalModel2.m : give test data to Model-2 (ANFIS) and get predictions.