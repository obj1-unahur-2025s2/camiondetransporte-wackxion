import camion.*
// part 1
object knightRider {
    method peso() = 500
    method nivelDePeligro() = 10
    // parte 2
    method cantidadDeBultos() = 1
    method consecuenciaDeCarga() = null
}
object bumblebe {
    var estaEnModoAuto = true
    var nivelDePeligro = 15
    
    method peso() = 800 
    method nivelDePeligro() = nivelDePeligro 
    method estaEnModoAuto() = estaEnModoAuto
    method transformar(){
        if(self.estaEnModoAuto()){
            estaEnModoAuto = false
            nivelDePeligro = 30
        } else {
            estaEnModoAuto = true
            nivelDePeligro = 15
        }
    }
    // parte 2 
    method cantidadDeBultos() = 2
    method tranformarARobot(){ // se crea este metodo solo para la segunda parte 
        estaEnModoAuto = false
        nivelDePeligro = 30
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self) or contenedorPortuario.cosasDentroDelContenedor().contains(self)){
            self.tranformarARobot()
        }
    }
}
object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0
    method cantidadDeLadrillos() = cantidadDeLadrillos
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligro() = 2
    method cargarLadrillos(cantidad) {
      cantidadDeLadrillos = cantidad
    }
    // parte 2
    method cantidadDeBultos() {
        if(self.cantidadDeLadrillos().between(1, 100)){
            return 1
        }else if(self.cantidadDeLadrillos().between(101, 300)){
            return 2
        }else{
            return 3
        }
    }
    method sumar12Ladrillos() { // metodo creado para el ejercicio
        cantidadDeLadrillos = cantidadDeLadrillos + 12
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self) or contenedorPortuario.cosasDentroDelContenedor().contains(self)){
            self.sumar12Ladrillos()
        }
    }
}

object arena {
    var pesoCargado = 0
    method peso() = pesoCargado
    method nivelDePeligro() = 1
    method cargarArena(cantidad) {
      pesoCargado = cantidad
    }
    // parte 2
    method cantidadDeBultos() = 1
    method restar10Arena() { 
        pesoCargado = pesoCargado - 10 
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self) or contenedorPortuario.cosasDentroDelContenedor().contains(self)){
            self.restar10Arena()
        }
    }
}
object bateriaAntiaerea {
    var peso = 200
    var nivelDePeligro = 0
    var misilesEstanCargados = false
  
    method misilesEstanCargados() = misilesEstanCargados
    method peso() = peso
    method nivelDePeligro() = nivelDePeligro
    method cargarMisilesODescargarMisiles(){
        if(not self.misilesEstanCargados()){
            peso = 300
            nivelDePeligro = 100
            misilesEstanCargados = true
        } else{
        peso = 200
        nivelDePeligro = 0
        misilesEstanCargados = false
        }
    }
  // parte 2
    method cantidadDeBultos(){
        if(self.misilesEstanCargados()){
            return 2
        }else{
            return 1
        }
}
    method cargarMisiles(){ // METODO creado para el ejercicio
        peso = 300
        nivelDePeligro = 100
        misilesEstanCargados = true
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self) or contenedorPortuario.cosasDentroDelContenedor().contains(self)){
            self.cargarMisiles()
        }
    }
}
object contenedorPortuario {
    const cosasDentroDelContenedor = []

    method cargarCosaAlContenedor(cosa) {
        cosasDentroDelContenedor.add(cosa)
    }
    method descargarCosaDelContenedor(cosa) {
        cosasDentroDelContenedor.remove(cosa)
    }
    method pesoTotalContenido() {
        return self.cosasDentroDelContenedor().map({c => c.peso()}).sum()
    }
    method nivelesDePeligroContenidos(){
        return self.cosasDentroDelContenedor().map({c => c.nivelDePeligro()}).asSet()
    }
    method mayorNivelDePeligrocidadContenido(){
        if(not self.nivelesDePeligroContenidos().isEmpty()){
            return self.nivelesDePeligroContenidos().max()
        }else{
            return 0}
    }
    method cosasDentroDelContenedor() = cosasDentroDelContenedor
    method peso() = 100 + self.pesoTotalContenido()
    method nivelDePeligro() = self.mayorNivelDePeligrocidadContenido()

    //parte 2
    method cantidadDeBultos() {
        return self.cosasDentroDelContenedor().map({c => c.cantidadDeBultos()}).sum() + 1
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self) or self.cosasDentroDelContenedor().contains(self)){
            camion.cosasCargadas().forEach({c => c.consecuenciaDeCarga()})
        }
    }
}

object residuosRadiactivos {
    var peso = 0
    method cargarReciduos(cantidad) {
      peso = cantidad
    }
    method peso() = peso
    method nivelDePeligro() = 200
    // parte 2
    method cantidadDeBultos() = 1
    method agregar15kg(){
        peso = peso + 15
    }
    method consecuenciaDeCarga(){
        if(camion.cosasCargadas().contains(self)){
            self.agregar15kg()
        }
    }
}
object embalajeDeSeguridad {
    var cosaAEnvolver = null
    method cambiarCosasAEnvolver(cosa){
        cosaAEnvolver = cosa
    }
    method peso() = cosaAEnvolver.peso()
    method nivelDePeligro() = cosaAEnvolver.nivelDePeligro().div(2)
    // parte 2
    method cantidadDeBultos() = 2
    method consecuenciaDeCarga() = null
}