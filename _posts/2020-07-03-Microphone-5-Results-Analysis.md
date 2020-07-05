---
title: "Microphone-Results-Analysis-1"
date: 2020-07-03T10:31:30-04:00
categories:
  - blog
tags:
  - project
  - microphone

sidebar:
layout: single
---

# Results


I've built quite a few microphone circuits in the last few months since I have updated this project, and in the process I learned a tremendous amount-- in addition to everything about the microphones, pre-amps etc., but also about circuit board layout and manufacture. Until now, I've had very limited experience fabricating PCBs (I imagine because I never considered it an option due to my own lack of skill), but since committing to learning it seems there to be an endless list of boards I want to work on. Some things I learned off the bat:
* Silk-screens are not optional -- well, I suppose they are, but it sure helps if you put the time in ensuring parts are labeled well, and terminals have the polarity written on them (if I can plug it in backwards, I probably will unless it is written on the board).
* Reverse voltage, over-voltage, over-current protection are also worth designing into the board. It saves time and cost in the long-run.
* Test points are much easier to probe than little pads of SMD components.
* Adding features such as room for jumpers, 0 Ohm resistors etc. is very easy in CAD, and barely takes room on the board, and they don't need to be populated if they aren't used.
* I recall in EOD there was a saying "neat demo is good demo", well a neat PCB is a good PCB. At least for me, every time I tidy up the circuit I catch mistakes.
* Auto-router is not worth using (I'm sure it has a role, but not for the majority of the routing). I like routing the boards. First, doing it myself ensures the layout of components makes sense, and also it ensures the important traces (signals, power, etc.) are routed logically. It's rather cathartic too. 

That is obviously a non-exhaustive list, but before I get too side-tracked, I want to get back to the current results of the project at hand. Below is an audio clip recorded with my microphone, which is plugged into a cheap USB sound-card.



<audio controls>
  <source src="/assets/Audio/Microphone/InitialTesting/USB_Soundcard/MyMic_WithSoundcard_Baseline_Talking.mp3" type="audio/mpeg">

</audio>


Now here is a "Blue Snowball" conenser microphone. It is ~$50 and gets very positive reviews for the most part.


<audio controls>
  <source src="/assets/Audio/Microphone/InitialTesting/BlueSnowball/BlueSnowball_BaselineTest.mp3" type="audio/mpeg">

</audio>


I also played with using my oscilloscope to record the audio (USB from the scope to my computer and saving the data in the EasyScope application). When I record this way it sounds terrible. The scope I was using only has an 8-bit ADC (analog to digital converter), so when you look at the waveforms it is immediately apparent that there is a digitizing error. To be continued...


<audio controls>
  <source src="/assets/Audio/Microphone/InitialTesting/Scope_Recording/siglent_Data_Speaking_MicOpen.mp3" type="audio/mpeg">
  <source src="/assets/Audio/Microphone/InitialTesting/Scope_Recording/siglent_Data_Speaking_MicOpen.wav" type="audio/wav">
</audio>

The other 


![ ]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Hobby/Mic/Data-Figures/siglent_Data_Speaking_MicOpen_CropZoomData_WithExported.png){: .align-center}

