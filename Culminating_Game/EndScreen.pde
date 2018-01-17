void endScreen()
{  
  background(255);

  //Draws text onto the screen when the game has ended
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width / 2, height / 2);
  
  //Draws the time it took for the player to lose/win in seconds
  textSize(25);
  text("Your Time: " + round(gameTimer) + " seconds!", width / 2, height / 2 + 200);
}