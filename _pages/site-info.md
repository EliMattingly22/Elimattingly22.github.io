---
title: "Site Info"
permalink: /site-info/
date: 2019-01-20
---

## Customizations not fully documented in Minimal Mistakes Theme
- replace Home with static page, not recent posts
  - delete default index.hmtl from root
  - place home.md in `_pages`
  - in config near bottom add `"_pages"`
  - in data > navigation, use `"url: /"`

## Theme modification

On home.md feature_row, to delete "Learn More" button but keep clickable images with excerpt text

In `_includes` > feature_row, line 46, delete this portion: `{{ f.btn_label | default: site.data.ui-text[site.locale].more_label | default: "Learn More" }}`

### Markdown image with pre-slash baseurl pathname, actual size, but no caption
![root image caption](/jekyll-remote/images/lobster-root-300x300.jpg)

### [Liquid templating](https://jekyllrb.com/docs/liquid/) image in root no-slash images  
{% include figure image_path="images/lobster-root-300x300.jpg" alt="sample image" caption="here's the sample image" %}

### Liquid image in root no-slash aligned with caption
{% include figure image_path="images/lobster-root-300x300.jpg" alt="sample image" caption="sample caption" %}{: .align-right}
This sample text demonstrates the wrap-around feature with aligned images. This sample text demonstrates the wrap-around feature with aligned images. This sample text demonstrates the wrap-around feature with aligned images. This sample text demonstrates the wrap-around feature with aligned images. This sample text demonstrates the wrap-around feature with aligned images.

### YouTube embed
Code:
{% raw %}
```markdown
{% include video id="3sK7-g0otGM" provider="youtube" %}
```
{% endraw %}

Demo:
{% include video id="3sK7-g0otGM" provider="youtube" %}
