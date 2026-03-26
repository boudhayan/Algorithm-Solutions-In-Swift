//
//  TopologicalSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/24.
//

import Foundation

class Graph {
    private let nodes: [Int]
    private var adj: [Int: [Int]] = [:]
    
    init(nodes: [Int], edges: [[Int]]) {
        self.nodes = nodes
        for edge in edges {
            self.adj[edge[0], default: []].append(edge[1])
        }
    }
    
    private enum NodeState {
        case unvisited, visited, visiting
    }
    
    func topologicalSort() -> [Int]? {
        var visited = [NodeState](repeating: .unvisited, count: nodes.count + 1)
        var stack = [Int]()
        for node in nodes {
            if !dfs(node: node) {
                return nil
            }
        }
        
        func dfs(node: Int) -> Bool {
            if visited[node] == .visited { return true }
            if visited[node] == .visiting { return false }
            visited[node] = .visiting
            
            if let connectedVertices = adj[node] {
                for vertex in connectedVertices {
                    if !dfs(node: vertex) { return false }
                }
            }
            stack.append(node)
            visited[node] = .visited
            return true
        }
        return stack.reversed()
    }
}
