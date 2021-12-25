---
title: "Inductor Saturation Tester"
excerpt: "An device to test the saturation current of inductors"
permalink: /Inductor_Sat_Tester/
layout: single
header:
  teaser:
sidebar:
  - title: "Inductor Tester"
  - title: "Status"
    text: "Ongoing development"



author_profile: true   
gallery:
  - url: /assets/images/Projects/Hobby/Electronic-Load/HP6060_Sch_Capture.PNG
    image_path: /assets/images/Projects/Hobby/Electronic-Load/HP6060_Sch_Capture.PNG
    alt: "UPDATE - Wrong figure"

---

## [Link to repository](https://github.com/EliMattingly22/Inductor_Saturation_Tester)

I have designed a number of inductors and transformers that should be highly linear, and it would be useful to validate that. Presumably the datasheets have all the information I need, but I also thought it would be a fun project. There are also cases where I have an unknown core/inductor I want to check the properties of.

Here are a bunch of useful links:

https://hackaday.com/2014/09/23/making-an-inductor-saturation-current-tester/

http://www.vk2zay.net/article/200

https://www.eevblog.com/forum/projects/inductor-saturation-tester-alternative-route-to-dump-the-excess-energy/


## **Circuit Described**
The circuit uses a large capacitor bank to ramp the current up in the inductor until the preset threshold is reached. In an inductor, V = L dI/dt. If L is linear, with a constant V, the rate of current increase will be linear. As it saturates, the inductance goes down, so the slope increases. 



{% include gallery %}
