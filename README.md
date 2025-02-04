# DeepFakeDetection using 3D CNN and VGG 16 📹


## Overview 🔎
This repository contains the implementation of a 3D Convolutional Neural Network (3D CNN) and VGG 16. Using Mediapipe for extracting frames and detecting faces. 

## Model Architecture 🧠
The model is implemented using Tensorflow: 

1. **Convolutional Blocks**
   - 4 convolutional blocks with increasing filter sizes (32, 64, 128, 256).
   - Each block includes:
     - 3D Convolutional layers with swish activation.
     - Batch Normalization.
     - SpatialDropout3D for regularization.
     - MaxPooling3D for dimensionality reduction.

2. **Fine Tuning VGG 16**
   - Freezing trainable layers
   - Adding :
       - **Global Average Pooling:**
       -  Condenses feature maps.
       - **Dense Layers:**
       - 1024, 512, and 256 neurons with ReLU activation, He-normal initialization, and L2 regularization.
       - Batch Normalization and Dropout (0.6, 0.5, and 0.4).
       - **Output Layer:**
       - A single neuron with sigmoid activation for binary classification.
     

### Data Preparation 🗂️
- The model accepts input data in the shape `(depth, height, width, channels)`.
- Ensure your data is preprocessed and normalized appropriately.


## Applications
- **Video Analysis:** Action recognition, video anomaly detection.


## Contributing 👩‍💻
- Shahad Adel
- Sana Araj
- Sara Thaer
- Deem Alrashidi
- Sahar Alshehri



## Acknowledgments ✨
Special thanks to Dr. Mustafa Youldas for his exceptional guidance and unwavering support.
