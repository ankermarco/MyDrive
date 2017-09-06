//
//  GameEngine.swift
//  MyDrive
//
//  Created by Ke Ma on 06/09/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import Foundation


class GameEngine
{
  var bound: (width:Int, height:Int)
  let bombs: [(Int, Int)]
  
  init(size: Int, bombs: [(Int,Int)])
  {
    self.bound = (size,size)
    self.bombs = bombs
  }
  
  // Return whether the selected cell has bomb or the number of bombs around it
  func checkCell(coordinate:(Int,Int)) -> (isBombCell: Bool, numbeOfBombs: Int)
  {
    let isBombCell = isBomb(coordinate: coordinate)
    var count = 0
    
    if !isBombCell {
      let neighbourCells = getNeighbours(coordinate: coordinate)
      let bombCells = getBombCellsFrom(cells: neighbourCells)
      
      count = bombCells.count
    }
    
    return(isBombCell, count)
  }
  
  // Check the selected cell has bomb
  private func isBomb(coordinate:(Int,Int)) -> Bool
  {
    let isBombCell = self.bombs.contains { element in
      element == coordinate
    }
    
    return isBombCell
  }
  
  // Get all the 8 cells directly next to the clicked Cell
  private func getNeighbours(coordinate:(width:Int,height:Int)) -> [(Int,Int)]
  {
    var neighbours = [(Int, Int)]()

    for y in (coordinate.height - 1)...coordinate.height + 1
    {
      for x in (coordinate.width - 1)...coordinate.width + 1
      {
        neighbours.append((x,y))
      }
    }
    // Remove the cell self
    neighbours = neighbours.filter({ $0 != coordinate })
    
    // Remove the cells which are out of the boundary
    neighbours = neighbours.filter({
      $0.0 >= 1 &&
      $0.1 >= 1 &&
      $0.0<=bound.width &&
      $0.1 <= bound.height})

    return neighbours
  }
  
  private func getBombCellsFrom(cells: [(Int,Int)]) -> [(Int, Int)]
  {
    var bombCells = [(Int, Int)]()
    
    for cell in cells
    {
      if self.bombs.contains(where: { (element) -> Bool in
        element == cell
      }) {
        bombCells.append(cell)
      }
    }
    return bombCells
  }
}
