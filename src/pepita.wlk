import wollok.game.*
import extras.*

object pepita {

	var energia = 1000
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
		
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		generadorAlimentos.remover(comida)
	}

	method validarVolar(kms) {
		if (self.energiaParaVolar(kms) > energia) {
			self.error("no puedo volar")
		}
	}
	
	method energiaParaVolar(kms) {
		return 10 + kms
	}

	method volar(kms) {
		self.validarVolar(kms)
		energia = energia - self.energiaParaVolar(kms)
	}
	
	method energia() {
		return energia
	}
	
	method destinoValido(direccion) {
		return direccion.x().between(0, game.width() - 1) and
			   direccion.y().between(0, game.height() -1) and
			   game.getObjectsIn(direccion).all({objeto => objeto.atravesable()})
			   
	}
	
	method validarDestino(destino) {
		if(not self.destinoValido(destino)) {
			self.error("destino invalido")
		}		
	}
	
	method mover(direccion) {
		const aDondeVoy = direccion.siguiente(self.position())
		if(self.destinoValido(aDondeVoy)) {
			self.volar(1)
			self.position(aDondeVoy)
		}
	}
	
	method ganar() {
		self.terminar("Gané!")		
	}
	
	method perder() {
		self.terminar("Perdí!")
	}
	
	method terminar(mensaje) {
		game.say(self, mensaje)
		game.schedule(2000, {game.stop()})
	}
	
	method gravedad() {
		const nuevoDestino = self.position().down(1)
		if (self.destinoValido(nuevoDestino)) {
			self.position(nuevoDestino)
		}
	}
	
	

}

