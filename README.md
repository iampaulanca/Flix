# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

---

## Flix Part 1

### User Stories
`TODO://` In the **User Stories section below**, add an `x` in the `-[ ]` like this `- [x]` for any user story you complete. (🚫 Remove this paragraph after after checking off completed user stories)

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthough GIF
`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="http://g.recordit.co/0noFo1mCq9.gif" width=250>&nbsp;&nbsp;<img src="http://g.recordit.co/t75cQ7jqca.gif" width=500><br>

### Notes
Describe any challenges encountered while building the app.

A challenge I encountered while building this app was creating the launch screen. I decided to not use main.storyboard and deleted it along with launchscreen. I needed to create a new LaunchScreen.storyboard but by default it is names "Launch Screen" with the space. In info.plist there is a key "Launch screen interface file base name" that holds a value of "LaunchScreen" that needed to be changed to "Launch Screen".

Another challenge was using AutoLayout programmatically.
