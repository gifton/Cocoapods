# Cocoapods
Coding Challenge IDG


### Important info
Some of the issues that presented themselves during our interview on tuesday persisted throughout my sesison, I deemed it more important to articulate my knowledge in implementation and manipulation of the Swift language as apposed to spending time bug fixing. Due to the unforseen time sensitive nature of this work, I wanted to use the time I had as efficiantly as possible.
### UI
A simple UI has been written in Swift to include a ViewController, with a child collectionView whos layout is generated with UICollectionViewCompositionalLayout, and whos datasource derives from a TracksViewModel. A CollectionReusableView is used to build the header that includes a searchBar, and recieves its optional delegate from the ViewController to alert the viewmodel of a new query. While the UI is funcitonal, actual parsing and storage of endpoint data is not achieved, or properly reflected within the tableview. 
### Networking
The majority of my time was spent building a small but functional Networking layer for this application to talk to the viewmodels and models. Abstracting out each section to include Request generation, ApiLoader/Handler, Session Manager, Request Handler, Response Handler, and JSON manipulation. 
### Testing 
following in the direction we took in our interview, I have included tests for each of the networking sections.  Due to the time constraint code coverage is not as high as we would like. 
### Model
Minimal time was spent dedicated to producing a model that accurately reflected the endpoint return objects from the proveded URL. Thus any attempt to return objects recieved from the URL will fail, a local JSON file was created with contents that can be decoded into the correct classes for eas of use. 

Thank you, 
## Gifton
