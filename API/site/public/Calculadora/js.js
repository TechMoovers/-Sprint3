var inputCustoArroba = document.getElementById("inputCustoArroba");
var inputQtdBovinosMachos = document.getElementById("inputQtdBovinosMachos");
var inputQtdBovinosFemeas = document.getElementById("inputQtdBovinosFemeas");

var infoPre = document.getElementById("infoPre");
var infoTotal = document.getElementById("infoTotal");
var infoResult = document.getElementById("infoResult");

function calcularPerda() {
    var custoArroba = inputCustoArroba.value;
    var qtdBovinosMachos = inputQtdBovinosMachos.value;
    var qtdBovinosFemeas = inputQtdBovinosFemeas.value;

    //Cálculo perda pré-abate - transporte

    var custoKg = custoArroba / 15;
    var kgMacho = qtdBovinosMachos * 588.9;
    var kgFemea = qtdBovinosFemeas * 444.7;

    var kgCarcacaMacho = kgMacho / 2;
    var kgCarcacaFemea = kgFemea / 2;

    var carneMachoPerdidaKg = (kgCarcacaMacho * 0.4807) * 0.0030;
    var carneFemeaPerdidaKg = (kgCarcacaFemea * 0.4807) * 0.0040;
    var carnePerdidaTotalKg = carneMachoPerdidaKg + carneFemeaPerdidaKg;
    var dinheiroPerdido = carnePerdidaTotalKg * custoKg;
    var oQueDeixaDePerder = dinheiroPerdido * 0.25;

        infoPre.innerHTML = 
            `
            <b><p style="color: #fa1b1b; text-align:center">48,7% dos seus animais se lesionam durante o transporte.</p></b><br>

            <p>Sua empresa tem mensalmente uma perda de <b><span class="negative-text">${carnePerdidaTotalKg.toFixed(2)}Kg</span></b> de carne ou <b><span class="negative-text">${(carnePerdidaTotalKg / 15).toFixed(2)}Arroba</span>.</b>
            O que equivale em dinheiro, a um prejuízo de <b><span class="negative-text">R$${dinheiroPerdido.toFixed(2)}</span></b> mensalmente e <b><span class="negative-text">R$${(dinheiroPerdido * 12).toFixed(2)}</span></b> anualmente por conta de lesões na carne causadas por estresse no pré-abate.</p>
            `

        infoResult.innerHTML = 
            `
            <p>Com a nossa solução, sua empresa <b>deixará de perder</b> mensalmente <b><span class="positive-text">R$${oQueDeixaDePerder.toFixed(2)}</span></b> e anualmente <b><span class="positive-text">R$${(oQueDeixaDePerder * 12).toFixed(2)}</span></b> baseado na diminuição da oscilação de temperatura.</p>
            `
    }