import { Component,OnChanges,OnDestroy,OnInit, SimpleChanges } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common'; // Importa CommonModule
//import {MatFormFieldModule} from '@angular/material/form-field';
interface Food {
  value: string;
  viewValue: string;
}
interface usuario{
  id: string;
  nombre: string;
  correo: string;
  rol: string;
}
interface HousingLocation {
  id: number;
  name: string;
  city: string;
  state: string;
  photo: string; // Tipo de dato string para la URL de la foto
  availableUnits: number;
  wifi: boolean;
  laundry: boolean;
}
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule, FormsModule], //imports: [RouterOutlet,MatFormFieldModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  
})

export class AppComponent implements OnChanges,OnInit, OnDestroy {
  title = 'sistema';
  cities = ['barcelona','Madrid','Lima'];
  name!: string;
  usuarioSeleccionado: any;
  losUsuarios!: usuario[];
  constructor() { }
  usuarios: usuario[] = [
    { id: "1", nombre: 'Usuario 1', correo: 'usuario1@example.com', rol: 'Administrador' },
    { id: "2", nombre: 'Usuario 2', correo: 'usuario2@example.com', rol: 'Usuario' },
    { id: "3", nombre: 'Usuario 3', correo: 'usuario3@example.com', rol: 'Usuario' },
    { id: "4", nombre: 'Usuario 4', correo: 'usuario4@example.com', rol: 'Usuario' },
    { id: "5", nombre: 'Usuario 5', correo: 'usuario5@example.com', rol: 'Usuario' }
  ];
  // Método para mostrar los detalles del usuario seleccionado
  seleccionarUsuario(id: string) {
    this.usuarioSeleccionado = this.usuarios.find(usuario => usuario.id === id);
  }

  ngOnChanges(changes: SimpleChanges): void {
    console.log('Change -->', changes)
  }

  ngOnInit(): void {
    this.cargarUsuarios();
  }
  ngOnDestroy(): void {
    console.log('Destroy');
  }

  cargarUsuarios(): void {
    this.losUsuarios  = this.usuarios;
    
  }
  
};



/*
import { Component,OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common'; // Importa CommonModule
//import {MatFormFieldModule} from '@angular/material/form-field';
interface Food {
  value: string;
  viewValue: string;
}
interface usuario{
  id: string;
  nombre: string;
  correo: string;
  rol: string;
}
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule], //imports: [RouterOutlet,MatFormFieldModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  
})

export class AppComponent {
  title = 'sistema';
  
  usuarios = [
    { id: "1", nombre: 'Usuario 1', correo: 'usuario1@example.com', rol: 'Administrador' },
    { id: "2", nombre: 'Usuario 2', correo: 'usuario2@example.com', rol: 'Usuario' },
    { id: "3", nombre: 'Usuario 3', correo: 'usuario3@example.com', rol: 'Usuario' },
    { id: "4", nombre: 'Usuario 4', correo: 'usuario4@example.com', rol: 'Usuario' },
    { id: "5", nombre: 'Usuario 5', correo: 'usuario5@example.com', rol: 'Usuario' }
  ];
   

  usuarioSeleccionado: any;
  losUsuarios: any;
  constructor() { }

  // Método para mostrar los detalles del usuario seleccionado
  seleccionarUsuario(id: string) {
    this.usuarioSeleccionado = this.usuarios.find(usuario => usuario.id === id);
  }
  foods: Food[] = [
    {value: 'steak-0', viewValue: 'Steak'},
    {value: 'pizza-1', viewValue: 'Pizza'},
    {value: 'tacos-2', viewValue: 'Tacos'},
  ];

  selectedTeam = '';
	onSelected(value:string): void {
		this.selectedTeam = value;
	}

  usuarios: usuario[] = [
    { id: "1", nombre: 'Usuario 1', correo: 'usuario1@example.com', rol: 'Administrador' },
    { id: "2", nombre: 'Usuario 2', correo: 'usuario2@example.com', rol: 'Usuario' },
    { id: "3", nombre: 'Usuario 3', correo: 'usuario3@example.com', rol: 'Usuario' },
    { id: "4", nombre: 'Usuario 4', correo: 'usuario4@example.com', rol: 'Usuario' },
    { id: "5", nombre: 'Usuario 5', correo: 'usuario5@example.com', rol: 'Usuario' }
  ]

  ngOnInit(): void {
    this.cargarUsuarios();
  }

  cargarUsuarios(): void {
    this.losUsuarios  = this.usuarios;
    
  }
  
}



*/