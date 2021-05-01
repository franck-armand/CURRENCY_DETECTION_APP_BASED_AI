
---
**_THE DESIGN AND IMPLEMENTATION OF AN IMAGE BASED PAPER CURRENCY DETECTION SYSTEM_**
---

Despite the fact that the world is moving at an incredible rate toward the cashless payment, paper currencies still play a major role in our daily transactions due to its convenience. However, being able to correctly identify banknotes remains an issue for individuals visually impaired or blind due to the variant shape and texture of paper currency. Different techniques have been used by researchers to successfully recognize banknotes. Among those, algorithms and systems such as Scale Invariant Feature Transform (SIFT) and Currency Recognition System For Visually Impaired (CRSFVI) applied to Jordanian and Egyptian currency respectively achieve 71% and 89% accuracy

a paper currency detection system (PCDS) is designed to detect the Chinese banknotes to assist visually impaired individuals. The system implementation is based on one of the most widely used Deep Learning (DL) algorithm for object detection; You Only Look Once version 3 (YOLOv3) as stated in the name only looks at the image once which makes it incredibly fast. The PCDS has been designed and implemented into an Android mobile application allowing the user to either take or load a picture from the smartphone which then goes through the detection system and returns the final result which is the detection performed on the provided input. The user receives the result of the detection through the mobile’s speaker (auditory output). The experimental results show that the system identifies Chinese banknotes with an accuracy of **99.74%**.

![1](https://user-images.githubusercontent.com/52790721/116784200-8d401b00-aac5-11eb-99ab-9eb1529e0fc5.PNG)

---
**_DATASET DESIGN AND IMPLEMENTATION_** 
---

Our system requires images of Chinese banknote, unfortunately, there is no such dataset available, therefore, we designed our dataset. Its implementation relies on the important number of pictures taken, in total 1639 images of different values as described in the table below. Furthermore, the images were obtained from various angles and backgrounds to best stimulate the real-life scenario, knowing that the picture will not always be clear, or in the focus of the camera. Additionally, we aimed to have a robust dataset to accurately train and validate the performance of our model, hence each value of banknote includes a front a back image as resumed in the table below. 

|**Currency value** |**Number of images** |
|--- |--- |
|100 Yuan Back / 100 Yuan Front|142 / 102 |
|50 Yuan Back / 50 Yuan Front	|82 / 54 |
|20 Yuan Back / 20 Yuan Front |101 / 90 |
|10 Yuan Back / 10 Yuan Front |91 / 67 |
|5 Yuan Back / 5 Yuan Front |88 / 95 |
|1 Yuan Back / 1 Yuan Front |109 / 69 |
|0.5 Yuan Back	 / 0.5 Yuan Front |177 / 101 |
|0.1 Yuan Back / 0.1 Yuan Front |105 / 166 |
|**_TOTAL Currency value_** |**_1639 images_**|

Additionally, some samples of the taken pictures along with their descriptive backgrounds.  This gives an insight into how our dataset was designed 

![1](https://user-images.githubusercontent.com/52790721/116784115-00955d00-aac5-11eb-9d31-a2a1131aede6.PNG)

---
**_IMPLEMENTATION RESULT_** 
---
![Figure_1](https://user-images.githubusercontent.com/52790721/116784729-66cfaf00-aac8-11eb-97ba-f87264defbc0.png)

The relationship between the loss function, mAP, and number of iterations is described as follows, over the first 1000 iterations, the loss starts decreasing while the mAP begins to gradually increase and reach the value of 56%. Similarly, at the 2000th iterations, the loss keeps on decreasing conversely the `mAP` rises to 97%. From the next till the final iterations, the loss maintains its path while the mAP stabilized around 99%. Additionally, the mean average position per class and the unique recall `mAP@0.50` is given in the figure below.

![mAp_each_class](https://user-images.githubusercontent.com/52790721/116784958-9af79f80-aac9-11eb-996f-8f64ee4cee62.png)

---
**_DETECTION RESULTS_**
---

