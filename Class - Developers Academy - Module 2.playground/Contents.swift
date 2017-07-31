//: Playground - noun: a place where people can play

import UIKit

// Social Network App

class User {
    // Implementation of the class
    var username: String
    var fullName: String
    var email: String
    var posts: [Post] = []
    
    /* 1. Blueprint
       2. Group data together
       3. Stored properties
     */
    
    init(username: String, fullName: String, email: String) {
        self.username = username
        self.fullName = fullName
        self.email = email
        
        self.posts = []
        
    }
    
    func post(new newPost: Post) {
        self.posts.append(newPost)
    }
    
    func signUpSuccessfully() -> Bool {
        print("Making a sign up request for user \(username)")
        print("...")
        print("Sign up successful!")
        return true
    }
    
    func loginSuccessful() -> Bool {
        print("Making request to login user with username \(username) and email: \(email)")
        print("...")
        print("Login successful!")
        
        return true
    }
    
}

class Post {
    var text: String
    var username: String
    var likers: [User] = []
    var comments: [Comment] = []
    
    init(text: String, byUserWithUsername: String) {
        self.text = text
        username = byUserWithUsername
        
    }
    
    func liked(by user: User) {
        self.likers.append(user)
    }
    
    func add(newComment: Comment) {
        self.comments.append(newComment)
    }
    
    func getAllLikers() -> String {
        var result = ""
        
        for liker in likers {
            if result == "" {
                result += liker.username
            } else {
                result += ", \(liker.username)"
            }
        }
        
        return result
    }
    
    func getAllComments() -> String {
        var result = ""
        
        for comment in comments {
            if result == "" {
                result += comment.text
            } else {
                result += ", \(comment.text)"
            }
        }
        
        return result
    }
    
    func getPoints() -> Int {
        var points = likers.count * 5
        
        for comment in comments {
            let text = comment.text.lowercased()
            if text.contains("dork") || text.contains("stupid") || text.contains("mean") {
                points -= 3
            } else {
                points += 10
            }
        }
        
        return points
    }
    
}

class Comment {
    var user: User
    var text: String
    
    init(user: User, text: String) {
        self.user = user
        self.text = text
    }
}

let currentUser = User(username: "SKE", fullName: "Sain-R Edwards Jr.", email: "yourmamaliveswithme@myhouse.com")

let anotherUser = User(username: "dtran", fullName: "Duc Tran", email: "support@ductran.co")

var firstPost = Post(text: "What's up world?!", byUserWithUsername: "SKE")


currentUser.signUpSuccessfully()
currentUser.loginSuccessful()

let newPost = Post(text: "This is just a test", byUserWithUsername: currentUser.username)

currentUser.post(new: newPost)

let anotherPost = Post(text: "This is very challenging!", byUserWithUsername: currentUser.username)

let newComment = Comment(user: currentUser, text: "No kidding!")
anotherPost.liked(by: currentUser)
let newComment2 = Comment(user: anotherUser, text: "You're going to code your a** off!")
anotherPost.comments.append(newComment2)

newPost.liked(by: currentUser)

newPost.add(newComment: newComment2)

newPost.getAllComments()

var user1 = User(username: "JAYZ", fullName: "Sean Corey Carter", email: "international_HOV@billionaireboyzclub.com")
var user2 = User(username: "JTimbs", fullName: "Justin Timberlake", email: "myjessicaisfinerthanyours@suitandtieish.com")
var user3 = User(username: "KWest", fullName: "Kanye West", email: "yeezyyeezy@justjumpedoverjumpman.com")

var latestPost = Post(text: "What's better than one billionaire? Two!", byUserWithUsername: user1.username)
latestPost.text = "We as high, we as high!"

print(latestPost.text)

latestPost.liked(by: user1)
latestPost.liked(by: user2)
latestPost.liked(by: user3)

let user1Comment = Comment(user: user1, text: "I'm in a skrr with ya...yeah right!")

let user2Comment = Comment(user: user2, text: "I can't wait to get you on the floor good lookin'!")

let user3Comment = Comment(user: user3, text: "Shawty got a stupid a**!")

latestPost.add(newComment: user1Comment)
latestPost.add(newComment: user2Comment)
latestPost.add(newComment: user3Comment)

latestPost.getPoints()


