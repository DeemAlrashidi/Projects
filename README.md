# 📹 DeepFakeDetection using 3D CNN and VGG 16

## 📜 Project Overview 
*This project contains the implementation of a 3D Convolutional Neural Network (3D CNN) and VGG 16. Using Mediapipe to extract frames and detect faces.*

## 🧠 Model Architecture
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

## 🗂️ Applications
- **Video Analysis:** Action recognition, video anomaly detection.

## Contributions 👩‍💻
- Shahad Adel
- Sana Araj
- Sara Thaer
- Shahad Khalid

## Acknowledgments ✨
*We would like to thank Dr. Mustafa Youldash for his guidance in this project.*
