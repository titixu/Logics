import Foundation

// Merge Sort
extension Array where Element: Comparable {
    // the left and right array must be sorted
    private func merge(_ right: [Element]) -> [Element] {
        var result = [Element]()
        var left = self
        var right = right

        while left.count > 0 && right.count > 0 {
            if left.first! < right.first! {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }

        return result + left + right
    }

    // return new array sorted
    func mergeSort() -> [Element] {
        guard self.count > 1 else { return self }

        let left = Array(self[0..<self.count/2])
        let right = Array(self[(self.count/2)..<self.count])

        return left.mergeSort().merge(right.mergeSort())
    }
}

// Palindrome string
extension String {
    func isPalindrome(caseSensitive: Bool = false) -> Bool {
        guard self.count > 1 else { return true }
        var string = caseSensitive ? self : self.lowercased()
        if (string.removeFirst() == string.removeLast()) {
            return string.isPalindrome(caseSensitive: caseSensitive)
        }
        return false
    }
}

// find most common
extension Array where Element == String {

    func mostCommon(caseSensitive: Bool = false) -> ([String], Int) {
        var dictionary: [String: Int] = [:]
        var result: [String] = []
        forEach {
            let key = caseSensitive ? $0 : $0.lowercased()
            guard let value = dictionary[key] else {
                dictionary[key] = 1
                return
            }
            dictionary[$0] = value + 1
        }

        let mostCommon = dictionary.values.max() ?? 0

        dictionary.forEach { (key, value) in
            if value == mostCommon {
                result.append(key)
            }
        }

        return (result, mostCommon)
    }
}


// Binary search
extension Array where Element: Comparable {
    func binarySearch(key: Element) -> Bool {
        guard self.count > 0 else { return false }

        let minIndex = 0
        let maxIndex = self.count - 1
        let midIndex = maxIndex / 2
        let midValue = self[midIndex]

        // key is not in arry
        if key < self[minIndex] || key > self[maxIndex] {
            return false
        }

        if key == midValue {
            return true
        }

        if key < midValue {
            let slice = Array(self[minIndex..<midIndex])
            return slice.binarySearch(key: key)
        }

        if key > midValue {
            let slice = Array(self[(midIndex + 1)...maxIndex])
            return slice.binarySearch(key: key)
        }

        return false
    }
}

// two sum proble with two end pointers
extension Array where Element == Int {

    //move pointer from either end -linear
    func linearSearchTwoSum(sum: Int) -> Bool {
        guard self.count > 1 else { return false }


        var low = 0
        var high = self.count - 1

        while low < high {
            let sumOfTwoEnd = self[low] + self[high]

            if sumOfTwoEnd == sum {
                print("\( self[low]) \(self[high])")
                return true
            }

            if sumOfTwoEnd < sum {
                low += 1
            }

            if sumOfTwoEnd > sum {
                high -= 1
            }
        }

        return false

    }

}

// Selection Sort
extension Array where Element: Comparable {
    func selectionSort() -> [Element] {

        var startIndex = 0
        var array = self

        while startIndex < (array.count - 1) {
            var lowest = startIndex
            for index in (startIndex + 1)..<array.count {
                if array[index] < array[lowest] {
                    lowest = index
                }
            }
            if lowest != startIndex {
                array.swapAt(lowest, startIndex)
            }
            startIndex += 1
        }

        return array
    }
}

// get the fibonacci array that end till a number
extension Int {
    func fibonacciArray() -> [Int] {
        var result: [Int] = [0]
        // start with 0
        if self < 0 { return [] }

        while result.last! < self {
            // if the result has only one element
            if result.count == 1 {
                result.append(1)
            } else {
                result.append(result[result.count - 2] + result.last!)
            }
        }

        result.removeLast()
        return result
    }
}




