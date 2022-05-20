import wollok.game.*

class Manzana {
	const base= 5
	var madurez = 1
	
	var property position =game.at(3,5)
	
	
	method image() {
		return "manzana.png"
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}
	
	method teEncontro(alguien) {
		alguien.comer(self)
	}

	method atravesable() {
		return true
	}

}

class Alpiste {
	
	const peso = 20
	const property position = game.at(2,3)

	method energiaQueOtorga() {
		return peso
	} 
		
	method image() {
		return "alpiste.png"
	}

	method teEncontro(alguien) {
		alguien.comer(self)
	}

	method atravesable() {
		return true
	}

}

