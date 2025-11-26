package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    void sumar_deberia_sumar_dos_numeros() {
        int resultado = App.sumar(2, 3);
        assertEquals(5, resultado, "2 + 3 debe ser 5");
    }
}
