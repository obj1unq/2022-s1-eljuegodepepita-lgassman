import pepita.*
import wollok.game.*
import comidas.*
import randomizer.*

object silvestre {

	const objetivo = pepita

	method image() {
		return "silvestre.png"
	}

	method position() {
		return game.at(objetivo.position().x().max(3), 0)
	}

	method teEncontro(alguien) {
		alguien.perder()
	}
	
	method atravesable() {
		return true
	}

}

object nido {

	const property image = "nido.png"
	var property position = game.at(7, 3)

	method teEncontro(alguien) {
		alguien.ganar()
	}

	method atravesable() {
		return true
	}

}

object derecha {

	method siguiente(posicion) {
		return posicion.right(1)
	}

}

object izquierda {

	method siguiente(posicion) {
		return posicion.left(1)
	}

}

object arriba {

	method siguiente(posicion) {
		return posicion.up(1)
	}

}

object abajo {

	method siguiente(posicion) {
		return posicion.down(1)
	}

}

object constructorManzana {
	
	method construirAlimento() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}

object constructorAlpiste {
	method construirAlimento() {
		return new Alpiste(position=randomizer.emptyPosition(), peso=(40..100).anyOne())
	}
	
} 

object generadorAlimentos {

	const max = 3
	const generados = []
	const constructores = [constructorAlpiste, constructorManzana]
	 
	method generarAlimento() {
		if (generados.size() < max) {
			const alimento = self.construirAlimento()
			generados.add(alimento)
			game.addVisual(alimento)
		}
	}
	
	method construirAlimento() {
		return constructores.anyOne().construirAlimento()
	}
	
	method remover(alimento) {
		generados.remove(alimento)
		if (game.hasVisual(alimento)) {
			game.removeVisual(alimento)
		}
	}

}

class Muro {
	var property position
	const property image = "muro.png" 	
	
	method atravesable() {
		return false
	}
	
}

