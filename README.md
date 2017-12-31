# Pre-work - *Name of App Here*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Benjamin Weis**

Time spent: **6** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [ ] UI animations
* [X ] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/OEFr5xO.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

When building the app I had issues with putting far too much logic into my view
controllers.  I then found by abstracting the Model away from the
ViewControllers I was able to write far better code.

I also tried to emulate some of the graphics from the 'good example'
submissions however had a lot of trouble even working with autolayout.  Instead
I spent most of my time working on the functionality rather than the UI which
I hope to learn in the coming weeks of class.

Sources Used:
https://forums.developer.apple.com/thread/62336
https://stackoverflow.com/questions/37953317/singleton-with-properties-in-swift-3
https://dhoerl.wordpress.com/2015/04/09/swift-goodies-using-enums-for-viewsegment-identification/
https://stackoverflow.com/questions/33942483/swift-extension-example

## License

    Copyright [2017] [Benjamin Weis]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
