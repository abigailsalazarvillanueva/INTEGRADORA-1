CREATE DATABASE IF NOT EXISTS estacionamiento;
USE estacionamiento;

-- Tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    TipoUsuario ENUM('Empleado', 'Estudiante', 'Profesor') NOT NULL
);

-- Tabla Rol
CREATE TABLE Rol (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(50) NOT NULL
);

-- Tabla Empleado
CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    idRol INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idRol) REFERENCES Rol(idRol)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    idAdministrador INT AUTO_INCREMENT PRIMARY KEY,
    idEmpleado INT NOT NULL,
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Tabla Estudiante
CREATE TABLE Estudiante (
    idEstudiante INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    Carrera VARCHAR(50) NOT NULL,
    NumeroControlEscolar VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Profesor
CREATE TABLE Profesor (
    idProfesor INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    Departamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);



-- Tabla Permiso
CREATE TABLE Permiso (
    idPermiso INT AUTO_INCREMENT PRIMARY KEY,
    NombrePermiso VARCHAR(50) NOT NULL
);

-- Tabla RolPermiso
CREATE TABLE RolPermiso (
    idRol INT NOT NULL,
    idPermiso INT NOT NULL,
    PRIMARY KEY (idRol, idPermiso),
    FOREIGN KEY (idRol) REFERENCES Rol(idRol),
    FOREIGN KEY (idPermiso) REFERENCES Permiso(idPermiso)
);

-- Tabla Sesion
CREATE TABLE Sesion (
    idSesion INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    FechaHoraInicio DATETIME NOT NULL,
    FechaHoraFin DATETIME,
    DireccionIP VARCHAR(45) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Reclamacion
CREATE TABLE Reclamacion (
    idReclamacion INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Comentarios TEXT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Reporte
CREATE TABLE Reporte (
    idReporte INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    Fecha DATE NOT NULL,
    Contenido TEXT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Notificacion
CREATE TABLE Notificacion (
    idNotificacion INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    Mensaje TEXT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Politica
CREATE TABLE Politica (
    idPolitica INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion TEXT NOT NULL,
    FechaActualizacion DATE NOT NULL
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    idVehiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) UNIQUE NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

-- Tabla EntradaSalida
CREATE TABLE EntradaSalida (
    idEntradaSalida INT AUTO_INCREMENT PRIMARY KEY,
    idVehiculo INT NOT NULL,
    idUsuario INT NOT NULL,
    HoraEntrada DATETIME NOT NULL,
    HoraSalida DATETIME,
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);