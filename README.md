## Data Communications (CO250): Mini-Project

**Title:**

A Highly Secure Video Steganography using Hamming Code (7, 4)

**Members:**

Dibyadarshan Hota (16C0154) - <dibyadarshan.hota@gmail.com>

Omkar Prabhu (16C0233) - <omkarp.nitk@gmail.com>

**Abstract:**

Preventing unauthorized access, use, disclosure or destruction of data is gaining importance in the Digital world. Steganography and data hiding have become necessary for information security. Steganography is the practice of concealing a file, message, image, or video within another file, message, image, or video. 

The paper referenced has proposed a secure video steganography algorithm using linear block code. The algorithm requires a video to be converted into frames and changing the pixel positions. The message which is to be transmitted must be converted into one-dimension, XOR and Hamming code are applied to this message. Then this encoded message is embedded in the scrambled video frames. These frames are reconstructed and sent to the receiver. The receiver can extract information using the same key as the sender side. The receiver has to disassemble the video, use XOR and hamming code to reconstruct the correct intended message.


**Objectives:**
* Implement the following in MATLAB:
    
    At sender's side:

    * Conversion of video frames into a YUV format.

    * Applying (7, 4) Hamming code to 1D structure of message which is a image to obtain the codeword.

    * Embedding the message codeword into the video frames.

    * Recontruct the video from the frames.

    At receiver's side:

    * Split the received video into frames and convert them to YUV format.

    * Retrieve back the message codeword from the frames.

    * Retrieve back original message from the message codeword by using decoding for hamming code.  
       

**References:**

Ramadhan J. Mstafa, Khaled M. Elleithy, "A highly secure video steganography using Hamming code (7, 4)," presented at Systems, Applications and Technology Conference (LISAT), 2014 IEEE Long Island, Farmingdale, NY, USA, May 2-2, 2014. 

[View Paper](http://ieeexplore.ieee.org/document/6845191/)


## File Structure

* Introduction.md - Explains theoretical aspects of the mini project.

* Design.md - Explains design aspects of the mini project.

* main.m - Main module of the implementation.
