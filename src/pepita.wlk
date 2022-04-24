import wollok.game.*
import extras.*

object pepita {

	var energia = 100
	var property position = game.at(5,7) 
	const cazador = silvestre
	
	method position(_position) {
		position = _position
	}
	
	
	method estaAtrapada() {
		return self.position() == cazador.position()
	}
	
	method nombreEstado() {
		return if(self.estaAtrapada()) {"atrapada"} else {"libre"} 
	}
	
	method image() {
		return "pepita-" + self.nombreEstado() + ".png"		
	}
	
//	method text() {
//		return "Pepita!!"
//	}
	
//	method textColor() {
//		return "ff0000ff"
//	}
	
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}
	
	
	method mover(direccion) {
		self.volar(1)
		self.position(direccion.siguiente(self.position()))
	}
	
//	method comer() {
//		const alimento = game.uniqueCollider(self)
//		self.comer(alimento)
//		game.removeVisual(alimento)
//		game.say(self, "Que Rico!")
//	}
	

}

