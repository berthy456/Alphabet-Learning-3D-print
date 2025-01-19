$fn = 140;
$fs = 0.1;

// TTF ,OTF font name or path
font_path = "Infini Picto";

// Font size
font_size = 32;

// Letter extrusion thickness
thickness = 10;

// Letter
letter = "D";
  font = str(font_path);
  

// 2D Letter
module letter_2d(letter) {
  // Import font
  font = str(font_path);

  // show 2d letter
  text(letter, font=font, size=font_size);
}

// 3D Letter
module letter_3d(letter) {
  // Import OTF font
  font = str(font_path);

  // Extrusion to create 3D
  linear_extrude(height = thickness) {
    text(letter, font=font, size=font_size);
  }
}

// Show 3D
render() {
  letter_3d(letter);
}
