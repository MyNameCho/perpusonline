// Pastikan Anda menyertakan library three.js dan threejs-toys terlebih dahulu
import { particleCursor } from 'threejs-toys';

// Pilih elemen HTML tempat efek kursor akan diterapkan
const pc = particleCursor({
    el: document.getElementById('app'), // Pastikan elemen ini ada di HTML Anda
    gpgpuSize: 128, // Ukuran GPGPU untuk simulasi
    colors: ['#ff0000', '#00ff00', '#0000ff'], // Warna partikel (opsional)
    noiseIntensity: 0.5, // Intensitas pergerakan noise
    noiseTimeCoef: 0.0005, // Kecepatan animasi noise
    pointSize: 3, // Ukuran partikel
    particleCount: 5000, // Jumlah partikel
});

// Tambahkan gaya dasar untuk elemen #app jika belum ada
const appElement = document.getElementById('app');
if (appElement) {
    appElement.style.position = 'relative';
    appElement.style.width = '100vw';
    appElement.style.height = '100vh';
    appElement.style.overflow = 'hidden';
}

<div id="app">
    <div id="hero">
        <h1>Particle Cursor</h1>
        <p>Move your cursor around the screen to see the effect</p>
    </div>
</div>