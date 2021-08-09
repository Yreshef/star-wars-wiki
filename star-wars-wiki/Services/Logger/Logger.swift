//
//  Logger.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 7/31/21.
//

import Foundation

// MARK: - Protocol Declaration
//=============================

protocol Logging {
    func info(_ message: @autoclosure () -> String,
              filename: String,
              line: Int,
              column: Int,
              function: String)
    func error(_ message: @autoclosure () -> String,
              filename: String,
              line: Int,
              column: Int,
              function: String)
    func debug(_ message: @autoclosure () -> String,
              filename: String,
              line: Int,
              column: Int,
              function: String)
    func verbose(_ message: @autoclosure () -> String,
              filename: String,
              line: Int,
              column: Int,
              function: String)
}

// MARK: - Protocol Extension
//=============================

extension Logging {
    func info(_ message: @autoclosure () -> String,
              filename: String = #file,
              line: Int = #line,
              column: Int = #column,
              function: String = #function){
        self.info(message(), filename: filename, line: line, column: column, function: function)
    }
    
    func error(_ message: @autoclosure () -> String,
              filename: String = #file,
              line: Int = #line,
              column: Int = #column,
              function: String = #function){
        self.error(message(), filename: filename, line: line, column: column, function: function)
    }
    
    func debug(_ message: @autoclosure () -> String,
              filename: String = #file,
              line: Int = #line,
              column: Int = #column,
              function: String = #function){
        self.debug(message(), filename: filename, line: line, column: column, function: function)    }
    
    func verbose(_ message: @autoclosure () -> String,
              filename: String = #file,
              line: Int = #line,
              column: Int = #column,
              function: String = #function){
        self.verbose(message(), filename: filename, line: line, column: column, function: function)    }
    
}

// MARK: - Enum Declaration
//=============================


enum LogLevel: String {
    case info, error, debug, verbose
    
    var name: String {
        return rawValue.capitalized
    }
    
    var icon: String {
        switch self {
        case .info:
            return "🧀"
        case .error:
            return "🐜"
        case .debug:
            return "🟥"
        case .verbose:
            return "🔎"
        }
    }
}

// MARK: - Class Declaration
//=============================

class Logger: Logging {
    
    // MARK: - LifeCycle
    //=============================

    init() {
    }
    
    // MARK: - Methods
    //=============================
    
    internal func info(_ message: @autoclosure () -> String, filename: String, line: Int, column: Int, function: String) {
        self.log(level: .info, message(), filename: filename, line: line, column: column, function: function)
    }
    
    internal func error(_ message: @autoclosure () -> String, filename: String, line: Int, column: Int, function: String) {
        self.log(level: .error, message(), filename: filename, line: line, column: column, function: function)
    }
    
    internal func debug(_ message: @autoclosure () -> String, filename: String, line: Int, column: Int, function: String) {
        self.log(level: .debug, message(), filename: filename, line: line, column: column, function: function)
    }
    
    internal func verbose(_ message: @autoclosure () -> String, filename: String, line: Int, column: Int, function: String) {
        self.log(level: .verbose, message(), filename: filename, line: line, column: column, function: function)
    }
    
    
    // MARK: - Helper Methods
    //=============================

    
    /// Format a readable version for a given log
    ///
    /// - Returns: Easy to read version of the log
    private func formatMessage(level: LogLevel,
                               message: String,
                               filename: String,
                               line: Int,
                               column: Int,
                               function: String) -> String{
        return "\(level.icon) \(level.name) | \(sourceFilename(from: filename)) | \(function) | \(line), \(column) : \(message)"
    }
    
    
    /// Extract filename from the file path
    ///
    /// - Parameter from: full file path in bundle
    /// - Returns: filename with extension
    private func sourceFilename(from filepath: String) -> String{
        let components = filepath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    private func log(level: LogLevel,
             _ message: String,
             filename: String,
             line: Int,
             column: Int,
             function: String) {
        #if DEBUG
        print(formatMessage(level: level, message: message, filename: filename, line: line, column: column, function: function))
        #endif
    }
}
