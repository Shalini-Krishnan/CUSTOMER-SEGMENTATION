SOURCE CODE 
 HIERARCHICAL CLUSTERING 
##### SET UP THE WORKING DIRECTORY #####	 
stats,lattice,Hmisc,ggplot2,factoextra,cluster,summarytools,es
,header = TRUE)->DATA 
 setwd("C:/Training") pacman::p_load(
quisse,tidyverse,dummies,funModeling,scales,rsample,neuralnet,MLmetrics,Infor mationValue,NeuralNetTools) 
read.csv("bank_marketing_part1_Data (2) (1).csv"
###### EXPLORATORY DATA ANALYSIS ###### names(DATA) 
## [1] "spending"                     "advance_payments"            
## [3] "probability_of_full_payment"  "current_balance"             
## [5] "credit_limit"                 "min_payment_amt"             
## [7] "max_spent_in_single_shopping" head(DATA) 
##   spending advance_payments probability_of_full_payment current_balance
## 1    19.94            16.92                      0.8752           6.675 ## 2    15.99            14.89                      0.9064           5.3
## 3    18.95            16.42                      0.8829           6.248
## 4    10.83            12.96                      0.8099           5.278
## 5    17.99            15.86                      0.8992           5.890
## 6    12.70            13.41
##   credit_limit min_payment_amt max_spent_in_single_shopping
## 1        3.763           3.252                        6.550
## 2        3.582           3.336                        5.144
## 3        3.755           3.368
## 4        2.641           5.182                        5.185
## 5        3.694           2.068                        5.837 ## 6        3.091           8.456                        5.000 tail(DATA) 
##     spendi
## 205    16.41            15.25                      0.8866           5.718
## 206    13.89            14.02                      0.8880           5.439 ## 207    16.77            15.62      
## 208    14.03            14.16                      0.8796           5.438
## 209    16.12            15.00                      0.9000           5.709
## 210    15.57            15.15                      0.8527   
##     credit_limit min_payment_amt max_spent_in_single_shopping
## 205        3.525           4.217                        5.618
## 206        3.199           3.986                        4.738	

## 207        3.438           4.920                        5.795	 
 
 
 
 
    11.33  
-----------------------
 
 
 
 
.10   
66 6
## 208        3.201           1.717                        5.001
## 209        3.485           2.270                        5.443 ## 210        3.231           2.640                        5.879 describe(DATA) 
## DATA  
##  
##  7  Variables      210  Observations 
## --------------------------------------------------------------------------
------ 
## spending  
##        n  missing distinct     Info     Mean      Gmd      .05      .10 
##      210        0      193        1    14.85    3.324    11.18
##      .25      .50      .75      .90      .95  
##    12.27    14.36    17.30    18.99    19.54  
##  
## lowest : 10.59 10.74 10.79 10.80 10.82, highest: 20.24 20.71 20.88 20.97 2 1.18 
## ---------------------------------------------------
------ 
## advance_payments  
##        n  missing distinct     Info     Mean      Gmd      .05      .10 
##      210        0      170        1    14.56    1.493    12.86    13.02 
##      .25      .50      .75      .90      .95  
##    13.45    14.32    15.71    16.45    16.73  
##  
## lowest : 12.41 12.57 12.63 12.72 12.73, highest: 17.03 17.05 17.21 17.23 1 7.25 
## ------------------------------------------------------------------------------- 
## probability_of_full_payment  
##        n  missing distinct     Info     Mean      Gmd      .05      .10 ##      210        0      186        1    0.871  0.02664   0.8259   0.8375 
##      .25      .50      .75      .90      .95  
##   0.8569   0.8735   0.8878   0.8993   0.9053  
##  
## lowest : 0.8081 0.8082 0.8099 0.8107 0.8167, highest: 0.9079 0.9081 0.9108 0.9153 0.9183 
## --------------------------------------------------------------------------
------ 
## current_balance  
##        n  missing distinct     Info     Mean      Gmd      .05      
##      210        0      188        1    5.629   0.5029    5.081    5.131 
##      .25      .50      .75      .90      .95  
##    5.262    5.524    5.980    6.273    6.447  
##  
## lowest : 4.899 4.902 4.981 4.984 5.008, highest: 6.573 6.579 6.581 6.6 .675 	

## --------------------------------------------------------------------------	
------ 
## credit_limit  
##        n  missing distinct     Info     Mean      Gmd      .05      .10  
##      210        0      184        1    3.259   0.4362    2.694    2.762  
##      .25      .50      .75      .90      .95  
##    2.944    3.237    3.562    3.787    3.859  
##  
## lowest : 2.630 2.641 2.642 2.648 2.668, highest: 3.930 3.962 3.991 4.032 4 .033 
## --------------------------------------------------------------------------
------ 
## min_payment_amt  
##        n  missing distinct     Info     Mean      Gmd      .05      .10  
##      210        0      207        1      3.7    1.704    1.468    1.789  
##      .25      .50      .75      .90      .95  
##    2.562    3.599    4.769    5.538    6.178  
##  
## lowest : 0.7651 0.8551 0.9030 1.0180 1.1420, highest: 6.9920 7.0350 7.5240 8.3150 8.4560 
## ------------------------------------------------------------------------------- 
## max_spent_in_single_shopping  
##        n  missing distinct     Info     Mean      Gmd      .05      .10  
##      210        0      148        1    5.408   0.5504    4.782    4.870  
##      .25      .50      .75      .90      .95  
##    5.045    5.223    5.877    6.185    6.273  
##  
## lowest : 4.519 4.605 4.607 4.649 4.703, highest: 6.449 6.451 6.453 6.498 6 .550 
## --------------------------------------------------------------------------
------ 
attach(DATA) min(DATA) ## [1] 0.7651 max(DATA) ## [1] 21.18 summary(DATA) 
##     spending     advance_payments probability_of_full_payment current_bala nce 
##  Min.   :10.59   Min.   :12.41    Min.   :0.8081              Min.   :4.89
9   
##  1st Qu.:12.27   1st Qu.:13.45    1st Qu.:0.8569              1st Qu.:5.26 2   
##  Median :14.36   Median :14.32    Median :0.8734              Median :5.52	
   
##  Mean   :14.85   Mean   :14.56    Mean   :0.8710              Mean   :5.62
   
##  3rd Qu.:17.30   3rd Qu.:15.71    3rd Qu.:0.8878              3rd Qu.:5.98    
##  Max.   :21.18   Max.   :17.25    Max.   :0.9183              Max.   :6.67    
##   credit_limit   min_payment_amt  max_spent_in_single_shopping 
##  Min.   :2.630   Min.   :0.7651   Min.   :4.519                
##  1st Qu.:2.944   1st Qu.:2.5615   1st Qu.:5.045                
##  Median :3.237   Median :3.5990   Median :5.223                
##  Mean   :3.259   Mean   :3.7002   Mean   :5.408                
##  3rd Qu.:3.562   3rd Qu.:4.7687   3rd Qu.:5.877                
##  Max.   :4.033   Max.   :8.4560   Max.   :6.550 summarytools::view(dfSummary(DATA)) 
## Switching method to 'browser' 
## Output file written: C:\Users\sachi\AppData\Local\Temp\RtmpsxyXyF\file415c 490f1718.html 
###### UNIVARIATE ANALYSIS ###### 
funModeling::plot_num(DATA	           
4
9
0
5
 
##### AMOUNT SPENT BY CUSTOMER PER MONTH IN 1000's	 
)) 
 
