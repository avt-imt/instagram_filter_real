# Instagram-like filters for real images
Repository for the paper about "Analysis of appeal, quality, and realism for Instagram-like filtered real photos".

## requirements
* python3, unzip, wget, the code is only tested under ubuntu 24.04, most bash scripts are simple uv commands
* uv for running and dependency management
* to run the jupyter notebooks run `uv run --with jupyter jupyter lab` 

The image feature tool is taken from [sophoappeal_image_features_tool](https://github.com/Telecommunication-Telemedia-Assessment/sophoappeal_image_features_tool) with added files for uv to be used.

## preparation
Run `./download.sh` to download the source images (stored in `src_imgs`)  and the filtered images (stored in `imgs` including the source images as `normal_*`).
The script `uv run create_filtered.py` will create the filtered images based on the source images, however the execution is not needed.

## structure

* in `evaluation` all jupyter notebooks can be found
* the sub folder `evaluation/features` includes a modified version of the [sophoappeal_image_features_tool](https://github.com/Telecommunication-Telemedia-Assessment/sophoappeal_image_features_tool), the bash script `calculate_features.sh` provides the code to recalculate the features
* the sub folder `evaluation/iqa` includes the objective metrics, the bash script `calculate_iqa_metrics.sh` can be used to recalculate the metrics
* `evaluation/ratings` includes the raw exported rating files from [AVrateVoyager](https://github.com/Telecommunication-Telemedia-Assessment/AVrateVoyager)
* `avratevoyager` contains brief explanations to reproduce the rating software with adjustments to AVrateVoyager included in the folder


* within `evaluation` jupyter notebooks are stored for the evaluation:
    * `feature_analysis_dataset.ipynb` is for the feature characterization of the base images
    * `evaluation_user_ratings.ipynb` is for the subjective evaluation including outlier removal and cleanup of ratings
    * `evaluation_objective_metrics.ipynb` uses output data from the `evaluation_user_ratings.ipynb` and covers all objective subjective rating analysis



## acknowledgments :book:
If you use this software in your research, please include a link to the repository and reference the following paper:

```bibtex
@article{goering2026instareal,
  author       = {Göring, Steve and Menz, William and Rao, Rakesh},
  date         = {2026},
  title        = {Analysis of appeal, quality, and realism for Instagram-like filtered real photos},
  booktitle    = {18h International Conference on Quality of Multimedia Experience (QoMEX)}
}
```

If you like the software that I develop and contribute, you can [donate me a :coffee:](https://ko-fi.com/binarys3v3n).
 
Because :coffee: is a fundamental source for energy and motivation :smile:.


## license

[MIT License](LICENSE)
