---
title: "PWM Fan Controller"
excerpt: "A PWM fan controller."
permalink: /Fan-Controller/
layout: single
header:
  teaser:
sidebar:
  - title: "PWM Fan Controller"
  - title: "Status"
    text: "Completed"



author_profile: true   
gallery:
  - url:
    image_path:
    alt: ""

---

The goal for this was to create a simple controller that took in an analog voltage and convert it to a PWM signal for a CPU fan. The application that motivated this project was to control the speed of the vent fan above my soldering station. At the default (full) speed, the sound is quite annoying and the speed wasn't needed. This solution is perfectly sufficient. 

It is also worth noting, this project was also an excuse for me to practice using the ATTiny85's ADC and PWM functions. If it was really about the application, I would have just bought one on eBay or Amazon for ~$3. But this way is more fun.




{% include gallery %}