"PROBABILITY OF FULL PAYMENT"))
 
)) 
 )) 
boxplot(spending,col="blue") plot(density(spending,main="SPENDING”) 
##### AMOUNT PAID IN ADVANCE BY CASH IN 100's boxplot(advance_payments,col="red") plot(density(advance_payments,main="ADVANCE PAYMENTS"
##### PROBABILITY OF FULL PAYMENT DONE BY THE CUSTOMER boxplot(probability_of_full_payment,col="ORANGE") 
plot(density(probability_of_full_payment,main= ##### CURRENT BALANCE LEFT IN THE ACCOUNT IN 1000'S boxplot(current_balance,col="CORAL") plot(density(current_balance,main="CURRENT BALANCE" ##### LIMIT OF THE AMOUNT IN CREDIT CARD IN 10,000'S boxplot(credit_limit,col="MAROON") plot(density(credit_limit,main="CREDIT CARD LIMIT"	
 

##### MINIMUM AMOUNT PAID BY THE CUSTOMER FOR PURCHASES	 
)) 
IMUM AMOUNT SPENT IN SINGL
"AMOUNT SPENT PER MONT
"AMOUNT SPENT VS CURRENT BALANCE IN THE AC
xlab = "ADVANCE PAYME
"ADVANCE PAYMENTS VS MAXIM
boxplot(min_payment_amt,col="GREEN") plot(density(min_payment_amt,main="MINIMUM AMOUNT PAID BY THE CUSTOMER"
##### MAXIMUM AMOUNT SPENT IN ONE PURCHASE IN 1000's boxplot(max_spent_in_single_shopping,col="BROWN") 
plot(density(max_spent_in_single_shopping,main="MAX E PURCHASES")) 
##### BI-VARIATE ANALYSIS ##### 
histogram(spending,current_balance,col="violet",xlab = 
H",ylab="BALANCE AMOUNT LEFT",main= COUNT") 
histogram(advance_payments,max_spent_in_single_shopping,
NTS",ylab="MAXIMUM AMOUNT SPENT PER PURCHASE",main= UM AMOUNT SPENT") 
##### CHECK FOR OUTLIERS ##### boxplot.stats(DATA$spending)$out 
## numeric(0) boxplot.stats(DATA$advance_payments)$out 
## numeric(0) boxplot.stats(DATA$probability_of_full_payment)$out 
## [1] 0.8099 0.8081 0.8082 boxplot.stats(DATA$current_balance)$out 
## numeric(0) boxplot.stats(DATA$credit_limit)$out 
## numeric(0) boxplot.stats(DATA$min_payment_amt)$out 
## [1] 8.456 8.315 boxplot.stats(DATA$max_spent_in_single_shopping)$out 
## numeric(0) 
 
 	
##### CALCULATING PAIR-WISE DISSIMILARITY MATRIX	 
"euclidean") 
DISTANCEMATRIX=get_dist(scale(DATA),method = 	
DISTANCEMATRIX	
4.1579071 1.2847115 3.1865704                               
## 208 3.9734642 2.6323493 1.6443571 3.3680139                     
## 209 4.8981949 1.4776409 2.3902404 2.5493453 1.8863991           
## 210 4.3898415 2.0840433 3.2696441 1.7746986 2.6284528 2.3627166 
##### FACTOR VISUALISATION OF DISTANCES 
(DISTANCEMATRIX,gradient = list(low="BLUE",mid="YELLOW",high="BROWN"))
 
##### HIERARCHICAL CLUSTERING	 
 stand=TRUE,metric="euclidean",method="ward") 
##### AGGLOMERATIVE CLUSTERING agnest=agnes(x=scale(DATA), fviz_dend(agnest) 	
 
##### DIVISIVE CLUSTERING	 stand = TRUE,metric = "euclidean") 
diana=diana(x=scale(DATA), fviz_dend(diana) 	
 
##### USING HCLUST FUNCTION	 
 
EMATRIX,method = "complete") 
##### PLOTTING DENDROGRAM OF THE HIERARCHICAL CLUSTERING 
##### BUILDING HIERARCHICAL MODEL #####
HIER_CLUST=hclust(DISTANC plot(HIER_CLUST)	
CLUSTER_HEIGHT<-HIER_CLUST$height	 
 decreasing = TRUE) 
##   [1] 8.0151108 6.0924097 5.2786282 4.8342016 4.6457587 3.7202152 3.717829
##### SORTING THE CLUSTER HEIGHTS IN DESCENDING ORDER #####
CLUSTER_HEIGHT<-sort(CLUSTER_HEIGHT, CLUSTER_HEIGHT 
6 	
 
9 
##  [22] 2.2950752 2.2824688 2.2432911 2.2067287 2.2048015 2.1976320 2.121812
6 
##  [29] 2.1119097 2.1069261 2.0458608 1.9112345 1.9107346 1.9087416 1.831036
##  [43] 1.5452682 1.5436220 1.4818192 1.4016016 1.3954921 1.3938417 1.393397	
1 	
0 
1 
 
1 
 
4 
 
## [113] 0.7474829 0.7372528 0.7342098 0.7291440 0.7273289 0.7239597 0.723514	
8 	
8 
8 
 
8 
 
7 
 
5 
 
1 
## [204] 0.2582703 0.2393325 0.2185603 0.2120604 0.2103357 0.1930437 plot(CLUSTER_HEIGHT) 
rect.hclust(HIER_CLUST,k=3,border = "BROWN")	 
2 
 
##### SEGREGATING THE DATA INTO CORRESPONDING CLUSTERS #####	 
compon
CLUSTERS=cutree(HIER_CLUST,k=3) head(CLUSTERS) 
## [1] 1 2 1 3 1 3 
NEWDATA<- cbind(DATA,CLUSTERS) group1<-subset(NEWDATA,CLUSTERS==1) group2<-subset(NEWDATA,CLUSTERS==2) group3<-subset(NEWDATA,CLUSTERS==3) ##### VISUALISING THE CLUSTERS ##### 
# The clusplot does the dimensionality reduction of the variables into 	
ents and map it with the clusterS	 
CLUSTERS,color=TRUE,shade=TRUE,labels = 2,lines 
clusplot(NEWDATA[,-8],NEWDATA$	
= 1,main = "CLUSTER MAPPING WITH THE DATA")	 
 
##### CLUSTER PROFILING #####	 
"complete") 
list(NEWDATA$CLUSTERS),mean) 
advance_payments probability_of_full_payment current_ba
## 1       1 18.39426         16.16971                   0.8826956        6.1
## 2       2 14.89250         14.55615                   0.8826038        5.5
 13.34433                   0.8554556        5.2
##   credit_limit min_payment_amt max_spent_in_single_shopping 
## 1     3.679338        3.651824                     6.038176 
## 2     3.319096        2.474944                     5.192904 
        4.444679                     5.056311 
 
$CLUSTERS,dist(NEWDATA))####computes silhoutte width
2 0.3680050  
HIER_CLUST 
##  
## Call: 
## hclust(d = DISTANCEMATRIX, method = 
##  
## Cluster method   : complete 
## Distance         : euclidean 
## Number of objects: 210 
##### FINDING THE CENTRIODS OF THE CLUSTERS #####
AGGR<-aggregate(NEWDATA[,-8], AGGR 
##   Group.1 spending lance 72500 
89231 
## 3       3 12.14178        40244 
## 3     2.905767
##### CALCULATING SILHOUTTE WIDTH FOR THE CLUSTERS ##### 
SIL_WIDTH<-silhouette(NEWDATA idth for every row head(SIL_WIDTH[,1:3],12) l cluster to the neighbor one
##       cluster neighbor sil_width
##  [1,]       1        2 0.5910681
##  [2,]       2        1 0.4506353
##  [3,]       1        2 0.6285789
##  [4,]       3        2 0.5969530 ##  [5,]       1        
##  [6,]       3        2 0.3560753
##  [7,]       3        2 0.5739470
##  [8,]       2        3 0.4148031
##  [9,]       1        2 0.5343702
## [10,]       3        2 0.6033751	
## [11,]       1        2 0.4394887
## [12,]       2        3 0.3430638	 
 
## Silhouette of 210 units in 3 clusters from silhouette.default(x = NEWDATA$2:3]) 
ents probability_of_full_payment current_balance ## 1    19.94            16.92                      0.8752           6.675 
## 2    15.99            14.89                      0.9064           5.363 
9           6.248 ## 4    10.83            12.96                      0.8099           5.278 
## 5    17.99            15.86                      0.8992           5.890 
## 6    12.70            13.41                      0.8874           5.183 imit min_payment_amt max_spent_in_single_shopping CLUSTERS neigh
## 1        3.763           3.252                        6.550        1        
## 2        3.582           3.336                        5.144        2        
                        6.148        1        
## 4        2.641           5.182                        5.185        3        
## 5        3.694           2.068                        5.837        1        
                  5.000        3        
summary(SIL_WIDTH) 
CLUSTERS, dist = dist(NEWDATA)) : 
##  Cluster sizes and average silhouette widths:
##        68        52        90  
## 0.4161420 0.5168482 0.4157438  ## Individual silhouette widths: 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. ## -0.4435  0.3805  0.5284  0.4409  0.5907  0.6953
newdata<-cbind(DATA,CLUSTERS,SIL_WIDTH[, head(newdata) 
##   spending advance_paym
## 3    18.95            16.42                      0.882
##   credit_l bor 2 
1 
## 3        3.755           3.368
2 
2 
2 
## 6        3.091           8.456      
2 
##   sil_width 
## 1 0.5910681 
## 2 0.4506353 
## 3 0.6285789 
## 4 0.5969530 
## 5 0.3680050 	
## 6 0.3560753	 

 
##### HIERARCHICAL CLUSTERING	 
 stand=TRUE,metric="euclidean",method="ward") 
##### AGGLOMERATIVE CLUSTERING agnest=agnes(x=scale(DATA), fviz_dend(agnest) 	
 
##### DIVISIVE CLUSTERING	 stand = TRUE,metric = "euclidean") 
diana=diana(x=scale(DATA), fviz_dend(diana) 	
 
##### USING HCLUST FUNCTION	 
 
EMATRIX,method = "complete") 
##### PLOTTING DENDROGRAM OF THE HIERARCHICAL CLUSTERING 
##### BUILDING HIERARCHICAL MODEL #####
HIER_CLUST=hclust(DISTANC plot(HIER_CLUST)	
CLUSTER_HEIGHT<-HIER_CLUST$height	 
 decreasing = TRUE) 
##   [1] 8.0151108 6.0924097 5.2786282 4.8342016 4.6457587 3.7202152 3.717829
##### SORTING THE CLUSTER HEIGHTS IN DESCENDING ORDER #####
CLUSTER_HEIGHT<-sort(CLUSTER_HEIGHT, CLUSTER_HEIGHT 
6 	
 
9 
##  [22] 2.2950752 2.2824688 2.2432911 2.2067287 2.2048015 2.1976320 2.121812
6 
##  [29] 2.1119097 2.1069261 2.0458608 1.9112345 1.9107346 1.9087416 1.831036
##  [43] 1.5452682 1.5436220 1.4818192 1.4016016 1.3954921 1.3938417 1.393397	
1 	
0 
1 
 
1 
 
4 
 
## [113] 0.7474829 0.7372528 0.7342098 0.7291440 0.7273289 0.7239597 0.723514	
8 	
8 
8 
 
8 
 
7 
 
5 
 
1 
## [204] 0.2582703 0.2393325 0.2185603 0.2120604 0.2103357 0.1930437 plot(CLUSTER_HEIGHT) 
rect.hclust(HIER_CLUST,k=3,border = "BROWN")	 
2 
 
##### SEGREGATING THE DATA INTO CORRESPONDING CLUSTERS #####	 
compon
CLUSTERS=cutree(HIER_CLUST,k=3) head(CLUSTERS) 
## [1] 1 2 1 3 1 3 
NEWDATA<- cbind(DATA,CLUSTERS) group1<-subset(NEWDATA,CLUSTERS==1) group2<-subset(NEWDATA,CLUSTERS==2) group3<-subset(NEWDATA,CLUSTERS==3) ##### VISUALISING THE CLUSTERS ##### 
# The clusplot does the dimensionality reduction of the variables into 	
ents and map it with the clusterS	 
CLUSTERS,color=TRUE,shade=TRUE,labels = 2,lines 
clusplot(NEWDATA[,-8],NEWDATA$	
= 1,main = "CLUSTER MAPPING WITH THE DATA")	 
 
##### CLUSTER PROFILING #####	 
"complete") 
list(NEWDATA$CLUSTERS),mean) 
advance_payments probability_of_full_payment current_ba
## 1       1 18.39426         16.16971                   0.8826956        6.1
## 2       2 14.89250         14.55615                   0.8826038        5.5
 13.34433                   0.8554556        5.2
##   credit_limit min_payment_amt max_spent_in_single_shopping 
## 1     3.679338        3.651824                     6.038176 
## 2     3.319096        2.474944                     5.192904 
        4.444679                     5.056311 
 
##### K-MEANS CLUSTERING ####

##### K-MEANS CLUSTERING #####	 
 
method = "silhouette")# 2 CLUSTERS method = "wss")# 3-4 CLUSTERS method = "gap_stat")# 3 CLUSTERS nstart=25) 
means clustering with 3 clusters of sizes 67, 71, 72 
##     spending advance_payments probability_of_full_payment current_balance 
              0.5591283       1.2349319                    0.4485346      -0.2571999 
                  -0.9626050      -0.8955451 ##   credit_limit min_payment_amt max_spent_in_single_shopping                     1.2892273 
                   -0.5844965 
      0.69314821                   -0.6233191 
2	3 3 3 3 3 1 3 2 1 2 3 3 3 2 3 3 2 
##  [38] 3 3 1 1 2 1 1 3 3 2 1 1 1 3 1 1 1 1 1 3 3 3 1 2 3 3 2 2 1 1 2 1 3 2 
##  [75] 3 1 2 3 1 2 2 2 2 1 3 2 1 2 1 3 2 1 2 3 3 1 1 1 3 1 2 1 2 1 2 1 1 3 
3	2 2 1 3 1 1 3 1 2 2 2 3 3 2 ## [149] 2 3 2 3 2 2 3 2 2 3 2 1 1 3 1 1 1 3 2 2 2 3 2 3 2 1 1 1 2 3 2 3 2 2 
 
 
5954 
 
## [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withi
 
##### TO FIND THE APPROPRIATE NUMBER OF CLUSTERS ##### fviz_nbclust(scale(DATA),kmeans, fviz_nbclust(scale(DATA),kmeans, fviz_nbclust(scale(DATA),kmeans, set.seed(123) 
KMEANS=kmeans(scale(DATA),3, print(KMEANS) 
## K-
##  
## Cluster means: 
## 1  1.2536860        1.2589580     
## 2 -0.1407831       -0.1696372
## 3 -1.0277967       -1.0042491
## 1  1.162075101     -0.04511157
## 2  0.001643014     -0.66034079
## 3 -1.082995635
##  
## Clustering vector: 
##   [1] 1 2 1 3 1 3 3 2 1 3 1 2 3 1 2 3
3 3 3 
3 1 1 
3 1 2 
## [112] 2 1 3 3 1 2 2 3 1 2 3 3 3 2 2 1 3 2 2 
3 1 3 
2 2 1 
## [186] 1 3 2 2 3 3 2 3 1 2 1 1 3 1 3 2 1 2 3 1 2 1 2 2 2
##  
## Within cluster sum of squares by cluster:
## [1] 139.5542 144.4586 144.
##  (between_SS / total_SS =  70.7 %)
##  
## Available components: 
##  
nss" 
## [6] "betweenss"    "size"         "iter"         "ifault"
KMEANS$size 
## [1] 67 71 72 	
KMEANS$tot.withinss 
## [1] 428.6082 
KMEANS$totss 
## [1] 1463 
DATA_KMEANS=cbind(DATA,KMEANS$cluster) 
fviz_cluster(KMEANS,data = DATA,ellipse.type = "convex", palette=c("green","r ed","purple"), repel = TRUE,ggtheme = theme_minimal()) 
 
##### KMEANS CLUSTERING THROUGH CUSTOM FUNCTION METHOD #####	 
###custom function created 
 
scaleddata=scale(DATA) silhouette_score<-function(k){ 
  km<-kmeans(scaleddata,centers = k,nstart = 25)   ss<-silhouette(km$cluster,dist(scaleddata))   mean(ss[,3]) 
} k<-2:10 
avgsil<-sapply(k,silhouette_score) avgsil 
## [1] 0.4657725 0.4007271 0.3347542 0.2863816 0.2884669 0.2756290 0.2532527
## [8] 0.2539565 0.2623969 
plot(k,type = "b",avgsil,xlab = "number of clusters",ylab = cores",frame=FALSE) 	
 
## ONLY AT VALUE 2 ,the silhouette score is high ##	
 ### wss plot ### 
wssplot<-function(data,nc=15,seed=123){   wss<-c()###creating a empty or null array   for(i in 1:nc){     set.seed(seed) 
    wss[i]=sum(kmeans(data,centers = i)$withinss)} 
  plot(1:nc,wss,type = "b",xlab = "number of clusters",ylab = "within sum of squares") 
   
} 	
wssplot(scaleddata,nc=5)	 	
 
## wss plot shows 3 clusters are significant	 
 
#### running the kmeans algorithm with k value as 3	

kmeansclus<-kmeans(scaleddata,centers =3)	 
 
 
-0.9626050      -0.8955451 
                   0.5591283       1.2349319 
                   0.4485346      -0.2571999 
 
-0.6233191                     1.2892273 
                   -0.5844965 
1	3 2 2 2 1 2 2 2 2 2 1 1 1 2 3 1 1 3 3 2 2 3 2 1 3 
2	2 1 2 2 2 1 3 3 3 1 3 1 3 2 2 2 3 1 3 1 3 3 
  
 
3	1 3 1 3 3 1 3 3 1 3 2 2 1 2 2 2 1 3 3 3 1 3 1 3 2 2 2 3 1 3 1 3 3 
kmeansclus 
## K-means clustering with 3 clusters of sizes 72, 67, 71
##  
## Cluster means: 
##     spending advance_payments probability_of_full_payment current_balance
## 1 -1.0277967       -1.0042491                  
## 2  1.2536860        1.2589580 ## 3 -0.1407831       -0.1696372
##   credit_limit min_payment_amt max_spent_in_single_shopping
## 1 -1.082995635      0.69314821                   
## 2  1.162075101     -0.04511157
## 3  0.001643014     -0.66034079
##  
## Clustering vector: 
##   [1] 2 3 2 1 2 1 1 3 2 1 2 3 1 2 3 1 3 1 1 1 1 1 2 1 3 2 3 1 1 1 3 1 1 3 1 1 1 
##  [38] 1 1 2 2 3 2 2 1
1 2 2 
##  [75] 1 2 3 1 2 3 3 3 3 2 1 3 2 3 2 1 3 2 3 1 1 2 2 2 1 2 3 2 3 2 3 2 2 1 
1 2 3 
## [112] 3 2 1 1 2 3 3 1 2 3 1 1 1 3 3 2 1 3 3 1 3 3 2 1 2 2 1 2 3 3 3 1 1 3 1 2 1 
## [149] 3 1 3 1 3 3 1 3 3 1 3
3 3 2 
## [186] 2 1 3 3 1 1 3 1 2 3 2 2 1 2 1 3 2 3 1 2 3 2 3 3 3
##  
## Within cluster sum of squares by cluster:
## [1] 144.5954 139.5542 144.4586 
##  (between_SS / total_SS =  70.7 %) 
##  
## Available components: 
##  
## [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withi nss" 
## [6] "betweenss"    "size"         "iter"         "ifault" kmeansclus$cluster 
##   [1] 2 3 2 1 2 1 1 3 2 1 2 3 1 2 3 1 3 1 1 1 1 1 2 1 3 2 3 1 1 1 3 1 1 3 
1 1 1 
##  [38] 1 1 2 2 3 2 2 1 1 3 2 2 2 1 2 2 2 2 2 1 1 1 2 3 1 1 3 3 2 2 3 2 1 3 1 2 2 
##  [75] 1 2 3 1 2 3 3 3 3 2 1 3 2 3 2 1 3 2 3 1 1 2 2 2 1 2 3 2 3 2 3 2 2 1 
1 2 3 
## [112] 3 2 1 1 2 3 3 1 2 3 1 1 1 3 3 2 1 3 3 1 3 3 2 1 2 2 1 2 3 3 3 1 1 3 
1 2 1 
## [149]	

3 3 2	 
## [186] 2 1 3 3 1 1 3 1 2 3 2 2 1 2 1 3 2 3 1 2 3 2 3 3 3 
-DATA 
$clusters<-kmeansclus$cluster 
DATA1) 
-aggregate(DATA1[,-c(8)],list(DATA1$clusters),mean) 
##   Group.1 spending advance_payments probability_of_full_payment current_ba  
## 1       1 11.85694         13.24778                   0.8482528        5.2  
## 2       2 18.49537         16.20343                   0.8842104        6.1  
    3 14.43789         14.33775                   0.8815972        5.5  
##   credit_limit min_payment_amt max_spent_in_single_shopping 
## 1     2.849542        4.742389                     5.101722 
## 2     3.697537        3.632373                     6.041701 
## 3     3.259225        2.707341                     5.120803 
### checking the silhouette width to check whether the clustering done is rig ht or wrong silhouette(kmeansclus$cluster,dist(scaleddata)) 
##        cluster neighbor   sil_width 
##   [1,]       2        3 0.573698738 
##   [2,]       3        2 0.366386385 
##   [3,]       2        3 0.637783633 
##   [4,]       1        3 0.512458189 
##   [5,]       2        3 0.362276328 
##   [6,]       1        3 0.218446378 
##   [7,]       1        3 0.472866603 
##   [8,]       3        1 0.361812167 
##   [9,]       2        3 0.520284534 
##  [10,]       1        3 0.532516795 
##  [11,]       2        3 0.467591909 
##  [12,]       3        1 0.132241158 
##  [13,]       1        3 0.389667686 
[14,]       2        3 0.524781197 ##  [15,]       3        1 0.112215283 
##  [16,]       1        3 0.221295736 
##  [17,]       3        2 0.337957234 
##  [18,]       1        3 0.499901572 
##  [19,]       1        3 0.031553437 
##  [20,]       1        3 0.235756599 
##  [21,]       1        3 0.359037295 
##  [22,]       1        3 0.366127540 
##  [23,]       2        3 0.432773071 
## attr(,"Ordered") 
## [1] FALSE 
## attr(,"call") 
## silhouette.default(x = kmeansclus$cluster, dist = dist(scaleddata))
## attr(,"class") ## [1] "silhouette" head(sil[,1:3],10) 
##       cluster neighbor sil_width 
##  [1,]       2        3 0.5736987 
##  [2,]       3        2 0.3663864 
##  [3,]       2        3 0.6377836 

