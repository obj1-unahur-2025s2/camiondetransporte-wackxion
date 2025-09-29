object camion {
// part 1
const cosasCargadas = []

method cosasCargadas() = cosasCargadas
method cargarCosa(cosa) = cosasCargadas.add(cosa)
method descargarCosa(cosa) = cosasCargadas.remove(cosa)
method tara() = 1000
method pesoTotal(){
    return (self.cosasCargadas().map({c => c.peso()}).sum() +
    self.tara())
}
method pesoDeTodasLasCosasEnELCamionSonPar(){
    self.cosasCargadas().all({c => c.peso().even()})
}
method hayAlgunaCosaQuePese(peso){
    self.cosasCargadas().contains({c => c.peso() == peso}) > 0
}
method todasLasCosasDeNivelDePeligro(nivel){
    return cosasCargadas.filter({c => c.nivelDePeligro() == nivel })
}
method primerCosaConNivelDePeligroSiHay(nivel) {
    if( not self.todasLasCosasDeNivelDePeligro(nivel).isEmpty()) {
        self.todasLasCosasDeNivelDePeligro(nivel).first()
    }
}
method todasLasCosasConNivelDePeligroMayorAlDado(nivelDado){
    return self.cosasCargadas().filter({c => c.nivelDePeligro() > nivelDado})
}

method todasLasCosasConNivelDePeligroMayorAUnaCosaDada(cosaDada){
    self.cosasCargadas().filter({c => c.nivelDePeligro() > cosaDada.nivelDePeligro()})
}
method elCamionEstaConSobreCarga() {
    return self.pesoTotal() > 2500
}
method elCamionPudeCirculrEnRuta(nivelDeRuta) {
    self.elCamionEstaConSobreCarga() and
    self.todasLasCosasConNivelDePeligroMayorAlDado(nivelDeRuta).size() > 0
}
// agregados al camion

method hayAlgunaCosaQuePeseEntre(unPesoMin, otroPesoMax) {
    self.cosasCargadas().any({c => c.peso().between(unPesoMin, otroPesoMax)})
}
method laCosaConMasPesoCargadaSiNoCero() {
    if(not self.cosasCargadas().map({c => c.peso()}).isEmpty()){
        self.cosasCargadas().map({c => c.peso()}).max()
    }else{
        return 0
    }
}

}