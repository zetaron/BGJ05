import sfml as sf

class Game(object):

	def __init__(self, title):
		self.running = True
		self.states = []
		self.currentState = None
		self.window = sf.RenderWindow(sf.Video(640, 480), title)

	def run(self):
		while self.running:
			for event in window.events:
				if type(event) is sf.CloseEvent:
					self.running = False

			self.window.clear()

			if self.currentState is not None:
				self.currentState.update(self.dt, self.window)
				self.currentState.draw(self.window)

			self.window.display()

		window.close()

class GameState(object):

	def update(self, dt, window):
		pass

	def draw(self, window):
		pass

class MenuState(GameState):

if __name__ == "main":
	game = Game("some title")
	game.states.append(MenuState())
	game.states.append(GameState())

	game.currentState = game.states[0]

	game.run()