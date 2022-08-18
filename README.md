# CUSTOMER-SEGMENTATION #

Customer Segmentation using Hierarchical Clustering and K means Clustering techniques and thereby approaching them with suitable promotional offers and marketing strategies to improve business.

PROJECT OBJECTIVE : 

The main objective of this business report is to explore the dataset Bank Marketing – Customer segmentation is done using Hierarchical clustering, K-means clustering techniques and customers are grouped upon their bank activities related to credit card usage. 

EXPLORATORY DATA ANALYSIS : 

VARIABLE IDENTIFICATION INFERENCE : 

BANK MARKETING dataset is a data frame with 21,000 rows and 7 columns. The variables are of appropriate datatypes. The 5 point summary is calculated for all the variables. It gives the central value (mean) and dispersed value (standard deviation) for each of the variables. Histograms shows the frequency distribution of the data whereas boxplot shows the center, shape and spread of the data. The dataset is comprised of only numeric datatypes. No categorical variables are available in the given dataset. But the variables are of different magnitudes, hence variables should be normalized. There are no NA values in the dataset. Outliers are present in couple of variables. Clustering is done with all the provided variables taken into account, none of the features are dropped for the analysis. Since the dataset doesn’t have any deformities we can directly call the functions to get the desired results. Refer source code for further details. 


UNIVARIATE ANALYSIS : Each variable is thoroughly investigated for its nature, distribution and presence of outliers.

BIVARIATE ANALYSIS : From referring to few graphs (Business Report reference), we can infer that there is no stabilized way of spending .Customers who paid more advance spend less for purchases and vice versa. It solely depends upon the customer needs.  

MISSING VALUE IDENTIFICATION : There are no missing values in the given dataset. Hence it doesn’t require any of the missing value treatments. If in case of any NA values present in the data, then we can either ignore them or impute them with mean,median or values through any ML algorithms.

OUTLIER IDENTIFICATION : Outliers are the values which bounds out extremely from the overall pattern of the distribution. 
Here outliers are present in the columns Probability of full payment and Minimum payment amount. Not all outliers are extreme values, so we move ahead with our analysis further without ignoring it. 

SCALING OF THE DATA : Feature normalizing or scaling is a very important step in Clustering algorithms. Since Clustering techniques uses Distance calculation to form the cohorts, it will be wise to scale the variables which can be of different magnitudes. Normalizing the data is important to ensure that the distance measure accords equal weight to each variable. Without normalization the variable with the largest scale will dominate the measure. Scaling is used to eliminate redundant data and ensures that good quality clusters are generated which can improve the efficiency of the Clustering algorithms. 

For the provided Bank Marketing dataset, the variables (amount) are of different magnitudes of 100’s, 1000’s, 10000’s.Hence we normalize the variables using Z-score scaling. Now the variables will have a standard normal distribution with mean = 0 and standard deviation = 1. Standard scores of the samples are calculated as follows: 
                                  
                                  Z = X – MU / SIGMA 
                                  
MU – mean; SIGMA – standard deviation 

HIERARCHICAL CLUSTERING : 

The given dataset is subjected to both the type of Hierarchical clustering such as Agglomerative and Divisive approach. As we can refer to the dendrograms displayed in Business Report, it clearly shows that the records can be grouped into 3 different clusters. The cluster heights from the Hierarchical model is sorted and plotted. There is a significant decrease in the height for the first 3 clusters, so we can cut the dendrogram at 3 cluster heights. Hence we can infer that the optimal number of clusters for this dataset is 3. 

The 7 dimensions of the data is reduced into 2 dimensions which explains 88.98% variance of the original data and the rest 11.02% variance is lost in dimensionality reduction. The corresponding clusters are mapped to its components. 


CUSTOMER SEGMENTATION : 

Cluster 1 ; Cluster size -	68 ; Average Silhouette Width - 0.4161420 ; Description -	They are the premium category customers who spend more on purchases made. Their advance payments are also more. 

Cluster 2 ; Cluster size - 52 ; Average Silhouette Width - 0.5168482 ; Description - They belong to the medium category who spend neither high nor low for the purchases made by them. Advance payments made by them is less when compared to the cluster 1. 
 
Cluster 3 ; Cluster size - 90 ; Average Silhouette Width - 0.4157438 ; Description - These customers are categorized as least spenders when compared to the other two categories. But the monthly minimum payment made by them is more than the rest of the clusters. On the other hand, their advance payments by cash is less. 


K MEANS CLUSTERING :

The average silhouette method shows the optimal number of clusters to be chosen as 2. The total within sum of squares calculation depicts the cluster sizes of 3 – 4 can be a prominent decision, as the decrease in height is maximum for these clusters. Even the gap statistic method recommends the number of clusters to be 3.

Hence with reference to the above told graphs (refer source code), we tend to decide on 3 clusters for K-means algorithm for further analysis.  
Now the algorithm, segments all the observations into 3 different clusters, where the inter-cluster objects are highly different and intra-cluster objects are highly similar. Here dimensionality reduction is done from 7 components to 2 uncorrelated components which capture 89% variance of the original data, rest 11% of the variance of the original data is lost.  

CUSTOMER SEGMENTATION : 

Cluster 1 ; Cluster size -	72 ; Average Silhouette Width - 0.3974727  ; Description -	These customers are categorized as least spenders when compared to the other two categories.

Cluster 2 ; Cluster size - 67  ; Average Silhouette Width - 0.4687721  ; Description - They are the premium category customers who spend more on purchases made.  
 
Cluster 3 ; Cluster size - 71  ; Average Silhouette Width - 0.3398158  ; Description - They belong to the medium category who spend neither high nor low for the purchases made by them. 


CLUSTER PROFILING : 

Upon building the Hierarchical clustering and K-means approach for the given Bank Marketing dataset we strongly infer that the customers are grouped into 3 different clusters (categories).With respect to the analysis made with the dataset, all the customers show fluctuating similarities and dissimilarities with each other. The feature, Amount spent by the customer seems to prove crucial in clustering the customer records. 

![image](https://user-images.githubusercontent.com/81927278/185218456-8a033ae7-5bfc-4968-9b3a-626aabd4f4c2.png)






