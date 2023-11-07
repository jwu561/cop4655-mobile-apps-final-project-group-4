Original App Design Project - README Template
===

# GeoGenius
Group 4: 

Justin Rivera
Kevin Infante
Kazrious Harper
Jonathan Wu 

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

This app will be a GeoGuesser game app, which is supposed to be a fun game while also being educational in that it tests your world geography knowledge in asking you to guess where it is in the world that an image is from.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:**
Entertainment and education. Its game-like structure can engage users, making it not just something to pass the time, but also an educational tool. The interactive format provides a unique opportunity for users to improve their geographical knowledge.
- **Mobile:**
Gameplay that involves using streetview map.
    
- **Story:**
It challenges players to test their knowledge of world geography in a fun and interactive way. It provides an opportunity for users to enhance their geography knowledge by exposing them to different locations around the world. Can attract a global audience interested in exploring the world's diverse cultures and landscapes.
    
    Friends would think this would be an interactive game.
- **Market:**
This application will be delivered on the appstore as a free game. The uniqueness of the game would make it appealing in a marketplace filled with other free games. Its appealing user experience and educational value will give it an edge.
- **Habit:**
With a global scoreboard that were to be implemented, players would be
addicted in playing frequently. If players find it fun, they would be on it
everyday. users would comsume this app.
- **Scope:**
This will be a challenge as we will be creating this by scratch. This product is defined since the main core the app is to engage players testing their world geography.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User must have multiple answers to choose from
* User must be able to get hints.
* User must have some sort of media to use to guess what the correct location.

**Optional Nice-to-have Stories**

* [User can create an account]
* [User can login to an account]
* [User can logout of an account]
* [User has a record of wins/losses]
* [User has a record of wrong guesses]
* [User can continue as a guest without logging in. Progress will not be saved]

### 2. Screen Archetypes

- [Login Screen]
* User can login
* User can continue as guest
- [Registration Screen]
* User can create a new account
- [Select Game Mode Screen]
* User chooses how to start the game
* Select from various modes
- [Game Screen]
* User plays the game on this screen
* Street view of location in the world
* Multiple choices to select from
* optional hints
* game score
- [Stats Screen]
* User sees stats such as wins/losses/wrong guesses, etc.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Start Screen]
* [Login/Logout] (Depending on which screen you are on, it will be login or logout)
* [Stats Screen] (Only works once logged in)
*  [User Profile Screen] (shows tab to login and stats screen)


**Flow Navigation** (Screen to Screen)

- [Start Screen]
* => Game Mode Screen
* => Login Screen
- [Registration Screen]
* => Login Screen
- [Login Screen]
* => Game Mode Screen
* => Registration Screen
- [Game Mode Screen]
- => Game Screen
- [Game Screen]
* => Login Screen
* => Start Screen
* => Stats Screen
- [Stats Screen]
* => Start Screen
* => Login Screen



## Wireframes
![](https://hackmd.io/_uploads/BJvZgCSMp.png)
![](https://hackmd.io/_uploads/Hykfg0rGp.png)



### [BONUS] Digital Wireframes & Mockups
### Current Gif
![Beginning Product](https://github.com/COP4655-MobileApps-Fall2023/cop4655-mobile-apps-final-project-group-4/assets/124208345/6e338ed3-60c4-4da2-8eed-d822ff1943d1)



## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
