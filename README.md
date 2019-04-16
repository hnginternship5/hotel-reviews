# Review Generation for Hotels

This project is carried out for the purpose of building upon a machine learning model for generating of review for hotels.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Project Structure

```
.
├── src
│   ├── encoder.py
│   ├── generate_review.py
│   ├── interactive_generate_review.py
│   ├── sample.py
│   └── model.py
│   
│   
├── encode.py
├── dataset_processor.py
├── download_gdrive.py
├── download_model.sh
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

Install other python packages/dependencies using the requirement file:
```
pip3 install -r requirements.txt
```

**Note: Your virtual environment must always be activated before running any of the command**

The above steps can also be done in a virtual environment using tools such as `virtualenv`.

### Native Installation

Install tensorflow 1.12 (with GPU support, if you have a GPU and want everything to run faster)
```
pip3 install tensorflow==1.12.0
```
or
```
pip3 install tensorflow-gpu==1.12.0
```

Download the model data
```
sh download_model.sh 117M
```
`117M` is just a default name for the model

## Usage

Some of the examples below may include Unicode text characters. Set the environment variable:
```
export PYTHONIOENCODING=UTF-8
```
to override the standard stream settings in UTF-8 mode.

### APIs

These are some command options in full:

```
A command line utility for hotel review generation.
---------------------------------------------------
These are common commands for this app.

optional arguments:
  --help            this show help message and exit
  --stop_after      you specify when to stop. This is only useful when training
  --learning_rate   you specify your learning rate. There is a default of 0.001. Though this model was trained with 0.0001
  --model_name      string, which model to use. Though there is a default of `117M`
  --seed            seed for random number generators, fix seed to reproduce results. Default=None
  --nsamples        Number of samples to return, if 0, continues to generate samples indefinately. Default = 1
  --batch_size      Number of batches (only affects speed/memory). Default = 1
  --length          Number of tokens in generated text, if None (default), is determined by model hyperparameters.
  --temperature     Float value controlling randomness in boltzmann distribution. Lower temperature results in less random completions. As the temperature approaches zero, the model will become deterministic and repetitive. Higher temperature results in more random completions. Default = 1
  --top_k           Integer value controlling diversity. 1 means only 1 word is considered for each step (token), resulting in deterministic completions, while 40 means 40 words are considered at each step. 0 (default) is a special setting meaning no restrictions. 40 generally is a good value.
```

Some of the above optional arguments are useful only when training while others are use when generating reviews.


### Review generation

To generate samples of review from the small model:
```
python3 src/generate_review.py
```
There are various flags for controlling the samples:
```
python3 src/generate_review.py --top_k 40 --temperature 0.7
```

To check flag descriptions, use:
```
python3 src/generate_review.py -- --help
```

### Interactive Review generation

To give the model custom prompts, you can use:
```
python3 src/interactive_generate_review.py --top_k 40
```

To check flag descriptions, use:
```
python3 src/interactive_generate_review.py -- --help
```

**Train model with custom datasets**

To retrain this model on a custom text dataset:

```
PYTHONPATH=src ./train.py --dataset /path/to/encoded.npz --sample_every=250 --learning_rate=0.0001 --stop_after=251
```

If you want to precompute the dataset's encoding for multiple runs, you can instead use:

```
PYTHONPATH=src ./encode.py <file|directory|glob> /path/to/encoded.npz
PYTHONPATH=src ./train --dataset /path/to/encoded.npz
```

## How we trained our model
Our model was trained using the recent OpenAI released model called, GPT-2. The model was trained on a dataset gotten from kaggle containing over [515k-hotel-reviews](https://www.kaggle.com/jiashenliu/515k-hotel-reviews-data-in-europe). The training was done on Google Colab using GPU. The training started with a loss of around 7.9 and it continue to drop even though it do rises atime; when the training was completed we have our loss at around 3.91.

**Dataset**
 The dataset consists of columns positive and negative reviews each, so they were combined to form a single review. This pre-processing was done using the `dataset_processor.py` file, on the `Hotel_Reviews.csv` file gotten from unzipping the dataset.


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
