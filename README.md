# BetterUp iOS Engineer Interview Project

Thanks again for your interest in the position!  We are excited to dive into the fun part of the interview process!

Our goal is to focus conversations on real code instead of whiteboard logic puzzles.


## Your mission... if you choose to accept it...

Build a "News Feed" application for iPhone using Swift.

### Example mockups

NOTE: This mockup is intended as a starting point. Feel free to dazzle us with your creativity!

<img src="https://github.com/betterup/betterup-interview-ios/raw/master/doc/mock1.png?raw=true" height="480" />

## Core features (Focus on what matters)

- **Delightful** interactions with emphasis on transitions or animations where possible
- **Intuitive** user experience and interaction design consistent with modern iOS platform patterns
- **Maintainable** code, consistent architectural patterns, and organized view layout

## Anti-Features

- **Persistence to disk is not required.** Assume all data will reset between app launches.
- **No interaction with a web API.** RESTful networking fundamentals are critical for this role but are not part of this project.
- **Sticking to core iOS frameworks is not required.** Feel free to use any third-party libraries but be prepared to provide justification.

## Functional Requirements

This repository contains a skeleton Xcode project including:

- An `articles.json` file with serialized article data to be displayed in the app
    - _Please use this data file as the source of articles data for the project_
- A bare-bones `Article` model struct with all the properties represented in the JSON objects

_As a user, I want to_...

- **View a list** of the provided news articles
- **View only my favorite** news articles
- **Open the contents** of an article on the web
- **Mark my favorite articles** so I can save them for quick access later

⚠️ The only firm implementation-level requirement is that **you may not use interface builder to create the UI**. All view creation and layout must be done in code. ⚠️

## Evaluation Criteria

Our values infuse and guide the work we do, and also provide a lens for evaluating this project.
Some of the questions used when reviewing submissions include:

- Is the codebase clear, concise, and understandable? #craftsmanship
- Does the codebase follow industry and framework best practices? #craftsmanship
- Is the Information Architecture intuitive? #craftsmanship
- Does the project feel alive and have a unique personality? #zest
- Is the User Interface delightful? #playfulness
- Is the User eXperience fluid? #playfulness
- Are there automated tests? #craftsmanship

## Deliverables and Submission

- Submit a pull request against this repository and be sure to include:
  * Any additional steps to build and run the project in Xcode, if necessary
  * What tradeoffs/choices did you make?
  * What went well?
  * What could be improved in the project?
- Copy a link to the Pull Request and submit it via the Greenhouse project submission link you received via email from our team


##Pranoti Kulkarni

##Thank you for this amazing challenge. Please run this project on iOS 13 simulator also to see the launch board i have added.
##Key points:
1) I have created custom tableview cell (programmatically) to show the contents of the News article.
2) Once the user taps on this cell, he will be taken to an embedded webPage (WKWebView) to display the entire article which is related to the news.
3) For some addons i have implemented animation when the user taps on the star icon, so its marked as their favorite feed.
4) Added target for UIAutomation tests which wasn't part of this project, since i love writing UI tests :)
5) Have tried to follow proper naming conventions for file names and even properties.
6) Have used MVC architecture pattern. 
7) Have done code cleanup at the end to remove any unwanted warnings as well.

