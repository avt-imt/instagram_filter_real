#!/usr/bin/env python3
import glob
import sys
import os
import multiprocessing
import functools

from PIL import Image
import pilgram


def all_filters():
    f = {}

    filters = ["aden", "clarendon", "gingham", "hudson", "lark", "mayfair", "perpetua", "rise", "valencia", "xpro2"]
    for fn in filters:
        f[fn.replace("xpro2", "xproii")] = getattr(pilgram, fn)
    f["normal"] = lambda x: x  # unmodified image as a "filter" function
    return f


def apply_filters(img, outputfolder):
    im = Image.open(img)
    filters = all_filters()
    for filter in filters:
        image_path = os.path.join(outputfolder, filter) + "_" + os.path.basename(img)
        filters[filter](im).save(image_path)


def main():
    base_imgs = list(glob.glob("src_imgs/*.png"))

    print(f"create all filtered images, based on {len(base_imgs)=}")

    outputfolder = "imgs"
    os.makedirs(outputfolder, exist_ok=True)
    print(f"save processed images to {outputfolder=}")

    pool = multiprocessing.Pool(multiprocessing.cpu_count())
    apply_filters_ = functools.partial(apply_filters, outputfolder=outputfolder)
    pool.map(apply_filters_, base_imgs)


if __name__ == "__main__":
    main()
