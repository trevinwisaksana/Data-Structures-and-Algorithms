
// MARK: - Node
// Node struct contains a data, next and a previous property
public struct DoublyLinkedListNode<T> {
    var data: T
    var next: DoublyLinkedListNode?
    var previous: DoublyLinkedListNode?
    
    public init(data: T) {
        self.data = data
    }
}

// MARK: - Doubly Linked List
// LinkedList struct
public struct DoublyLinkedList<T> {
    
    // Remove the need to cast every Node call as <Any>
    public typealias Node = DoublyLinkedListNode<T>
    
    // MARK: - LinkedList Properties
    // Head is the first item in the LinkedList
    fileprivate var head: Node?
    // Tail is the last item in the LinkedList
    fileprivate var tail: Node?
    // Size contains the number of Nodes within the LinkedList
    // Speed O(1)
    public var size: Int = 0
    
    public init() {
        // Does not initialize anything because almost all values are optionals
    }
    
    // Variable to check if the head is empty
    public var isEmpty: Bool {
        return head == nil
    }
    
    // MARK: - Linked List Methods
    // Method to return the LinkedList as a list
    public func returnAsList() -> [Node] {
        // Stores the results
        var result: [Node] = []
        // Current position in LinkedList
        // Ends the function early if it's empty
        guard var current = self.head else {
            fatalError("Value of head is nil")
        }
        
        // Appends the data to the result
        result.append(current.data as! Node)
        // Current will become the next node
        current = current.next as! Node
        
        return result
    }
    

    // Method to append any object into the LinkedList
    public mutating func append(item: T) {
        // Creating a new node which contains the new item
        let newNode = Node(data: item)
        // Checks if the LinkedList is empty by checking if the head is nil
        if head == nil {
            // Assigns the newNode as the head
            head = newNode
        }
        
        // Checks if a tail exists
        if tail == nil {
            // If it doesn't the head and tail contains the same value
            tail = newNode
        }
        
        // Extends the tail by assigning the next value as the newNode
        tail?.next = newNode as AnyObject?
        // Increments the size by 1
        size += 1
    }
    
    
    // Method to append any object into the LinkedList
    // Appends it to the end of the list
    // Speed of O(1)
    public func append(_ value: T) {
        // Creating a new node which contains the new item
        let newNode = Node(data: value)
        if let lastNode = tail {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    
    
    // Appends an item at the front of the Linked List
    // Speed of O(1)
    public mutating func prepend(item: T) {
        // Temporary variable to be used so that the linked list can be connected
        var temporaryVariable: Node?
        // The item is encapsulated within the node
        let newNode = Node(data: item)
        // Checks if the LinkedList is empty
        if head? = isEmpty {
            // Assigning both head and tail as the newNode
            head = newNode
            tail = newNode
            return
        }
        
        // Assigning the temporary variable to store the head and head.next
        /* Explanation: 
           We store whatever data is in the head and whatever it's pointing at
           in the temporaryVariable. This way, we can change the head's data 
           and connect its pointer to the temporaryVariable without having it
           to lose connection with the rest of the nodes.
        */
        temporaryVariable = head
        temporaryVariable?.next = head?.next
        // Switching the head as the new node
        head = newNode
        head?.next = temporaryVariable
    }
    
    
    // Delete method
    public mutating func delete(item: AnyObject) {
        // Storing the value of the head inside a new variable
        var current = head
        // Previous gets access to the node before the current node
        var previous: Node? = nil
        
        // While loop to search through the entire Linked List
        while current != nil {
            // If the head is the item
            if current?.data == item as! _OptionalNilComparisonType {
                // If the previous is nil, this is the head of the Linked List
                if previous == nil {
                    // Assigning the previous.next to the current.next so that the entire list doesn't lose connection
                    // It deletes the head by pointing the pointer to nothing which will automatically go to garbage collection
                    previous?.next = current?.next
                    return
                }
                // Comparing if the head is equal to the current
                if head == current {
                    // Changes the head.next to nil by making it equal to current.next
                    head?.next = current?.next
                    return
                }
                // If the tail is the item that should be deleted, tail should be assigning as the previous
                if tail == current {
                    tail = previous
                    return
                }
                
            }
            
            previous = current
            current = current?.next as! Node?
            
        }
        
        // Decrements the size of the Linked List
        size -= 1
    
        return
    }
    
    // Method to locate a node at index
    public func node(atIndex index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    // Method to locate the index of the node
    
    
    // Method to remove the node at a certain index
    public func remove(atIndex index: Int) -> T {
        let node = self.node(atIndex: index)
        assert(node != nil)
        return remove(node: node!)
    }
    
    
    // Find method
    public func find(item: AnyObject) -> AnyObject {
        for value in returnAsList() {
            if value.data.contains(item) {
                return value as AnyObject
            }
        }
        return "\(item) not found" as AnyObject
    }
}
