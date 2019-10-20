# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [ ] (5pts) User can tap a cell to see more details about a particular movie.
- [ ] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF
`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

### Notes
Describe any challenges encountered while building the app.

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthough GIF
<img src="http://g.recordit.co/0noFo1mCq9.gif" width=250>&nbsp;&nbsp;
<img src="http://g.recordit.co/9apNwXnfv3.gif" width=250>&nbsp;&nbsp;
<img src="http://g.recordit.co/t75cQ7jqca.gif" width=500>
<br>

### Notes
Describe any challenges encountered while building the app.

A challenge I encountered while building this app was creating the launch screen. I decided to not use main.storyboard and deleted it along with launchscreen. I needed to create a new LaunchScreen.storyboard but by default it is named "Launch Screen" with the space. In info.plist there is a key "Launch screen interface file base name" that holds a value of "LaunchScreen" that needed to be changed to "Launch Screen".

Another challenge was using AutoLayout programmatically.
