# Review Generation for Hotels

This project is carried out for the purpose of building upon a machine learning model for generating of review for hotels.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Project Structure

```
.
├── datasets
│   ├── test_set
│   │   ├── hotels
│   │   └── not-hotels
│   │            
│   │             
│   └── training_set
├       ├── hotels
├       └── not-hotels
├── src
│   ├── hotels
│   ├── hotels
│   ├── hotels
│   ├── hotels
│   └── default_model.h5
│   
│   
├── encode.py
├── LICENSE
├── requirements.txt
├── train.py
└── README.md
```
### Prerequisites

Python distribution

```
Anaconda
```

### Installing

Install Anaconda python distribution on your system

Create a virtual environment called env.

```
python -m venv env
```

Activate the virtual environment

```
LINUX/Mac: source env/bin/activate

Windows: env\Scripts\activate
```

Upgrade to the latest pip

```
pip3 install --upgrade pip3
```

Install tensorflow 1.12 (with GPU support, if you have a GPU and want everything to run faster)
```
pip3 install tensorflow==1.12.0
```
or
```
pip3 install tensorflow-gpu==1.12.0
```

Install other python packages/dependencies using the requirement file:
```
pip3 install -r requirements.txt
```

Install dependencies using requirements file

```
pip3 install -r requirements.txt
``` 

**Note: Your virtual environment must always be activated before running any of the command**

The above steps can optionally be done in a virtual environment using tools such as `virtualenv`.

### Native Installation

Download the model data
```
sh download_model.sh 117M
```
`117M` is just a default name for the model

The remaining steps can optionally be done in a virtual environment using tools such as `virtualenv` or `conda`.

## Usage

Some of the examples below may include Unicode text characters. Set the environment variable:
```
export PYTHONIOENCODING=UTF-8
```
to override the standard stream settings in UTF-8 mode.

### Unconditional review generation

To generate unconditional samples from the small model:
```
python3 src/generate_unconditional_samples.py
```
There are various flags for controlling the samples:
```
python3 src/generate_unconditional_samples.py --top_k 40 --temperature 0.7
```

To check flag descriptions, use:
```
python3 src/generate_unconditional_samples.py -- --help
```

### Conditional Review generation

To give the model custom prompts, you can use:
```
python3 src/interactive_conditional_samples.py --top_k 40
```

To check flag descriptions, use:
```
python3 src/interactive_conditional_samples.py -- --help
```

### Fine tuning on custom datasets

To retrain this model on a custom text dataset:

```
PYTHONPATH=src ./train --dataset <file|directory|glob>
```

If you want to precompute the dataset's encoding for multiple runs, you can instead use:

```
PYTHONPATH=src ./encode.py <file|directory|glob> /path/to/encoded.npz
PYTHONPATH=src ./train --dataset /path/to/encoded.npz
```

### APIs

This are command options in full:

```
A command line utility for image classification.
-----------------------------------------------
These are common commands for this app.

positional arguments:
  app_action            This can either be predict, train, retrieve_models or
                        delete

optional arguments:
  -h, --help            show this help message and exit
  -path PATH, --path PATH
                        A path to a folder or image e.g foo or foobar.jpg
  -grpA GRPA, --grpA GRPA
                        A group A folder path e.g hotels
  -grpB GRPB, --grpB GRPB
                        A group B folder path e.g not-hotels
  -model MODEL, --model MODEL
                        Selects a model to be used
  -gen_name GEN_NAME, --gen_name GEN_NAME
                        A boolean to generate model name e.g yes or no
```
Below is specifics

**Retrieve Models:**

```
python app.py retrieve_models
```

**Delete Model:**

```
python app.py delete -model modelname
``` 

or:

```
python app.py delete --model modelname
```

**Train Model with custom dataset and model:**

```
python app.py train --grpA path/to/groupA --grpB path/to/groupB --model cat_dogmodel
```

or:

```
python app.py train -grpA path/to/groupA -grpB path/to/groupB -model cat_dogmodel
```

**Train with default dataset and model:**

If the default model already exists, delete it before proceeding

```
python app.py train
```

**Classification with default model:**

with image file:

```
python app.py predict --path /path/to/image.png
```

with folder:

```
python app.py predict --path /path/to/folder
```

or:

with image file:

```
python app.py predict -path /path/to/image.png
```

with folder:

```
python app.py predict -path /path/to/folder
```


**Classification with custom model:**

```
python app.py predict --path /Users/src/assets/images/bg.png --model modelname
```

or:

```
python app.py predict -path /Users/src/assets/images/bg.png -model modelname
```

## Built With

* [Anaconda](https://www.anaconda.com/distribution/) - The python distribution used
* [VS Code](https://code.visualstudio.com/) - The IDE used

## Future work

We are still trying to improve on this model for better generated reviews.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details

## Acknowledgments
* Hat tip to anyone whose code was used
* Inspiration
* etc
