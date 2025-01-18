// Définir les paramètres

largeur_perimetre = 1.5; // par défaut
hauteur_perimetre= 0.4;
deplacement_z = 10; // paramètre pour le déplacement sur l'axe de Z



lettre = "A"; // Lettre à traiter
translation_X = 0.1; // Décalage X
translation_Y = 0.1; // Décalage Y

reduction_normale = 100; // Reduction de la lettre normale en pourcentage
rotation_Z = 0.1; // Rotation Z

// 

// Afficher l'objet avec la rehausse
union() {
  color("red")
    import(str(lettre, "-picto.stl"));
  difference() {
  color("blue")
    translate([translation_X, translation_Y, 0])
      rotate([0, 0, -rotation_Z])
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
