# Design of Image Compressor and Decompressor
## Lab 6_1: compress the image with a codebook
Integrate all components (MAN, MIN, controller…) to form a compressing system (system). The system will be the framework for your final design lab. The block diagram of system is as shown in Fig2 and Fig3.  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/8f4b4f44-ff65-40e8-b8bc-705d5f59ce8d)  
Fig2. The block diagram of system (external)  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/e91da0e8-0ee9-49ab-8f61-a2dcd5f59d3d)  
Fig3. The block diagram of system (internal)  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/57af5196-3f1e-4e33-907a-43ea26c290cb)  
Understanding the function:  
Once system is initialized, it  
 a)	read codebook from the RAM_W to 64 VEPs instances  
 b)	read a pixel from the RAM_IF at a time, and compute the Manhattan distances among that pixel and 64 weights of codebook, after that, choose the id which represents the data tag for the weight having the 
shortest distance among other weights.  
 c)	writes the data tag back to the RAM_TAG.  
 d)	repeats the process step (b)-(c) until the last pixel of RAM_IF is updated.  
 e)	flags “done” when step (d) is completed.  
Know the basic design rules  
All operations initiated on the positive edge trigger of the clock  
Control signals:  
RAM_WE: To store the data to RAM  
RAM_OE: To read data from RAM  
done: Stop the process  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/673191d3-48cd-4cf5-a5e1-6339e56e2ce9)  
## Lab 6_2: decompress the image
Use codebook and data tags to decompress the image:  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/b249a96f-81fe-4655-8eac-1c28b9364323)  
Block diagram for architecture(external)  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/c1e643fd-0149-417e-a704-bb430ae350c1)  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/10b317e1-bc64-47d8-96d7-b7a10aa0e521)  
Control signal  
done: Stop the process if you decompress all pixels in a figure.  
![image](https://github.com/MikazukiHikari/Design-of-Image-Compressor-and-Decompressor/assets/100305577/a4528240-e308-4493-a906-d6d24a6022a5)  

