%Top Script to Train and Classify Handwritten Digits
clear all;

disp('Starting ...');

load_randomized_data = 1;

if (load_randomized_data)
    %Load Data from .mat file
    %This data is randomized
    load('semeion_data_randomized.mat');
else
    %Load Data from .data file
    %This data is arranged in increasing order of digit. so randomize
    data = load('semeion.data');
    data = data(randperm(size(data, 1)), :); %Randomize data rows
end

hn1 = 20; %Number of neurons in the first hidden layer

%divide the dataset into training and testing
traind = 1100; % Training set
testd = 493; % Testing set
train_data = data(1:traind,:);
test_data = data((traind + (1:testd)),:);

%Training function to get weights and biases and save them
%comment out the 2 lines below when a desired test accuracy is reached and
%you want to run only inference.
[w12,w23,b12,b23] = training(train_data,traind,hn1);
%Convert to fixed point
w12 = fi(w12,1,8,4);
w23 = fi(w23,1,8,4);
b12 = fi(b12,1,8,4);
b23 = fi(b23,1,8,4);
save('trained_params.mat','w12','w23','b12','b23');

%Load the saved training parameters
load('trained_params.mat','w12','w23','b12','b23');

%Check train data accuracy
train_accuracy = inference(train_data,traind,w12,w23,b12,b23);
fprintf('Train Accuracy: %f %% \n',train_accuracy);

%Check test data accuracy
test_accuracy = inference(test_data,testd,w12,w23,b12,b23);
fprintf('Test Accuracy: %f %% \n',test_accuracy);

disp('Done!');

%display a sample image
img_num = 20;
sample_img_vector = data(img_num,1:256);
sample_img = reshape(sample_img_vector,[16,16]);
imshow(sample_img.')