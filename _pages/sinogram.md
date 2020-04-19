---
permalink: /sinogram/
title: "Sinogram"
layout: single
header:
  overlay_image: /assets/images/Sinogram.jpg
  overlay_filter: 0.5
  actions:
    - label: "This banner is a sinogram! But the text is still unfinished :("

feature_row:
  - image_path: /assets/images/Projects/Sinogram/Simple_Sinogram_Animation.gif
    alt: "The formation of a sinogram"
    title: "Simple sinogram formation"
    excerpt: "This is a simple animation of the formation of a sinogram"

  - image_path: /assets/images/Projects/Sinogram/Simple_Sinogram_Animation_Recon_Fixed.gif
    alt: "Simple recon"
    title: "Simple recon animation"
    excerpt: "This is showing how a sinogram can be used to rebuild an image"

    
  - image_path: /assets/images/Projects/Sinogram/Phantom_Sinogram_Animation.gif
    alt: "Sinogram of a phantom image"
    title: "P Phantom sinogram animation"
    excerpt: "Animation of the formation of a sinogram with an image of a P"

  - image_path: /assets/images/Projects/Sinogram/Phantom_Sinogram_Animation_Recon.gif
    alt: "Recon of a P"
    title: "Recon of a P"
    excerpt: "A reconstruction of the P from a sinogram"


---
{% include feature_row %}
# Sinograms!

So first, why am I so excited about these that it is the banner of *every* page and is the first standalone page I am writing? Well, as I'll hopefully be able to convey, these swirly abstract shapes contain a lot of really interesting math, are the basis for a lot of work I do day-to-day, and frankly I think they are art in their own right. It really embodies a lot of what I want this page to be about: cool engineering, and (my attempts at) art.

## The basic principle 

To me, the real interesting application of these sinograms to me is image reconstructon in medicine, though [according to wikipedia](https://en.wikipedia.org/wiki/Radon_transform) there are a whole slew of them-- like barcode reading apparently? Think of the case of an unfortunate patient getting an X-ray after being shot in the abdomen. The doctor will clearly want to know where the bullet is lodged, and from the first front-to-back image they can tell if it is lodged on the left or right side of the person, but not how far forward or backwards it is. So the keen doctor thinks "Eureka! I can take a second image from the side and see how far forward it is!" So they do, and take you into surgery and grab the bullet and you are miraculously healed. This is exactly the working principle behind CT; take tons of X-Ray images from different angles, and put them together to build up a slice-based (called "tomographic") image. That is precisely what you see in the four animations at the top of this page. 


Magnetic Particle Imaging (MPI) works similarly (sometimes) except it doesnt use X-Rays, instead it used magnets to move a sensitive line through the imaging region, but that is a topic for another time. 

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Phantom_Sinogram_Animation_Recon.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Phantom_Sinogram_Animation.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation_Recon_Fixed.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation.gif){: .align-center}



<figure style="width: 150px" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation.gif" alt="">
  <figcaption>Look at this wodnerful caption.</figcaption>
</figure> 



