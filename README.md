Model: LLaMA 3 - 8B was the model used for this project
Dataset: The dataset used was neelblabla/enron_labeled_emails_with_subjects-llama2-7b_finetuning
 -  This dataset contains many prompts, each of with has instructions for classifying emails
 -  The dataset also includes the subject and body of the emails, along with a label for which classification that email should have

get_data.py: simple script to download dataset
get_model.py: simple script to download model
- note that my access token has been removed
- the access token needed to have Write permissions to allow downloading
train_model.py: mostly taken from example with model and dataset names changed
train_model.sh: mostly taken from example with paths changed
- timeout set to 12 hours to allow full training, although for this dataset this much time was not needed
- a previous test with another unlabeled dataset took about 10 hours
test_email.txt: a prompt I created matching the input template to be used for classification
baseline_response.txt: the response from the original (not-fine-tuned) version of LLaMA when given test_email
- note that this just echoed the input email
trained_response.txt: the response from the fine-tuned verison of LLaMA when given test_email
- this tries to classify the email, although it incorrectly applies multiple tags

The fine-tuning appears to have had a positive impact in allowing the model to perform the given task of classifying emails, although the result was not perfect.
