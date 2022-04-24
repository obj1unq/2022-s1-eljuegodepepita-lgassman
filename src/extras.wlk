import pepita.*
import wollok.game.*

object silvestre {
	
	const objetivo = pepita
	
	method image() {
		return "silvestre.png"
	}
	
	method position() {
		return game.at(objetivo.position().x().max(3), 0)		
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












