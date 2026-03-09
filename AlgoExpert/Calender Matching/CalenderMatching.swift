//
//  CalenderMatching.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 08/04/22.
//

import Foundation

/**
 Time Complexity: O(c1 + c2)
 Space Complexity: O(c1 + c2)
 Note: 
 */

func calendarMatching(_ calendar1: [[String]], _ dailyBounds1: [String], _ calendar2: [[String]], _ dailyBounds2: [String], _ meetingDuration: Int) -> [[String]] {
    let firstCalender = [["0:00", dailyBounds1[0]]] + calendar1 + [[dailyBounds1[1], "23:59"]]
    let secondCalender = [["0:00", dailyBounds2[0]]] + calendar2 + [[dailyBounds2[1], "23:59"]]
    let firstCalenderMiutes  = firstCalender.map { $0.map { toMinutes(time: $0)}}
    let secondCalenderMiutes  = secondCalender.map { $0.map { toMinutes(time: $0)}}
    let mergedCalender = mergeCalender(firstCalender: firstCalenderMiutes, secondCalender: secondCalenderMiutes)
    let flattenCalender = flattenCalenders(mergedCalender)
    let meetings = findTime(in: flattenCalender, duration: meetingDuration)
    return meetings.count > 0 ?  meetings.map { $0.map { toTime(minutes: $0)}} : []
}

func findTime(in intervals: [[Int]], duration: Int) -> [[Int]] {
    var currentMeetingEndTime = intervals[0][1]
    var meetings = [[Int]]()
    var i = 1
    while i < intervals.count {
        let nextMeetingStartTime = intervals[i][0]
        let gapInBetween = nextMeetingStartTime - currentMeetingEndTime
        if duration <= gapInBetween {
            meetings.append([currentMeetingEndTime, nextMeetingStartTime])
        }
        currentMeetingEndTime = intervals[i][1]
        i += 1
    }
    return meetings
}

func flattenCalenders(_ calender: [[Int]]) -> [[Int]] {
    var flatten = [[Int]]()
    var i = 1
    var currentStart = calender[0][0]
    var currentEnd = calender[0][1]
    while i < calender.count {
        let currentInterval = calender[i]
        if currentInterval[0] <= currentEnd {
            // overlaps
            currentStart = min(currentInterval[0], currentStart)
            currentEnd = max(currentInterval[1], currentEnd)
        } else {
            flatten.append([currentStart, currentEnd])
            currentStart = currentInterval[0]
            currentEnd = currentInterval[1]
        }
        i += 1
    }
    flatten.append([currentStart, currentEnd])
    return flatten
}


func mergeCalender(firstCalender: [[Int]], secondCalender: [[Int]]) -> [[Int]] {
    var mergedCalender = [[Int]](repeating: [], count: firstCalender.count + secondCalender.count)
    var i = 0
    var j = 0
    var k = 0
    while i < firstCalender.count, j < secondCalender.count {
        if firstCalender[i][0] < secondCalender[j][0] {
            mergedCalender[k] = firstCalender[i]
            i += 1
        } else {
            mergedCalender[k] = secondCalender[j]
            j += 1
        }
        k += 1
    }
    
    while i < firstCalender.count {
        mergedCalender[k] = firstCalender[i]
        i += 1
        k += 1
    }
    
    while j < secondCalender.count {
        mergedCalender[k] = secondCalender[j]
        j += 1
        k += 1
    }
    return mergedCalender
}

func toMinutes(time: String) -> Int {
    let times = time.components(separatedBy: ":").map { Int($0)! }
    return times[0] * 60 + times[1]
}

func toTime(minutes: Int) -> String {
    let hour = minutes/60
    let minute = minutes % 60
    return "\(hour):" + (minute == 0 ? "00" : "\(minute)")
}
