This is the final project of the Coursera course "Applied Machine Learning in Python" offered by University of Michigan.
Some modifications have been made to provide a better presentation and a more complete process.  
Some findings:
a) The overall accuracy and AUC score of the 3 models are similar;  
b) The baseline accuracy is 0.9276, which is very close to the 3 training models. This indicates that **there might be missing features, as training the model does not improve the accuracy a lot**;   
c) Precision and Recall scores are various in these 3 models. Usually, there is a tradeoff between precision and recall. **For this case, we would like to decrease the number of false positives (False positive means we wrongly classify someone into compliance, but actually he does not pay in time. This will lead to the failure of collecting money back and negatively affect the financial situation of relevant parties.)** So it is better to use a model with **higher precision score**. Based on the above, we can safely conclude that the **Gradient Boosted Decision Trees with learning_rate 0.01 and max_depth 2** is a best model to predict blight violations.
