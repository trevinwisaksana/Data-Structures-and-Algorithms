//: Tweet Generator Course – Remastered with Swift
import UIKit

/*
README:
– Drag your corpus to the Resources folder in Playgrounds
– Create a constant or a variable which is an instance of the retrieveCorpus(file:,type:) method in order to retreive the corupus
– Call the histogram methods which are:
    – dictionaryHistogram(sourceText:)
    – listHistogram(sourceText:)
– Enter the text as an argument for these methods
*/


// Accessing the corpus
let corpus = retrieveCorpus(name: "Fish", type: "txt")
// Generating the dictionary histogram
dictionaryHistogram(sourceText: corpus)



