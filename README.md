#README.md

This repo further contains:
##script called *run_analysis.R* which
* reads data originating form [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
* merges train and test datasets
* names the variables with column names given in "features.txt"
* changes Activity into a factor with level names given in "activity_labels.txt"
* selects only variables with names containing the string "std" or "mean"
* merges subject, train labels and selected data originaly contained in separate files into one dataset
* computes the mean of each measured value and creates new tidy dataset with subject, activity and the computed mean variables

##file called CodeBook.md
containing the description of the dataset
