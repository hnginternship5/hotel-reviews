import pandas as pd
import os

base_dir = os.path.abspath(os.path.dirname(__file__))
training_data_dir = os.path.join(base_dir, "training_data")

df = pd.read_csv(os.path.join(training_data_dir, 'Hotel_Reviews.csv'))
df = pd.concat([df['Negative_Review'], df['Positive_Review']], ignore_index=True)
df = df.loc[~df.isin(['No Negative', 'No Positive'])]
df = df.loc[df.str.len() > 20]
df = df.drop_duplicates()

df.to_csv(os.path.join(training_data_dir, "Hotel_Reviews_Training.csv"))