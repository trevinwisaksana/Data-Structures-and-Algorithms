import Foundation

// A histogram that uses dictionaries
public func dictionaryHistogram(sourceText: String) -> [String : Int]  {
    // Entire text that's splitted into key value pairs
    let entireSplittedText = sourceText.components(separatedBy: " ")
    // Word dictionary
    var wordDictionary = [String : Int]()
    // Loops through each word in the entire text
    for word in entireSplittedText {
        // keyValue is the frequency value
        var keyValue = 0
        // Going to every word and makes the Value 1 because it's the first word there.
        if wordDictionary.keys.contains(word) {
            // Making all words lowercased
            keyValue = wordDictionary[word]! + 1
            wordDictionary.updateValue(keyValue, forKey: word)
        } else {
            wordDictionary[word] = 1
        }
    }
    
    return wordDictionary
}
