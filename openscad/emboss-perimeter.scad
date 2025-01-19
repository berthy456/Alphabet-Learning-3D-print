// parameters

//Perimeter width
largeur_perimetre = 1.5;

//Perimeter extrusion height
hauteur_perimetre= 0.4;

//Perimeter Z position
deplacement_z = 10; 

// Perimeter reduction
reduction_normale = 100; 

// Perimeter rotation
rotation_Z = 0.1; // Rotation Z

// Letter to compute
lettre = "A"; 
// X offset
translation_X = 0.1; 
// Y offset
translation_Y = 0.1; 


// Afficher l'objet avec la rehausse
union() {
  color("red")
    import(str(lettre, "-picto.stl"));
  difference() {
  color("blue")
    translate([translation_X, translation_Y, 0])
      rotate([0, 0, -rotation_Z])
      //you can adjust here to flatten the perimeter shape Like for W I reduced X by /80 instead of /100...
        scale([reduction_normale/100, reduction_normale/100, 1])
        rehausse_perimetre()  ;
  }
}


module rehausse_perimetre() {
    
  module contour() {
    difference() {
      projection(cut = true) {
        import(str(lettre, ".stl"));
      }
      offset(r = -largeur_perimetre/2) {
        projection(cut = true) {
          import(str(lettre, ".stl"));
        }
      }
    }
  }

  module rehausse_contour() {
    linear_extrude(height = hauteur_perimetre) {
      contour();
    }
  }

  module rehausse_contour_deplace() {
    translate([0, 0, deplacement_z]) {
      rehausse_contour();
    }
  }

  difference() {
    rehausse_contour_deplace();
    import(str(lettre, ".stl"));
  }
}
