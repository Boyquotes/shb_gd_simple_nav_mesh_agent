# shb_gd_simple_nav_mesh_agent - Simple NavMesh Agent dengan Godot Engine

## Software Apakah Ini?

SHBGDSimpleNavMeshAgent adalah script Godot Engine yang menunjukkan cara membuat simple NavMesh Agent dengan Godot Engine.

## Screenshot

![ScreenShot](.readme-assets/SHBGDSimpleNavMeshAgent-1.png?raw=true)

## Cara Mencoba Kode Ini

Untuk mencoba kode ini, Anda memerlukan Godot Engine v3.5.

Download dan install software tersebut...

Kemudian buka project ini dan jalankan.

## Pendahuluan

Kali ini saya akan memberi contoh cara membuat NavMesh Agent sederhana di Godot Engine.

Jika Anda pernah belajar Unity sebelumnya, Anda mungkin menyadari ada komponen bernama NavMeshAgent di Unity.

Sayangnya, sampai versi 3.4 belum ada yang seperti itu di Godot Engine meskipun Godot Engine menyediakan fitur untuk pathfinding juga.

Oleh karena itulah, saya membuat script untuk NavMesh Agent di Godot Engine.

Dengan script ini, kita bisa menggerakkan karakter capsule sederhana untuk menemukan path kemudian berjalan mengikutinya dalam pathfinding.

## Cara Kerja

NavMeshAgent ini bekerja dengan memproses input posisi target menjadi array posisi path node.

Adapun posisi target diperoleh dengan mengonversi posisi kursor di koordinat layar menjadi posisi di ruang 3D.

## Struktur Project

Untuk melihat struktur project game ini, silakan buka project ini di Godot Engine.
