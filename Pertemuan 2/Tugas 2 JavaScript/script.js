function hitungGanjil() {
    var min = parseInt(document.getElementById("nilaiMin").value);
    var max = parseInt(document.getElementById("nilaiMax").value);
    var total = 0;
    var deret = "";

    for (var i = min; i <= max; i++) {
        if (i % 2 !== 0) {
            total = total + i;
            deret = deret + i + " ";
        }
    }
    alert("Deret ganjil: " + deret + "\nHasil penjumlahan: " + total);
}

function ubahPosisiTeks() {
    var kartu = document.getElementsByClassName("card");
    
    for (var i = 0; i < kartu.length; i++) {
        if (kartu[i].style.textAlign === "right") {
            kartu[i].style.textAlign = "center";
            kartu[i].style.alignItems = "center";
        } else {
            kartu[i].style.textAlign = "right";
            kartu[i].style.alignItems = "flex-end";
        }
    }
}

function ubahWarna() {
    var kotak = document.getElementById("kotakSatu");
    
    if (kotak.style.backgroundColor === "black") {
        kotak.style.backgroundColor = ""; 
    } else {
        kotak.style.backgroundColor = "black";
    }
}