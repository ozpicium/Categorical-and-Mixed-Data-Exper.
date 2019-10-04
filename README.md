# Classification of Lymphographic Data with Hybrid Models of Specialized Classifiers

For details, please read the report: Mini_Project_Hybrid_Models.pdf 

This report presents an analysis of the Lymphography data. The data was obtained from the
University Medical Centre, Institute of Oncology, Ljubljana, Yugoslavia. Data is from Oncology
domain which concerns with various forms of cancer and their treatment. In this particular case, the
pathology of interest is Lymphoma or lymph-node cancer. The date provides various samples of
observations of lymph-nodes and corresponding categories expressing if the lymph is normal or
affected. A pathological lymph may indicate two different possibilities. A lymph may be malignant.
In this case, the cancer starts at the lymph nodes and spreads out. In other cases, cancer may start at
other sites in the body and spread into lymph nodes, in which case the pathological lymph site is
called metastases. Given medical observations, correct identification of these different states is
crucial for precise diagnosis.

This report discusses classification models built to categorize different pathological states of lymph.
The goal of designed models is to correctly classify various lymph states. The data has some
interesting characteristics such as discreteness and high imbalance of class distribution. Hybrid
architectures are proposed to perform one-vs-all classification in different stages. At each stage,
optimum classifier for a specific category is used. One of the architectures is a hybrid of ANFIS
models. Instead of using generic ANFIS, Subtractive Clustering is employed to better handle the
discrete structure of the input-space.
