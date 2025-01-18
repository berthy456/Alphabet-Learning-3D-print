$fn = 140;
$fs = 0.1;

// Chemin vers la police OTF
font_path = "Infini Picto";

// Taille de la police
font_size = 34;

// Épaisseur de l'extrusion
thickness = 10;

// Lettre à afficher
letter = "D";
  font = str(font_path);
  

// Module pour afficher la lettre 2D
module letter_2d(letter) {
  // Importer la police OTF
  font = str(font_path);

  // Afficher la lettre 2D
  text(letter, font=font, size=font_size);
}

// Module pour afficher la lettre 3D
module letter_3d(letter) {
  // Importer la police OTF
  font = str(font_path);

  // Extruder la lettre 2D pour créer la forme 3D
  linear_extrude(height = thickness) {
    text(letter, font=font, size=font_size);
  }
}

// Afficher la lettre 3D
render() {
  letter_3d(letter);
}
