# Fitbod iOS Application

[![Swift Version][swift-image]][swift-url]

## Overview

This app shows a list of exercises. When you tap one an exercise, you can see your historical one rep maxes on a graph. The application uses the MVVM architecture.

## Requirements

- iOS 17.4+
- Xcode 15.0+
- Swift 5

## Assumptions
1. User doesn't need to rotate
2. There's at least 2 months of data therefore the graph has strides of 2 months 
3. workoutData.csv file is not empty 
4. Workouts are formatted like this "Oct 11 2020,Back Squat,6,245" in workoutData.csv file
5. Rounded one rep max values to nearest integer

## Installation

Download the repository and click run. Project defaults to loading data from [workoutData.csv] and if you want to change the source of workout data follow the **Loading Workout Data** section below

## Features
1. Takes in workout data from .csv file and processes them into a table which shows your all time One Rep Max
2. When you tap an exercise, you can see the history of your one rep maxes since your first workout

## Loading Workout Data
1. Add the .csv file into the **FitBod** folder and update the **workoutFileName** variable in the **Constants.swift** file if you want to change the name of the workouts file.

The workouts need to be in the following format:
{Date: MMM dd yyyy},{Exercise Name},{# of Reps},{Weight} 
Ex:"Oct 11 2020,Back Squat,6,245"

## Creator

Haasith Sanka
https://github.com/Hsanka6

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[workoutData.csv]:https://drive.google.com/file/d/1HomqPGU5CW6Wqk5ykM0goZLAiAgtTtl2

