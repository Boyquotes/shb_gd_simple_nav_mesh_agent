# shb_gd_simple_nav_mesh_agent - Simple NavMesh Agent dengan Godot Engine

## Software Apakah Ini?

shb_gd_simple_nav_mesh_agent adalah script Godot Engine yang menunjukkan cara membuat simple NavMesh Agent dengan Godot Engine.

Jika Anda pernah belajar Unity sebelumnya, Anda mungkin menyadari ada komponen bernama NavMeshAgent di Unity.

Sayangnya, sampai versi 3.4 belum ada yang seperti itu di Godot Engine meskipun Godot Engine menyediakan fitur untuk pathfinding juga.

Oleh karena itulah, saya membuat script untuk NavMesh Agent di Godot Engine.

Dengan script ini, kita bisa menggerakkan karakter capsule sederhana untuk menemukan path kemudian berjalan mengikutinya dalam pathfinding.

## Cara Kerja

NavMeshAgent ini bekerja dengan memproses input posisi target menjadi array posisi path node.

Adapun posisi target diperoleh dengan mengonversi posisi kursor di koordinat layar menjadi posisi di ruang 3D.

## Cara Mencoba Kode Ini

Untuk mencoba kode ini, Anda memerlukan Godot Engine.

Download dan install software tersebut...

Kemudian buka project ini dan jalankan.

## Screenshot

![ScreenShot](.readme-assets/SHBGDSimpleNavMeshAgent-1.png?raw=true)
