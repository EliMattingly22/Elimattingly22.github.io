---
title: "LED Music Visualizer"
excerpt: "An analog, tunable, PWM music visualizer."
permalink: /Musical-LEDs/
layout: single
header:
  teaser:
sidebar:
  - title: "LED Music Visualizer"
  - title: "Status"
    text: "Finished/Functional"



author_profile: true   
gallery:
  - url: /assets/images/Projects/Hobby/Electronic-Load/HP6060_Sch_Capture.PNG
    image_path: /assets/images/Projects/Hobby/Electronic-Load/HP6060_Sch_Capture.PNG
    alt: ""

---

## [Link to repository](https://github.com/EliMattingly22/Music-LED-Controller)
**Goal:** Create a music visualizer purely with analog circuits-- None of that Fast Fourier Transform or digital filtering rubbish! Kidding, it would be far more suited to do this digitally, but when I initially made it, I wanted to practice using analog filters and PCB layout.

**What I learned:** This project was a nice way to practice multi-stage filters, each which needed to be independently controlled. I learned the advantage of adding buffers in between each stage. When I designed it, it was among the more complex boards, and certainly the most complex that I had assembled, so designing for manufacturing was a concern throughout-- On top of that I learned the benefit of using standard footprints and verifying the footprints before sending it out(the hard way!).

 I also found it fairly surprising how *slow* the LEDs needed to change in order for them to appear "smooth" to the eye. A time constant of about 1 second seemed to work well at keeping up with the perception of sound, but not be obnoxiously flashy.




## **Circuit Described**
The operation of the circuit is fairly straightforward. There are a three (or so) major regions (1) Power management & regulation (2) Signal processing/filtering/amplification (3) Oscillator, digital signals, and MOSFET driving.

1) The power management was pretty standard and was only complicated by my wanting to play with different circuits. I used a barrel jack and 12V input, which was regulated to 5V by an emitter follower referencing a 5.6V Zener diode. A normal 7805 regulator would've been easier. These are followed by buttons which control power to certain sections of the board. They are the soft-latching power circuit designed by Dave Jones at the EEVBlog, but this was one of the mistakes of the board. It just added unnecessary complexity and didn't get populated on the final board. It is much easier to just stop the digital signals than to try and have a semi-finicky button circuit (quiescent current isn't critical here). It made for a decent lesson in feature creep though. Alternatively, using a simple microcontroller to manage the power and other basic features would have been wise (but not in the spirit of the project).

2) The audio signals that come from either a phone/tablet or my microphone circuit first go into a buffer. This is important because it would be a huge shame for the circuit to cause the music to be distorted or have the board's emissions couple into it. It then goes into a variable gain stage and first high/low pass filter. After initial filtering it is buffered and goes through a peak detector, low pass, and another buffer and variable low pass to adjust the "smoothness". Finally this signal is compared to the Oscillator triangle wave for a pulse-width modulated signal. By comparing to a triangle wave, the output duty cycle is linearly proportional to amplitude, although human vision is non-linear, so using a similarly non-linear function would have been better (but that would have been less straightforward to generate).

3) The oscillator is a simple 555-timer circuit. As mentioned before it is approximately a triangle wave. Following the comparison of the peak-detected and filtered audio and digitization of this, a series of logic gates allows the user to pick which of the LED channels the digitized audio corresponds to. Optionally, a DC offset allows for a steady color in the LEDs.


## **Thermal Considerations**

Using MOSFETs with low Rds,ON (at 5V Vgs!!) is important, because if they aren't turned on sufficiently, or high Rds MOSFETs are used, the ohmic losses in the MOSFET will cause them to overheat.


{% include gallery %}
