






![alt text](https://github.com/adityaknegi/Computer-Vision-Image-Filtering-and-Hybrid-Images/blob/master/all.png)



## OVERVIEW

Step by step process

**imresize first**

[row, col] = size(image1(:,:,1));
image2=imresize(image2,[row, col],'lanczos3');

**Image filtering**
imgaussfilt(image1,5)

**Hybrid image**

hybrid_image = low_frequencies + high_frequencies;


##  IMPLEMENTATION
- **Image filtering**

%%imgaussfilt(A,sigma) filters image A with a 2-D Gaussian smoothing kernel with standard deviation specified by sigma
imgaussfilt(image1,5)


low_frequencies = imgaussfilt(image1,5);
high_frequencies = image2 - imgaussfilt(image2,5);



## HOW TO RUN
Open matlab
Firt go to  folder and type filename in matlab

>>A1      ## Enter 




## OUTPUT 
Following pairs of  people ( young and old lady) 

Scaledown is used for far view 
scale_factor = 0.6;

finally save output figures



