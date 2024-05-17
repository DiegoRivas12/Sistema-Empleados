# Sistema-Empleados
Prerrequisitos:
Node.js 

## Prerrequisitos
* NodeJs
* XAMPP
* Composer

## Instalaciones
* Instalacion de Angular
```
npm install -g @angular/cli
```

## Instalación tailwind css con Angular
Ir a la direccion tailwind [Tailwind Pages](https://pages.github.com/)
Creando el proyecto angular llamado sistema:
```
ng new sistema
cd sistema

```
Instalando tailwind css:
```
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init

```
Configurando rutas de plantilla en sistema/tailwind.config.js

```
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
    ".pages/**/*.{html,ts}",
    ".components/**/*.{html,ts}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

```
Añade las directivas Tailwind a tu CSS (sistema/src/styles.css):
```
@tailwind base;
@tailwind components;
@tailwind utilities;

```
Comience su proceso de construcción:

```
ng serve
```
o
```
ng start
```

## Iniciar e instalar Laravel
Direccion de instalacion [Laravel Pages](https://laravel.com/docs/11.x/installation)
Corremos el siguiente codigo a la altura de la carpeta sistema, creamos el proyecto baseSistemaEmpleados 
```
composer create-project laravel/laravel baseSistemaEmpleados
```

Entramos a la carpeta baseSistemaEmpleados desde el cmd (para versiones más recientes):
```
php artisan make:command AppName
```

Una vez creado esto en su proyecto tendrá el AppName.php ahí se debe colocar todo el contenido que tenemos en AppName.php en este repositorio. Y correr el siguiente codigo:

```
php artisan app:name baseSistemaEmpleados
```
Modificar en el archivo baseSistemaEmpleados/app.php:
'debug' => (bool) env('APP_DEBUG', false), a 'debug' => (bool) env('APP_DEBUG', true),
'timezone' => env('APP_TIMEZONE', 'UTC'),	a	'timezone' => env('APP_TIMEZONE', 'America Latina/Lima'),

Finalmente corremos el servidor:
```
php artisan serve
```
## Modelo Lógico
[![Texto alternativo](./img/modelo_logico.png)](https://github.com/DiegoRivas12)
