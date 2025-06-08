// Variabel transformasi
float pitch = 0;
float yaw = 0;
float roll = 0;
float zoom = 1.0;

// Variabel posisi
float sideX = 0;
float sideY = 0;
float sideZ = 0;

// Variabel move
float poinX = 0;
float poinY = 0;
boolean move = false;

// Variabel tekstur
boolean teksturON = true;
PImage tekstur;

// Variabel lights
boolean depan = false;
boolean belakang = false;
boolean kanan = false;
boolean kiri = false;
boolean atas = false;
boolean bawah = false;

// Pengaturan kanvas
void setup() {
  size(1000, 800, P3D);
  tekstur = loadImage("sand.jpg");
}

// Pengaturan isi kanvas
void draw() {
  background(#000000); //Warna Hitam
  lights();
  noLights();
  noStroke();
  translate(width/2, height/2, 0); //Pindah titik pusat ke tengah kanvas
  fill(#FFFFFF); // Warna Box Putih
  
  // Cahaya dari depan
  if (depan) {
    directionalLight(255, 255, 255, 0, 0, -1);
  }
  
  // Cahaya dari belakang
  if (belakang) {
    directionalLight(200, 200, 200, 0, 0, 1);
  }
  
  // Cahaya dari kanan
  if (kanan) {
    directionalLight(150, 150, 150, -1, 0, 0);
  }
  
  // Cahaya dari kiri
  if (kiri) {
    directionalLight(150, 150, 150, 1, 0, 0);
  }
  
  // Cahaya dari atas
  if (atas) {
    directionalLight(255, 255, 255, 0, 1, 0);
  }
  
  // Cahaya dari bawah
  if (bawah) {
    directionalLight(255, 255, 255, 0, -1, 0);
  }
  
  // Cahaya dasar
  ambientLight(50, 50, 50);
  
  // Transformasi objek
  rotateX(radians(pitch));
  rotateY(radians(yaw));
  rotateZ(radians(roll));
  
  // Zoom objek
  scale(zoom);
  
  // Posisi objek
  translate(sideX, sideY, sideZ);
  
  // =====================Huruf C====================
  pushMatrix();
  
  pushMatrix();
  translate(-300, 0, 0); // Geser box pertama
  if (teksturON) {
    insertBox(55, 220, 50, tekstur);
  } else {
    box(55, 220, 50);
  }
  popMatrix();
  
  pushMatrix();
  translate(-235, -85, 0); // Geser box kedua
  if (teksturON) {
    insertBox(180, 55, 50, tekstur);
  } else {
    box(180, 55, 50);
  }
  popMatrix();
  
  pushMatrix();
  translate(-235, 85, 0); // Geser box ketiga
  if (teksturON) {
    insertBox(180, 55, 50, tekstur);
  } else {
    box(180, 55, 50);
  }
  popMatrix();
  
  popMatrix();
  // =====================Huruf A====================
  pushMatrix();

  pushMatrix();
  translate(-40, 0, 0); //Geser box pertama
  rotateZ(radians(30));
  box(55, 220, 50);
  popMatrix();
  
  // Tiang kanan A
  pushMatrix();
  translate(40, 0, 0); // Geser box kedua
  rotateZ(radians(-30));
  box(55, 220, 50);
  popMatrix();
  
  // Batang tengah A
  pushMatrix();
  translate(0, 50, 0); // Geser box ketiga
  box(100, 40, 50);
  popMatrix();
  
  popMatrix();
  // =====================Huruf Z====================
  pushMatrix();
  
  pushMatrix();
  translate(270, -85, 0); //Geser box pertama
  if (teksturON) {
    insertBox(220, 55, 50, tekstur);
  } else {
    box(220, 55, 50);
  }
  popMatrix();
  
  pushMatrix();
  translate(270, 85, 0); // Geser box kedua
  if (teksturON) {
    insertBox(220, 55, 50, tekstur);
  } else {
    box(220, 55, 50);
  }
  popMatrix();
  
  pushMatrix();
  translate(270, 0, 0); // Geser box ketiga
  rotateZ(radians(-45));
  if (teksturON) {
    insertBox(260, 55, 50, tekstur);
  } else {
    box(260, 55, 50);
  }
  popMatrix();
  
  popMatrix();
}

// Fungsi tekstur
void insertBox(float p, float l, float d, PImage tekstur) {
  beginShape(QUADS);
  texture(tekstur);

  // Front
  vertex(-p/2, -l/2, d/2, 0, 0);
  vertex( p/2, -l/2, d/2, tekstur.width, 0);
  vertex( p/2,  l/2, d/2, tekstur.width, tekstur.height);
  vertex(-p/2,  l/2, d/2, 0, tekstur.height);

  // Back
  vertex( p/2, -l/2, -d/2, 0, 0);
  vertex(-p/2, -l/2, -d/2, tekstur.width, 0);
  vertex(-p/2,  l/2, -d/2, tekstur.width, tekstur.height);
  vertex( p/2,  l/2, -d/2, 0, tekstur.height);

  // Left
  vertex(-p/2, -l/2, -d/2, 0, 0);
  vertex(-p/2, -l/2,  d/2, tekstur.width, 0);
  vertex(-p/2,  l/2,  d/2, tekstur.width, tekstur.height);
  vertex(-p/2,  l/2, -d/2, 0, tekstur.height);

  // Right
  vertex(p/2, -l/2,  d/2, 0, 0);
  vertex(p/2, -l/2, -d/2, tekstur.width, 0);
  vertex(p/2,  l/2, -d/2, tekstur.width, tekstur.height);
  vertex(p/2,  l/2,  d/2, 0, tekstur.height);

  // Top
  vertex(-p/2, -l/2, -d/2, 0, 0);
  vertex( p/2, -l/2, -d/2, tekstur.width, 0);
  vertex( p/2, -l/2,  d/2, tekstur.width, tekstur.height);
  vertex(-p/2, -l/2,  d/2, 0, tekstur.height);

  // Bottom
  vertex(-p/2, l/2,  d/2, 0, 0);
  vertex( p/2, l/2,  d/2, tekstur.width, 0);
  vertex( p/2, l/2, -d/2, tekstur.width, tekstur.height);
  vertex(-p/2, l/2, -d/2, 0, tekstur.height);

  endShape();
}

// Deteksi mouse menekan di dalam kanvas
void mousePressed() {
  poinX = mouseX;
  poinY = mouseY;
  move = true;
}

// Deteksu mouse tidak menekan di dalam kanvas
void mouseReleased() {
  move = false;
}

// Pergerakan objek berdasarkan mouse
void mouseDragged() {
  if (move) {
    float crab = mouseX - poinX;
    float ped = mouseY - poinY;
    sideX += crab;
    sideY += ped;
    poinX = mouseX;
    poinY = mouseY;
  }
}

// Pengaturan aktivasi tombol
void keyPressed() {
 switch(key) {
   case 'x':
     pitch += 10;
     break;
   case 'y':
     yaw += 10;
     break;
   case 'z':
     roll += 10;
     break;
   case '=':
     zoom += 0.2;
     zoom = constrain(zoom, 0.3, 3.0);
     break;
   case '-':
     zoom -= 0.2;
     zoom = constrain(zoom, 0.3, 3.0);
     break;
   case 't':
     teksturON = !teksturON;
     break;
   case '1':
     depan = !depan;
     break;
   case '2':
     belakang = !belakang;
     break;
   case '3':
     kanan = !kanan;
     break;
   case '4':
     kiri = !kiri;
     break;
   case '5':
     atas = !atas;
     break;
   case '6':
     bawah = !bawah;
     break;
 }
}
