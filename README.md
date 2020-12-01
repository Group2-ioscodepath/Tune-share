Original App Design Project - README Template
===

# Tune Share

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Tune Share is an app that allows musicians to post audio and video clips of themselves playing songs, covers, original content, etc. on a social media platform made exclusively for musicians. Users would then be able to scroll through their feed and view other users' posts.


### App Evaluation

- **Category:** Social Media 
- **Mobile:** Mobile First Experience
- **Story:** Anyone who wants to share Music with others or follow inde music creators
- **Market:** Mass Market People who use and want to create Music.
- **Habit:** Go to place to consume music content
- **Scope:** To create and Consume Original music content made by Inde creators 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] Login 
* [x] Create account
* Follow other peoples content
* Like Content
* Display Contnet/Stream/Feed
* notification

**Optional Nice-to-have Stories**

* Custom feeds
* Stories
* [x] Login with Google
* Login with Twitter
* Search users

### 2. Screen Archetypes

* Login View Controller
   * Enter Username
   * Enter Password
   * Login in with Google
   * Create an account
* Homepage View Controller
   * Discover tab
   * Profile tab
   * Stories
   * Open profile
   * Add comment
* Search View Controller
   * Search tab
   * discover area
 * Camera View Controller
   * add recorded video
   * add description
* Notification View Controller
   * Notification area
* Profile View Controller
   * Profile photo
   * Current feed
 
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Feed
* Search
* Add Music Video/Audio (Post)
* Activity
* Profile


**Flow Navigation** (Screen to Screen)

* Login
   * Account creation
   * Get to feed
* Feed
   * Scroll to view the feed
* Search
   * Search for other users 
* Post Screen
   * Post music clips
* Activity
   * See activity of people you follow
* Profile
   * View and edit details about user's profile

## Wireframes
<img src="https://i.ibb.co/s2HK0bC/Screen-Shot-2020-11-16-at-10-13-59-PM.png" width=600>

[Figma Link](https://www.figma.com/file/NOPpIEYjaM9o9FbhhTLxO4/Tune-Share?node-id=0%3A1)

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="450" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2FNOPpIEYjaM9o9FbhhTLxO4%2FTune-Share%3Fnode-id%3D0%253A1" allowfullscreen></iframe>

### [BONUS] Digital Wireframes & Mockups [X]

<a href="https://ibb.co/qsznsPf"><img src="https://i.ibb.co/hWkMWtj/Screen-Shot-2020-11-16-at-10-51-33-PM.png" alt="Screen-Shot-2020-11-16-at-10-51-33-PM" border="0"></a>

### [BONUS] Interactive Prototype [X]
<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="450" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Fproto%2FNOPpIEYjaM9o9FbhhTLxO4%2FTune-Share%3Fnode-id%3D1%253A2%26scaling%3Dscale-down" allowfullscreen></iframe>

<br>
====

---------
# Unit 9
---------


## Schema 

### Model: Post
| Property | Type     | Description |
| -------- | -------- | -------- |
| Objectid    | String     | unique id of the post   |
| author        | Pointer to User | image author |
| authorName    | String | author name |
| profilePic    | File | author's profile picture |
| image         | File     | image that user posts |
| caption       | String   | image caption by author |
| createdAt     | DateTime | date when post is created (default field) |

### Model: Comments
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| userName     | String   | user unique id of comment |
| name | String   | name of user |
| author        | Pointer to User | comment author |
| authorName    | String | author name |
| profilePic    | File | author's profile picture |
| comment       | String   | comment by the user |
| commentedAt     | DateTime | time when comment is commented (default field) |

### Model: Account
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| userName | String   | Unique id for the user post (default field) |
| password | String | Password of user’s account |
| userID  | Pointer to User | Unique id of User |
| profileImage  | File     | User’s profile image |



### Networking

- Login View Controller
    - (Read/GET) Query logged in user object
     ```swift
      @IBAction func onSignin(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
            else{
                print("Error: \(error?.localizedDescription) ")
            }
        }
       
        
        
    }

     ```
    - (Create/POST) Create a new user
     ```swift
    @IBAction func onSignup(_ sender: Any) {
        
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { (sucess, error) in
            if sucess{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        }
            else{
                print("Error: \(error?.localizedDescription) ")
            }
            
        }
    }
     
     ```
- Homepage View Controller
    - (Read/GET) List of posts
    - (Create/POST) Create a new like on a post
    - (Read/GET) List of comments
    - (Create/POST) Create a new comment on a post
    - (Read/GET) List of stories

- Search View Controller
    - (Read/GET) List of users
    - (Update/PUT) Update the list of users when search
    - (Create/POST) search for users
- Camera View Controller
    - No Parse interaction for this page
- Notification View Controller
    - (Create/POST) creates a post
- Profile View Controller
    - (Read/GET) User Details
    - (Read/GET) Shows User Posts 
