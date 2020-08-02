package com.example.exercise

fun main() {
    println(halo())
    println(halo(100))
}

fun halo(): String {
    var angka = 10
    var hasil : String = "20" + angka
    return hasil
}

fun halo(angka : Int): Int {
    return angka
}