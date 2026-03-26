//
//  DesignMessageLogger.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

class Logger {

    private var messageContainer = [String: Int]()
    private let timeout = 10

    init() { }

    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let allowedTimestamp = messageContainer[message] {
            if timestamp >= allowedTimestamp {
                messageContainer[message] = timestamp + timeout
                return true
            }
        } else {
            messageContainer[message] = timestamp + timeout
            return true
        }
        return false
    }
}


//var logger = Logger()
//print(logger.shouldPrintMessage(1, "foo"))
//print(logger.shouldPrintMessage(2, "bar"))
//print(logger.shouldPrintMessage(3, "foo"))
//print(logger.shouldPrintMessage(8, "bar"))
//print(logger.shouldPrintMessage(10, "foo"))
//print(logger.shouldPrintMessage(11, "foo"))
