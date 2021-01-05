# iOS Evaluation Project


![App](https://media2.giphy.com/media/kWConfQFa39qbZELIP/giphy.gif)

In this folder you will find a base project that you will have to complete and that will serve as evaluation of your knowledge and skills when developing iOS applications with Swift.

## Instructions

Make the following modifications to the project:

1. Parse the `data.json` file to a model. This model will later be used as the information to present in the _collection view_.
2. Programmatically build a cell with dynamic height that present each of the parsed objects in the previous section. For this, read and use the classes provided inside the `DynamicCollectionView.swift` file. The cell layout should be as accurate as possible to the inVision project (if the inVision project is not available take as reference the image in this folder). Also, use the "DayNumber" asset.
3. When the user selects a cell, present a `UIAlertController` containing:
    - The selected object titleas the `title` of the alert.
    - The selected object subtitle as the `message` of the alert.
    - An action button that says "OK" and when tapped close the alert.
4. Finally, create another target as a duplicate of the main one and that differs in the following:
    - Splash screen background. Use the "Gradient2" asset.
    - Background image of the navigation bar. Use the "Gradient2" asset.
    - Title of the navigation bar. Change the name from "Suggestic" to any other name. Examples: "Ángel Journey", or "Pikachu Journey", or "My first journey" etc.
    - Change the tint color of the image ("DayNumber") in the cells. It can be any color.


## Specifications

The only design to respect as close as possible is the cell layout, everything else not specified, you can freely decide how to do it.

In addition to all the visual design, details such as correct memory management and good code structure will also be taken into account. Also, if you see it necessary, feel free to change everything you think could be improved so that the project has a good architecture and could become maintainable in the future.
