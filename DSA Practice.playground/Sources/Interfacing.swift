import Foundation

// Method to retrieve the corpus and return the text as a String format
public func retrieveCorpus(name: String, type: String) -> String {
    // Get the file path for the file "Fish.txt" in the Playground bundle
    if let filePath = Bundle.main.path(forResource: name, ofType: type) {
        // Get the contentData
        let contentData = FileManager.default.contents(atPath: filePath)
        // Get the string
        let content = NSString(data: contentData!, encoding: String.Encoding.utf8.rawValue) as? String
        // Removing \n from the last word
        let trimmed = content?.replacingOccurrences(of: "\n", with: "", options: .regularExpression)
        // Returns the string
        return trimmed!
    }
    
    // If it fails to read, show fatal error message
    fatalError("File cannot be read")
}
