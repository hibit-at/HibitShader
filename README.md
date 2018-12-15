# Abstract

**Hibit Shader** is an alternative Unity shader made by [@hibit_at](https://twitter.com/hibit_at)

# Features

- Easy to set up (only 2 parameter)
- Make your avatar lit up softly
- Normal map available
- Hue changing system.

# How to Use

(If you can’t read Japanese, maybe you could understand :D )
![howtouse](https://github.com/hibit-at/HibitShader/blob/image/how%20to%20use.PNG)

# Contents

- HibitShader.shader

This is the shader for Unity 2017.4.15. (and probably works also in later versions)

- HibitShader_NonNormal.shader

This is almost equal to the upper one.
But, due to the error I can’t solve, this version doesn’t support Normal map. (Sorry!)

# Licence

This repository is under MIT License.

# Updates

ver1.00 - 12/01 released

ver1.01 - 12/02 made rimcolor reflect huechanged color

made rimcolor reflect environmental lights

ver1.02 - 12/15 made another version "HibitShader_NonNoraml"

NOTICE : Applying NormalMap may cause the change of brightness at the edge of seam. It's REGARDLESS whether you actually set the texture of NormalMap. I don't know the reason, sorry. To avoid this problem, I made another version without NormalMap. If you don't need to use NormalMap, or If you want softer taste of Shader, you can choose this version.
