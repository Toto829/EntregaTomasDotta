# Entrega Tomás Dotta - 326829

#!/bin/bash


#-------------Funciones de validacion de datos----------------------------------------------------
function validarPositivo { #funcion que valida si el dato ingresado es un entero positivo
    valor=$1
    #^: Este símbolo representa el inicio de la cadena. Indica que la coincidencia debe comenzar al principio de la cadena.
    #[0-9]: Este es un rango de caracteres que incluye los dígitos del 1 al 9. Indica que el primer carácter de la cadena debe ser un dígito del 1 al 9.
    #[0-9]*: Este es otro rango de caracteres que incluye los dígitos del 0 al 9, seguido del asterisco *. El asterisco significa "cero o más veces". Esto indica que después del primer dígito (que debe estar entre 1 y 9), puede haber cero o más dígitos adicionales del 0 al 9.
    #$: Este símbolo representa el final de la cadena. Indica que la coincidencia debe terminar al final de la cadena.
    
    if ! [[ $valor =~ ^[0-9][0-9]*$ ]]; then #if que valida si el dato ingresado es un entero positivo
        return 1  # Devolver código de error
    fi
    return 0  # Devolver éxito
}

function validar { #funcion que valida si el dato ingresado es un entero positivo
    valor=$1
    #^: Este símbolo representa el inicio de la cadena. Indica que la coincidencia debe comenzar al principio de la cadena.
    #-?: Indica que el simbolo de - delante puede estar como no estar (es opcional)
    #[0-9]+: Este es otro rango de caracteres que incluye los dígitos del 0 al 9, seguido del +. El mas significa "minimo una vez". Esto indica que necesariamente existira al menos un caracter, y estara en dicho rango
    #$: Este símbolo representa el final de la cadena. Indica que la coincidencia debe terminar al final de la cadena.
    
    if ! [[ $valor =~ ^-?[0-9]+$ ]]; then #if que valida si el dato ingresado es un entero positivo
        return 1  # Devolver código de error
    fi
    return 0  # Devolver éxito
}


#-------------Funciones del menú----------------------------------------------------

function sumar {
    echo "Ha ingresado a sumar, por favor ingrese un número"

    read num1
    validar "$num1" #Validamos que el dato ingresado vea valido
    while [[ $? -ne 0 ]]; do #while infinito que toma el comando anterior($?), y si lo que dio fue distinto de 0(-ne 0), ejecuta lo de dentro
        echo "Error: \"$num1\" no es un número entero. Inténtelo nuevamente."
        read num1 #reescribimos el numero que esta mal por uno nuevo
        validar "$num1" #validamos si el nuevo valor esta bien, en caso contrario se ejecuta de nuevo el while
    done

    echo "Ingrese el segundo número"

    read num2
    validar "$num2" #Validamos que el dato ingresado vea valido
    while [[ $? -ne 0 ]]; do #while infinito que toma el comando anterior($?), y si lo que dio fue distinto de 0(-ne 0), ejecuta lo de dentro
        echo "Error: \"$num2\" no es un número entero. Inténtelo nuevamente."
        read num2 #reescribimos el numero que esta mal por uno nuevo
        validar "$num2" #validamos si el nuevo valor esta bien, en caso contrario se ejecuta de nuevo el while
    done

    clear
    echo -e "\n$num1 + $num2 = $((num1+num2))\n"

}

function multiplicar {
    echo "Ha ingresado a multiplicar, por favor ingrese un número"

    read num1
    validar "$num1" #Validamos que el dato ingresado vea valido
    while [[ $? -ne 0 ]]; do #while infinito que toma el comando anterior($?), y si lo que dio fue distinto de 0(-ne 0), ejecuta lo de dentro
        echo "Error: \"$num1\" no es un número entero. Inténtelo nuevamente."
        read num1 #reescribimos el numero que esta mal por uno nuevo
        validar "$num1" #validamos si el nuevo valor esta bien, en caso contrario se ejecuta de nuevo el while
    done

    echo "Ingrese el segundo número"

    read num2
    validar "$num2" #Validamos que el dato ingresado vea valido
    while [[ $? -ne 0 ]]; do #while infinito que toma el comando anterior($?), y si lo que dio fue distinto de 0(-ne 0), ejecuta lo de dentro
        echo "Error: \"$num2\" no es un número entero. Inténtelo nuevamente."
        read num2 #reescribimos el numero que esta mal por uno nuevo
        validar "$num2" #validamos si el nuevo valor esta bien, en caso contrario se ejecuta de nuevo el while
    done

    clear
    echo -e "\n$num1 x $num2 = $((num1*num2))\n"
}

function triangulo {
    echo "Ingrese el tamaño de la base"
    read base

    validarPositivo "$base" #Validamos que el valor ingresado sea mayor o igual a 0
    while [[ $? -ne 0 ]]; do #while infinito que toma el comando anterior($?), y si lo que dio fue distinto de 0(-ne 0), ejecuta lo de dentro
        echo "Error: \"$base\" no es un número entero positivo. Inténtelo nuevamente." 
        read base #reescribimos el numero que esta mal por uno nuevo
        validarPositivo "$base" #validamos si el nuevo valor esta bien, en caso contrario se ejecuta de nuevo el while
    done

    clear
    mostrar=""
    for (( i=1; i<=$base; i++));
    do
        mostrar=$mostrar"#"
        echo "$mostrar"
    done
    echo -e "\n"
}


echo -e "Seleccione una opción del menú \n[1] Sumar\n[2] Multiplicar\n[3] Crear Triángulo\n[4] Empresa\n[0] Salir "
read op

case $op in
    "1") clear; sumar
        ./entrega.sh
    ;;
    "2") clear; multiplicar
        ./entrega.sh
    ;;
    "3") clear; triangulo
        ./entrega.sh
    ;;
    "4") clear; echo -e "\nMuchas gracias por seleccionar a Opción4.SA, por favor continue su instancia con normalidad\n"
        ./entrega.sh
    ;;
    "0") clear; echo -e "\nInstancia Finalizada\n"; exit ;;
    *)  clear; echo -e "\nOpción invalida, seleccione nuevamente una opción\n"
        ./entrega.sh
     ;;
esac

