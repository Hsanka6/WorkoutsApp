# Fitbod iOS Application

[![Swift Version][swift-image]][swift-url]

## Overview

This app shows a list of exercises. When you tap one an exercise, you can see your historical one rep maxes on a graph. The application uses the MVVM architecture.

## Requirements

- iOS 17.4+
- Xcode 15.0+
- Swift 5

## Assumptions
1. Didn't need to account for user rotating phone

## Installation

Download the repository and click run.

## Features
1. Takes in workout data from .csv file and processes them into a table which shows your all time One Rep Max
2. When you tap an exercise, you can see the history of your one rep maxes since your first workout

## Loading Workout Data
1. Add the .csv file into the **FitBod** folder and update the **workoutFileName** variable in the **Constants.swift** file.

The workouts need to be in the following format:
{Date: MMM dd yyyy},{Exercise Name},{# of Reps},{Weight} 
Ex:"Oct 11 2020,Back Squat,6,245"

## Creator

Haasith Sanka
https://github.com/Hsanka6

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/

