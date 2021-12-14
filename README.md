# Mysterious Box Prediction Challenge
Building a prediction model to predict the sounds a mysterious box makes from certain inputs and switche. 

The task for this challenge was to look at data collected from "the laboratory  (highest security level!) in  nearly 20,000 experiments combining different input signals and switch positions," and build a prediction model that would predict the sounds a mysterious box would make when certain inputs were made and switches were pushed. The training data and my R code are also in this repository. The link for this Kaggle competition is: https://www.kaggle.com/c/mysterious-box-challenge/overview

I decided to make some plots for each attribute to see if I could find anything important. First, I made some plots to see how inputs and switches were related to sound.

![image](https://user-images.githubusercontent.com/46624536/146095249-4b6b9dfc-fe7e-4e67-b7f8-81fd84c451e7.png)

![image](https://user-images.githubusercontent.com/46624536/146095264-56415313-ed90-4067-8564-400f65ca8207.png)

![image](https://user-images.githubusercontent.com/46624536/146095280-57f336f1-d05b-4c42-9427-072de7e33291.png)

![image](https://user-images.githubusercontent.com/46624536/146095298-4792c9b9-7260-463b-a8e5-63c90b0a07e7.png)

![image](https://user-images.githubusercontent.com/46624536/146095353-0eceeda2-c9e1-43f0-886b-9acc529a52ed.png)

I found that the inputs had a lot of overlap in their distributions for each sound, and the distributions for each input, except input 1 were similar. The switches on the other hand had a lot more variation in their distributions. Therefore, I decided to subset the data by switches and make some more plots to see if I could find anything interesting.

![image](https://user-images.githubusercontent.com/46624536/146096306-5a559838-71b5-4901-8829-d8a43b4c31fe.png)

![image](https://user-images.githubusercontent.com/46624536/146096334-bcc3b6fc-6ec7-4a6b-a86c-2b80cede97f9.png)

![image](https://user-images.githubusercontent.com/46624536/146096740-6c91c605-b2ff-422e-a039-0da7833d2095.png)

The plots all showed some variation of these distributions. So for some inputs there is a lot of variation between the sounds while others had very similar distributions. Therefore, I concluded that each of the switches and inputs were important for the sound produced, and the combination of each produced certain sounds.

Thus, I decided to use rpart to build my prediction model. rpart makes a decision tree based on the attributes, variables, and parameters provided. I thought it would be useful for this prediction model because it combines categorical and numerical variables well. 

First, to predict sound, I used all the attributes in the data. For my control, I decided to first make the cp very small, as I saw from the last rpart
challenge that doing that was useful in increasing accuracy. I got the cp as small as 0.0001 to get to as high an accuracy as I possibly get. However, this cp resulted in overfitting, as there were no other controls. Therefore, I used minsplit and minbucket to fix this. After experimenting, I decided to use a minsplit of 150 and a minbucket of 50 to fix the overfitting, while also maintaining a good accuracy. This is my final decision tree:  

![image](https://user-images.githubusercontent.com/46624536/146097480-48d7d9c7-54b5-4937-b68f-f0b599e351cc.png)

The final accuracy from this model was 0.6852283.

Cross validating this model resulted in subset accuracies that were close to the model accuracy I previously got. Furthermore, the control subset accuracies were less than the specific model accuracies, which shows that the control works in improving the accuracy.

![image](https://user-images.githubusercontent.com/46624536/146097946-1290bc7b-b37d-4eb8-9b87-c069b1cdb89a.png)

Ultimately, in the final Kaggle competition, I got an accuracy of 0.67593, which was close to my model accuracy from training and testing. This placed me 24th out of 124 on the competition leaderboard.
