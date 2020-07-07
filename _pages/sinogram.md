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

# Sinograms!

So first, why am I so excited about these that it is the banner of every page and is the first standalone page I am writing? Well, as I'll hopefully be able to convey, these swirly abstract shapes contain a lot of really interesting math, are the basis for a lot of work I do day-to-day, and frankly I think they are art in their own right. It really embodies a lot of what I want this site to be about: cool engineering, and (my attempts at) art.

## The basic principle 

To me, the real interesting application of these sinograms to me is image reconstruction in medicine, though [according to wikipedia](https://en.wikipedia.org/wiki/Radon_transform) there are a whole slew of them-- like bar-code reading apparently? Think of the case of an unfortunate patient getting an X-ray after being shot in the abdomen. The doctor will clearly want to know where the bullet is lodged, and from the first front-to-back image they can tell if it is lodged on the left or right side of the person, but not how far forward or backwards it is. So the keen doctor thinks "I can take a second image from the side and see how far forward it is!" So they do, and take you into surgery and grab the bullet and you are miraculously healed. This is exactly the working principle behind CT; take numerous of X-Ray images from different angles, and put them together to build up an image. 

Magnetic Particle Imaging (MPI) works similarly (sometimes) except it doesn't use X-Rays, instead it used magnets to move a sensitive line through the imaging region, and while the physics behind MPI are a topic for another time for now you can compare this sensitive line to the X-Ray beams in CT. In the first video below what you are seeing is an image in the bottom right (arbitrarily the letter P) have green line pass over it. This green line represents the sensitive line in MPI or the X-Rays (so the beam would go from right to left), and then the intensity of the pixels along the line are added together and plotted on the left. These values make up a "projection" because you are projecting a 2D image onto a single line. You will also notice that as the green line moves one of the columns on top starts filling in. The colors on top are just a different color-based representation of the data in any given projection. It is worth noting that the thickness of these columns is purely to make it easier to see-- it doesn't mean anything and it is a 1D data set.

<video controls>
  <source src="/assets/images/Projects/Sinogram/P_Letter_Proj_Build_1.avi" type="video/avi">
</video>  

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Phantom_Sinogram_Animation_Recon.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Phantom_Sinogram_Animation.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation_Recon_Fixed.gif){: .align-center}

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation.gif){: .align-center}



<figure class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/Projects/Sinogram/Simple_Sinogram_Animation.gif" alt="">
  <figcaption>Look at this wodnerful caption.</figcaption>
</figure> 



