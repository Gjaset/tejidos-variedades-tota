/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_group
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_group_permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`, `permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_permission
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`, `codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 73 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_user
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_user_groups
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`, `group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: auth_user_user_permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`, `permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cuenta_postt
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cuenta_postt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_postt_user_id_d3a0145e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cuenta_postt_user_id_d3a0145e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: django_admin_log
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: django_content_type
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`, `model`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: django_migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: django_session
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: facturas_detalle
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `facturas_detalle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_p` varchar(50) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `cantidad_detalle` int NOT NULL,
  `total` int NOT NULL,
  `precioX` int NOT NULL,
  `factura_id` bigint DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_detalle_factura_id_2b4976b9_fk_facturas_factura_id` (`factura_id`),
  KEY `facturas_detalle_producto_id_e0906d15_fk_productos_producto_id` (`producto_id`),
  CONSTRAINT `facturas_detalle_factura_id_2b4976b9_fk_facturas_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `facturas_factura` (`id`),
  CONSTRAINT `facturas_detalle_producto_id_e0906d15_fk_productos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: facturas_factura
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `facturas_factura` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipofactura` varchar(10) NOT NULL,
  `neto_pagar` int NOT NULL,
  `estado` varchar(10) NOT NULL,
  `decision` varchar(10) NOT NULL,
  `rol_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_factura_rol_id_6180f164_fk_usuarios_rol_Rid` (`rol_id`),
  KEY `facturas_factura_usuario_id_2269c3b8_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `facturas_factura_rol_id_6180f164_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`),
  CONSTRAINT `facturas_factura_usuario_id_2269c3b8_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gestion_backup
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gestion_backup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 55 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pago_detalle_pago
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pago_detalle_pago` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) NOT NULL,
  `valor` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `detalle_id` bigint DEFAULT NULL,
  `pago_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pago_detalle_pago_detalle_id_18612832_fk_facturas_detalle_id` (`detalle_id`),
  KEY `pago_detalle_pago_pago_id_dd0900a1_fk_pago_pago_id` (`pago_id`),
  CONSTRAINT `pago_detalle_pago_detalle_id_18612832_fk_facturas_detalle_id` FOREIGN KEY (`detalle_id`) REFERENCES `facturas_detalle` (`id`),
  CONSTRAINT `pago_detalle_pago_pago_id_dd0900a1_fk_pago_pago_id` FOREIGN KEY (`pago_id`) REFERENCES `pago_pago` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pago_pago
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pago_pago` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `neto_pagar` int NOT NULL,
  `estado` varchar(10) NOT NULL,
  `decision` varchar(10) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pago_pago_usuario_id_9af805af_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `pago_pago_usuario_id_9af805af_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: productos_color
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `productos_color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: productos_marca
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `productos_marca` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: productos_producto
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `productos_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  `precio` double NOT NULL,
  `precio_venta` double NOT NULL,
  `porcentaje` int NOT NULL,
  `valorPorcentaje` double NOT NULL,
  `estado` varchar(10) NOT NULL,
  `color_id` bigint DEFAULT NULL,
  `marca_id` bigint DEFAULT NULL,
  `rol_id` int DEFAULT NULL,
  `talla_id` bigint DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_producto_color_id_c45f44ec_fk_productos_color_id` (`color_id`),
  KEY `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` (`marca_id`),
  KEY `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` (`rol_id`),
  KEY `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` (`talla_id`),
  KEY `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `productos_producto_color_id_c45f44ec_fk_productos_color_id` FOREIGN KEY (`color_id`) REFERENCES `productos_color` (`id`),
  CONSTRAINT `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `productos_marca` (`id`),
  CONSTRAINT `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`),
  CONSTRAINT `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` FOREIGN KEY (`talla_id`) REFERENCES `productos_talla` (`id`),
  CONSTRAINT `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: productos_talla
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `productos_talla` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: usuarios_rol
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuarios_rol` (
  `Rid` int NOT NULL AUTO_INCREMENT,
  `Rnombre` varchar(12) NOT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: usuarios_usuario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuarios_usuario` (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `Unombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` int NOT NULL,
  `celular` varchar(13) NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `rol_id` int DEFAULT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `celular` (`celular`),
  KEY `usuarios_usuario_rol_id_b0d64932_fk_usuarios_rol_Rid` (`rol_id`),
  CONSTRAINT `usuarios_usuario_rol_id_b0d64932_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_group
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_group_permissions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_permission
# ------------------------------------------------------------

INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (5, 'Can add permission', 2, 'add_permission');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (6, 'Can change permission', 2, 'change_permission');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (8, 'Can view permission', 2, 'view_permission');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (9, 'Can add group', 3, 'add_group');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (10, 'Can change group', 3, 'change_group');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (11, 'Can delete group', 3, 'delete_group');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (12, 'Can view group', 3, 'view_group');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (13, 'Can add user', 4, 'add_user');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (14, 'Can change user', 4, 'change_user');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (15, 'Can delete user', 4, 'delete_user');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (16, 'Can view user', 4, 'view_user');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (
    18,
    'Can change content type',
    5,
    'change_contenttype'
  );
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (
    19,
    'Can delete content type',
    5,
    'delete_contenttype'
  );
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (21, 'Can add session', 6, 'add_session');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (22, 'Can change session', 6, 'change_session');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (23, 'Can delete session', 6, 'delete_session');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (24, 'Can view session', 6, 'view_session');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (25, 'Can add backup', 7, 'add_backup');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (26, 'Can change backup', 7, 'change_backup');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (27, 'Can delete backup', 7, 'delete_backup');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (28, 'Can view backup', 7, 'view_backup');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (29, 'Can add factura', 8, 'add_factura');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (30, 'Can change factura', 8, 'change_factura');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (31, 'Can delete factura', 8, 'delete_factura');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (32, 'Can view factura', 8, 'view_factura');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (33, 'Can add detalle', 9, 'add_detalle');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (34, 'Can change detalle', 9, 'change_detalle');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (35, 'Can delete detalle', 9, 'delete_detalle');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (36, 'Can view detalle', 9, 'view_detalle');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (37, 'Can add rol', 10, 'add_rol');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (38, 'Can change rol', 10, 'change_rol');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (39, 'Can delete rol', 10, 'delete_rol');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (40, 'Can view rol', 10, 'view_rol');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (41, 'Can add usuario', 11, 'add_usuario');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (42, 'Can change usuario', 11, 'change_usuario');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (43, 'Can delete usuario', 11, 'delete_usuario');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (44, 'Can view usuario', 11, 'view_usuario');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (45, 'Can add pago', 12, 'add_pago');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (46, 'Can change pago', 12, 'change_pago');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (47, 'Can delete pago', 12, 'delete_pago');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (48, 'Can view pago', 12, 'view_pago');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (49, 'Can add detalle_pago', 13, 'add_detalle_pago');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (
    50,
    'Can change detalle_pago',
    13,
    'change_detalle_pago'
  );
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (
    51,
    'Can delete detalle_pago',
    13,
    'delete_detalle_pago'
  );
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (
    52,
    'Can view detalle_pago',
    13,
    'view_detalle_pago'
  );
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (53, 'Can add color', 14, 'add_color');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (54, 'Can change color', 14, 'change_color');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (55, 'Can delete color', 14, 'delete_color');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (56, 'Can view color', 14, 'view_color');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (57, 'Can add marca', 15, 'add_marca');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (58, 'Can change marca', 15, 'change_marca');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (59, 'Can delete marca', 15, 'delete_marca');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (60, 'Can view marca', 15, 'view_marca');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (61, 'Can add talla', 16, 'add_talla');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (62, 'Can change talla', 16, 'change_talla');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (63, 'Can delete talla', 16, 'delete_talla');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (64, 'Can view talla', 16, 'view_talla');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (65, 'Can add producto', 17, 'add_producto');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (66, 'Can change producto', 17, 'change_producto');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (67, 'Can delete producto', 17, 'delete_producto');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (68, 'Can view producto', 17, 'view_producto');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (69, 'Can add postt', 18, 'add_postt');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (70, 'Can change postt', 18, 'change_postt');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (71, 'Can delete postt', 18, 'delete_postt');
INSERT INTO
  `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
  (72, 'Can view postt', 18, 'view_postt');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_user
# ------------------------------------------------------------

INSERT INTO
  `auth_user` (
    `id`,
    `password`,
    `last_login`,
    `is_superuser`,
    `username`,
    `first_name`,
    `last_name`,
    `email`,
    `is_staff`,
    `is_active`,
    `date_joined`
  )
VALUES
  (
    1,
    'pbkdf2_sha256$390000$ZZNza9cD1wl5YAF7zY2JIj$3M65OpNfcQLFskMymhmpP4JeGdEGAw0Pxx2KnJgVx6k=',
    '2022-09-29 01:50:16.581190',
    1,
    'admin',
    '',
    '',
    '',
    1,
    1,
    '2022-09-23 18:11:08.026585'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_user_groups
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: auth_user_user_permissions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cuenta_postt
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: django_admin_log
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: django_content_type
# ------------------------------------------------------------

INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (1, 'admin', 'logentry');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (3, 'auth', 'group');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (2, 'auth', 'permission');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (4, 'auth', 'user');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (5, 'contenttypes', 'contenttype');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (18, 'cuenta', 'postt');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (9, 'facturas', 'detalle');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (8, 'facturas', 'factura');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (7, 'gestion', 'backup');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (13, 'pago', 'detalle_pago');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (12, 'pago', 'pago');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (14, 'productos', 'color');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (15, 'productos', 'marca');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (17, 'productos', 'producto');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (16, 'productos', 'talla');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (6, 'sessions', 'session');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (10, 'usuarios', 'rol');
INSERT INTO
  `django_content_type` (`id`, `app_label`, `model`)
VALUES
  (11, 'usuarios', 'usuario');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: django_migrations
# ------------------------------------------------------------

INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    1,
    'contenttypes',
    '0001_initial',
    '2022-09-23 18:10:14.624899'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    2,
    'auth',
    '0001_initial',
    '2022-09-23 18:10:15.043510'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    3,
    'admin',
    '0001_initial',
    '2022-09-23 18:10:15.146730'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    4,
    'admin',
    '0002_logentry_remove_auto_add',
    '2022-09-23 18:10:15.154934'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    5,
    'admin',
    '0003_logentry_add_action_flag_choices',
    '2022-09-23 18:10:15.163026'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    6,
    'contenttypes',
    '0002_remove_content_type_name',
    '2022-09-23 18:10:15.219122'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    7,
    'auth',
    '0002_alter_permission_name_max_length',
    '2022-09-23 18:10:15.261190'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    8,
    'auth',
    '0003_alter_user_email_max_length',
    '2022-09-23 18:10:15.283099'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    9,
    'auth',
    '0004_alter_user_username_opts',
    '2022-09-23 18:10:15.292073'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    10,
    'auth',
    '0005_alter_user_last_login_null',
    '2022-09-23 18:10:15.335627'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    11,
    'auth',
    '0006_require_contenttypes_0002',
    '2022-09-23 18:10:15.339645'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    12,
    'auth',
    '0007_alter_validators_add_error_messages',
    '2022-09-23 18:10:15.347059'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    13,
    'auth',
    '0008_alter_user_username_max_length',
    '2022-09-23 18:10:15.392054'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    14,
    'auth',
    '0009_alter_user_last_name_max_length',
    '2022-09-23 18:10:15.435921'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    15,
    'auth',
    '0010_alter_group_name_max_length',
    '2022-09-23 18:10:15.453904'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    16,
    'auth',
    '0011_update_proxy_permissions',
    '2022-09-23 18:10:15.461850'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    17,
    'auth',
    '0012_alter_user_first_name_max_length',
    '2022-09-23 18:10:15.510105'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    18,
    'cuenta',
    '0001_initial',
    '2022-09-23 18:10:15.558916'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    19,
    'usuarios',
    '0001_initial',
    '2022-09-23 18:10:15.634817'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    20,
    'productos',
    '0001_initial',
    '2022-09-23 18:10:15.902708'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    21,
    'facturas',
    '0001_initial',
    '2022-09-23 18:10:16.072463'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    22,
    'gestion',
    '0001_initial',
    '2022-09-23 18:10:16.088161'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    23,
    'pago',
    '0001_initial',
    '2022-09-23 18:10:16.216351'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    24,
    'sessions',
    '0001_initial',
    '2022-09-23 18:10:16.243106'
  );
INSERT INTO
  `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
  (
    25,
    'gestion',
    '0002_alter_backup_archivo',
    '2022-09-28 19:10:42.711290'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: django_session
# ------------------------------------------------------------

INSERT INTO
  `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
  (
    'c4e111tcpcwgm3wyzrji9fuelshvtwsp',
    '.eJxVjE0OgjAYRO_StWlKC6V16Z4zNN9fLWogobAy3l1IWOhuMu_NvFWCbS1pq7KkkdVVNery2yHQU6YD8AOm-6xpntZlRH0o-qRVDzPL63a6fwcFatnXPlvMsSd0NmO_RyCIRN52zjRRQrQtcyahVgAleA6mQ_S5NSTOcVCfLxsqOV4:1odigq:z25ehGK0mjKFufbkif7-RuxHHLv9OKmwMVr6Cml5nLU',
    '2022-10-13 01:50:16.586178'
  );
INSERT INTO
  `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
  (
    'dp0hri1t2sq6dka8ul6kxa57qx4low7o',
    '.eJxVjE0OgjAYRO_StWlKC6V16Z4zNN9fLWogobAy3l1IWOhuMu_NvFWCbS1pq7KkkdVVNery2yHQU6YD8AOm-6xpntZlRH0o-qRVDzPL63a6fwcFatnXPlvMsSd0NmO_RyCIRN52zjRRQrQtcyahVgAleA6mQ_S5NSTOcVCfLxsqOV4:1odiGW:Q-3YfI4Uswrm-wnjAZkssXmL2UIV3kvbcV4je1thUb0',
    '2022-10-13 01:23:04.783785'
  );
INSERT INTO
  `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
  (
    'wxx4b4h7dtuyf60okh4q5klm173xf1yc',
    '.eJxVjE0OgjAYRO_StWlKC6V16Z4zNN9fLWogobAy3l1IWOhuMu_NvFWCbS1pq7KkkdVVNery2yHQU6YD8AOm-6xpntZlRH0o-qRVDzPL63a6fwcFatnXPlvMsSd0NmO_RyCIRN52zjRRQrQtcyahVgAleA6mQ_S5NSTOcVCfLxsqOV4:1obz1O:shQ9cqAoVW9vz77t0zd-TXWuXZeSBRW1n7sQ_VGUgvw',
    '2022-10-08 06:52:18.619901'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: facturas_detalle
# ------------------------------------------------------------

INSERT INTO
  `facturas_detalle` (
    `id`,
    `nombre_p`,
    `estado`,
    `cantidad_detalle`,
    `total`,
    `precioX`,
    `factura_id`,
    `producto_id`
  )
VALUES
  (1, 'Pantalon', 'Abierta', 10, 432000, 43200, 1, 1);
INSERT INTO
  `facturas_detalle` (
    `id`,
    `nombre_p`,
    `estado`,
    `cantidad_detalle`,
    `total`,
    `precioX`,
    `factura_id`,
    `producto_id`
  )
VALUES
  (2, 'Pantalon', 'Abierta', 14, 604800, 43200, 2, 1);
INSERT INTO
  `facturas_detalle` (
    `id`,
    `nombre_p`,
    `estado`,
    `cantidad_detalle`,
    `total`,
    `precioX`,
    `factura_id`,
    `producto_id`
  )
VALUES
  (3, 'Pantalon', 'Abierta', 14, 448000, 32000, 3, 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: facturas_factura
# ------------------------------------------------------------

INSERT INTO
  `facturas_factura` (
    `id`,
    `fecha`,
    `tipofactura`,
    `neto_pagar`,
    `estado`,
    `decision`,
    `rol_id`,
    `usuario_id`
  )
VALUES
  (
    1,
    '2022-09-26',
    'Venta',
    432000,
    'Anulada',
    'Inactivo',
    2,
    2
  );
INSERT INTO
  `facturas_factura` (
    `id`,
    `fecha`,
    `tipofactura`,
    `neto_pagar`,
    `estado`,
    `decision`,
    `rol_id`,
    `usuario_id`
  )
VALUES
  (
    2,
    '2022-09-28',
    'Venta',
    604800,
    'Anulada',
    'Inactivo',
    2,
    2
  );
INSERT INTO
  `facturas_factura` (
    `id`,
    `fecha`,
    `tipofactura`,
    `neto_pagar`,
    `estado`,
    `decision`,
    `rol_id`,
    `usuario_id`
  )
VALUES
  (
    3,
    '2022-09-28',
    'Compra',
    448000,
    'Anulada',
    'Inactivo',
    3,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gestion_backup
# ------------------------------------------------------------

INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    1,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_1.sql',
    '2022-09-28 18:51:39.617988'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    2,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_1_rhoehZn.sql',
    '2022-09-28 18:52:04.600822'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    3,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_1_PAJOxNv.sql',
    '2022-09-28 18:53:08.546125'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    4,
    'Copia de Seguridad',
    'backup/Copia_de_seguridad_usuarios_usuario_2022-09-28.sql',
    '2022-09-28 18:54:31.714409'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    5,
    'Copia de Seguridad',
    'backup/Copia_de_seguridad_productos_producto_2022-09-28.sql',
    '2022-09-28 19:03:09.316413'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    6,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_.sql',
    '2022-09-28 19:04:56.888452'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    7,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28__NYukPYc.sql',
    '2022-09-28 19:05:51.150683'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    8,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_1.sql',
    '2022-09-28 19:07:25.783305'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    9,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28__7fxMAyg.sql',
    '2022-09-28 19:07:59.291920'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    10,
    'Copia de Seguridad',
    'backup/db_tejidos_2022_09_28_.sql',
    '2022-09-28 19:09:40.319853'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    11,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-28 19:10:59.723796'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    12,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-28 19:11:36.552046'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    13,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28.sql',
    '2022-09-28 19:11:53.012797'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    14,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_4I5qOwe.sql',
    '2022-09-28 19:13:53.941220'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    15,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_ySRZoNS.sql',
    '2022-09-28 19:15:52.031259'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    16,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_41LPmiX.sql',
    '2022-09-28 19:16:50.531501'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    17,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_pcEZtLY.sql',
    '2022-09-28 19:21:47.084528'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    18,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_uWRxLLm.sql',
    '2022-09-28 19:23:48.263361'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    19,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-281.sql',
    '2022-09-28 19:24:38.078242'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    20,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-28.sql',
    '2022-09-28 19:24:56.317686'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    21,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-281_dmuvNpJ.sql',
    '2022-09-28 19:25:10.678338'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    22,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282.sql',
    '2022-09-28 19:26:29.304423'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    23,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282_zOPMs3J.sql',
    '2022-09-28 19:27:06.430781'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    24,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282_s4gpnnA.sql',
    '2022-09-28 19:30:01.794056'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    25,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282_iWUYbn8.sql',
    '2022-09-28 19:30:34.475825'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    26,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282_VrBlDYj.sql',
    '2022-09-28 19:31:07.166096'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    27,
    'Copia de Seguridad',
    'Copia_de_seguridad_productos_producto_2022-09-28_u0kOJeP.sql',
    '2022-09-28 19:31:49.013871'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    28,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-282_uXQCIqD.sql',
    '2022-09-28 19:32:06.995387'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    29,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-28.sql',
    '2022-09-28 19:33:12.110072'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    30,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-28_bH0ikxL.sql',
    '2022-09-28 19:33:30.998082'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    31,
    'Copia de Seguridad',
    'Copia_de_seguridad_facturas_factura_2022-09-28.sql',
    '2022-09-28 19:37:56.468623'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    32,
    'Copia de Seguridad',
    'Copia_de_seguridad_facturas_factura_2022-09-28_aGjFxca.sql',
    '2022-09-28 19:41:07.979520'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    33,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 01:39:34.016951'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    34,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__FuJK6V6.sql',
    '2022-09-29 01:39:38.369192'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    35,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__7QLRAtc.sql',
    '2022-09-29 01:39:51.788229'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    36,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__ZrR9lJ7.sql',
    '2022-09-29 01:40:40.262080'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    37,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 01:42:27.483496'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    38,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__ED653rl.sql',
    '2022-09-29 01:44:15.068580'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    39,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 01:46:49.110003'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    40,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__hMqaCLg.sql',
    '2022-09-29 01:49:10.686074'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    41,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 01:49:56.797081'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    42,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__1Sspfib.sql',
    '2022-09-29 01:50:39.116889'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    43,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 01:51:34.486082'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    44,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__jbhYFOH.sql',
    '2022-09-29 01:52:23.237163'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    45,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__1DaDN1b.sql',
    '2022-09-29 01:55:42.150474'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    46,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__3hVBL5I.sql',
    '2022-09-29 01:57:01.871009'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    47,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__2HYUBBD.sql',
    '2022-09-29 02:03:05.596770'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    48,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 02:04:13.576647'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    49,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__gI1Pvq9.sql',
    '2022-09-29 02:07:57.007105'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    50,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28__1fAPPXE.sql',
    '2022-09-29 02:09:29.545956'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    51,
    'prueba',
    'db_tejidos_2022_09_28__92ilYS0.sql',
    '2022-09-29 02:10:19.977251'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    52,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-28.sql',
    '2022-09-29 02:12:46.653422'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    53,
    'Copia de Seguridad',
    'Copia_de_seguridad_usuarios_usuario_2022-09-281.sql',
    '2022-09-29 02:13:25.785615'
  );
INSERT INTO
  `gestion_backup` (`id`, `nombre`, `archivo`, `fecha`)
VALUES
  (
    54,
    'Copia de Seguridad',
    'db_tejidos_2022_09_28_.sql',
    '2022-09-29 02:16:41.762063'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: pago_detalle_pago
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: pago_pago
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: productos_color
# ------------------------------------------------------------

INSERT INTO
  `productos_color` (`id`, `nombre`, `estado`)
VALUES
  (1, 'Rojo', 'Activo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: productos_marca
# ------------------------------------------------------------

INSERT INTO
  `productos_marca` (`id`, `nombre`, `estado`)
VALUES
  (1, 'Addidas', 'Activo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: productos_producto
# ------------------------------------------------------------

INSERT INTO
  `productos_producto` (
    `id`,
    `categoria`,
    `nombre`,
    `stock`,
    `precio`,
    `precio_venta`,
    `porcentaje`,
    `valorPorcentaje`,
    `estado`,
    `color_id`,
    `marca_id`,
    `rol_id`,
    `talla_id`,
    `usuario_id`
  )
VALUES
  (
    1,
    'Ropa',
    'Pantalon',
    50,
    32000,
    43200,
    35,
    11200,
    'Inactivo',
    1,
    1,
    3,
    1,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: productos_talla
# ------------------------------------------------------------

INSERT INTO
  `productos_talla` (`id`, `nombre`, `estado`)
VALUES
  (1, 'S', 'Activo');
INSERT INTO
  `productos_talla` (`id`, `nombre`, `estado`)
VALUES
  (2, 'M', 'Activo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: usuarios_rol
# ------------------------------------------------------------

INSERT INTO
  `usuarios_rol` (`Rid`, `Rnombre`)
VALUES
  (1, 'Asociada');
INSERT INTO
  `usuarios_rol` (`Rid`, `Rnombre`)
VALUES
  (2, 'Cliente');
INSERT INTO
  `usuarios_rol` (`Rid`, `Rnombre`)
VALUES
  (3, 'Proveedor');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: usuarios_usuario
# ------------------------------------------------------------

INSERT INTO
  `usuarios_usuario` (
    `Uid`,
    `Unombre`,
    `apellido`,
    `documento`,
    `celular`,
    `tipo_documento`,
    `estado`,
    `rol_id`
  )
VALUES
  (
    1,
    'Sebastian',
    'Rodriguez',
    435646,
    '576877',
    'C.C',
    'Inactivo',
    3
  );
INSERT INTO
  `usuarios_usuario` (
    `Uid`,
    `Unombre`,
    `apellido`,
    `documento`,
    `celular`,
    `tipo_documento`,
    `estado`,
    `rol_id`
  )
VALUES
  (
    2,
    'Eliana',
    'Rodriguez',
    798746564,
    '5645641231',
    'C.C',
    'Inactivo',
    2
  );
INSERT INTO
  `usuarios_usuario` (
    `Uid`,
    `Unombre`,
    `apellido`,
    `documento`,
    `celular`,
    `tipo_documento`,
    `estado`,
    `rol_id`
  )
VALUES
  (
    3,
    'Asdasd',
    'Djksdfjkfsdjk',
    2944141,
    '45544445245',
    'C.C',
    'Activo',
    2
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
