/*
Navicat MySQL Data Transfer

Source Server         : School7
Source Server Version : 50627
Source Host           : ny-client-2.clpvrgpbxg45.us-east-1.rds.amazonaws.com:3306
Source Database       : s

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-07-23 01:02:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for _template
-- ----------------------------
DROP TABLE IF EXISTS `_template`;
CREATE TABLE `_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _template
-- ----------------------------

-- ----------------------------
-- Table structure for _template_linktable
-- ----------------------------
DROP TABLE IF EXISTS `_template_linktable`;
CREATE TABLE `_template_linktable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of _template_linktable
-- ----------------------------

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('100', 'Arturo', 'arturo', 'arturo', 'de los Angeles');
INSERT INTO `admins` VALUES ('2', 'Jose', 'arturo', 'salgado', null);
INSERT INTO `admins` VALUES ('3', 'Pio', 'arturo', 'angeles', null);
INSERT INTO `admins` VALUES ('4', null, 'arturo@java.com', 'myrna101', null);
INSERT INTO `admins` VALUES ('5', null, 'mahetzi', 'mahetzi', null);
INSERT INTO `admins` VALUES ('6', null, 'colegio@gmail.com', 'myrna101', null);
INSERT INTO `admins` VALUES ('1001', null, 'belly', 'belly', 'de los angeles');
INSERT INTO `admins` VALUES ('1002', 'David', '', '', null);
INSERT INTO `admins` VALUES ('1003', 'Margarita', 'ecuses@gmail.com', 'myrna101', 'trujillo');
INSERT INTO `admins` VALUES ('1004', 'javier', 'arturodelosangeles@live.com', 'myrna101', 'lopez');
INSERT INTO `admins` VALUES ('1005', 'Felipe', 'mozartstein@gmail.com', 'myrna101', 'de los Angeles');

-- ----------------------------
-- Table structure for admins_schools
-- ----------------------------
DROP TABLE IF EXISTS `admins_schools`;
CREATE TABLE `admins_schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admins_schools
-- ----------------------------
INSERT INTO `admins_schools` VALUES ('1', '1', '100');
INSERT INTO `admins_schools` VALUES ('2', '1', '1002');
INSERT INTO `admins_schools` VALUES ('3', '9', '1003');
INSERT INTO `admins_schools` VALUES ('4', '10', '1004');
INSERT INTO `admins_schools` VALUES ('5', '11', '1005');

-- ----------------------------
-- Table structure for algorithms
-- ----------------------------
DROP TABLE IF EXISTS `algorithms`;
CREATE TABLE `algorithms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `school_id` int(11) DEFAULT '1',
  `code` text,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of algorithms
-- ----------------------------
INSERT INTO `algorithms` VALUES ('1', 'has chars repeated', 'el chiste es que el arreglo de boleanos le caben los 128 ascii chars, including alphabet ', '1', 'static bool charsRepeated(string s) {\n            if (s.Length > 128)\n                return true;\n            else {\n                bool []chars = new bool[128];\n                for (int i = 0; i < s.Length; i++) {\n                    int t = s[i];  // get the integer representation of the number \n\n                    if (chars[t])\n                        return true;\n                    else\n                        chars[t] = true;\n                }\n\n            }\n            return false;\n        }', 'ccca.jpg');
INSERT INTO `algorithms` VALUES ('2', 'check permutation', 'sort the two arrays \nshould be equal . String size should be the same', '1', 'static bool isPermutation(string s1,string s2)\n	{\n		if (s1.Length != s2.Length)\n		{\n			return false;\n		}\n		else {\n\n			char[] c1 = s1.ToCharArray();\n			char[] c2 = s2.ToCharArray();\n			Array.Sort(c1);\n			Array.Sort(c2);\n			// check  manually as Equals method \n			//compares reference and not content\n			for (int i = 0; i< c1.Length; i++) {\n				if (c1[i] != c2[i]) {\n					return false;\n				}\n			}\n\n\n		}\n		return true;\n	}', null);
INSERT INTO `algorithms` VALUES ('3', 'check permutation', 'check if the number of \nchar is the same first pass, an array is created , each cell has   the key as the char, and the number of times it has been seen, second pass the key is rested the apperqnces. If the same, chars mus be zero in the array. If some goes  elow zero, break as false\n', '1', ' static bool isPermutation2(string s1, string s2) {\n\n            if (s1.Length != s2.Length) {\n                return false;\n            }\n            int []letters = new int[128];\n            for (int i = 0; i < s1.Length; i++) {\n                int temp = s1[i];\n                letters[temp]++;\n            }\n           \n            for (int i = 0; i < s2.Length; i++)\n            {\n                int temp = s2[i];\n                letters[temp]--;\n                if (letters[temp] < 0)\n                    return false;\n            }\n\n            return true;\n        }', 'per2.fw_.png');
INSERT INTO `algorithms` VALUES ('4', 'Palindrome Permutation?', 'Hash the number of chars, must be even for all except, at the most for 1', '1', '  static bool isPalPer(string s) {\n            Dictionary<char, int> dict = new Dictionary<char, int>();\n            for (int i = 0; i < s.Length; i++) {\n\n                char t = s[i];\n               // Console.Write((int)t);\n                int T = (int)t;\n                if (  !((T>=65 && T<= 90) || (T>=97 && T<=122)) )\n                    continue;\n                //Console.ReadKey();\n                if (dict.ContainsKey(t))\n                {\n                    dict[t]++;\n                }\n                else {\n                    dict.Add(t,1);\n                }\n            }\n            bool odd = false;\n            foreach (KeyValuePair<char,int> t in dict) {\n                if (t.Value % 2!=0) {\n\n                    if (odd == true)\n                        return false;\n                    else {\n                        odd = true;     \n                    }\n                }\n            }\n            return true;\n        }', 'isPalPer.fw_.png');

-- ----------------------------
-- Table structure for alumnoestadoes
-- ----------------------------
DROP TABLE IF EXISTS `alumnoestadoes`;
CREATE TABLE `alumnoestadoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alumnoestadoes
-- ----------------------------
INSERT INTO `alumnoestadoes` VALUES ('1', 'Activo');
INSERT INTO `alumnoestadoes` VALUES ('2', 'Baja');
INSERT INTO `alumnoestadoes` VALUES ('3', 'Baja Temporal');
INSERT INTO `alumnoestadoes` VALUES ('4', 'Baja Definitiva');
INSERT INTO `alumnoestadoes` VALUES ('5', 'Pasante');
INSERT INTO `alumnoestadoes` VALUES ('6', 'Graduado');

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES ('1', '2017-06-24 22:24:08', null, '1', null, '14', null);
INSERT INTO `attendances` VALUES ('2', '2017-06-24 22:24:11', null, '1', null, '14', null);
INSERT INTO `attendances` VALUES ('3', '2017-06-24 22:24:17', null, '1', null, '13', null);

-- ----------------------------
-- Table structure for attendances_students
-- ----------------------------
DROP TABLE IF EXISTS `attendances_students`;
CREATE TABLE `attendances_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` int(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendances_students
-- ----------------------------

-- ----------------------------
-- Table structure for bloods
-- ----------------------------
DROP TABLE IF EXISTS `bloods`;
CREATE TABLE `bloods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bloods
-- ----------------------------
INSERT INTO `bloods` VALUES ('1', 'A');
INSERT INTO `bloods` VALUES ('2', 'O');
INSERT INTO `bloods` VALUES ('3', 'AB');

-- ----------------------------
-- Table structure for changes
-- ----------------------------
DROP TABLE IF EXISTS `changes`;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  `project_id` tinyint(4) DEFAULT NULL,
  `client_id` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of changes
-- ----------------------------
INSERT INTO `changes` VALUES ('14', 'keep images of system changes over time, functionality', 'changehistpry.jpg', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('15', 'CALENDAR', 'Untitled-2.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('16', 'CALENDAR CLOSE MODAL', 'Untitled-3.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('17', 'alumnos', 'Untitled-4.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('18', 'edit alumnos - students', 'edit.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('19', 'grupos', 'grupos.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('20', 'grupos edit', 'grupos-edit.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('21', 'grupos', 'grupos.fw_1.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('22', 'Horarios', 'horarios.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('23', 'alumnos', 'alumnos.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('24', 'alumnos', 'alumnos.fw_1.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('25', 'alumnos', 'alumnos.fw_2.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('26', 'docentes', null, '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('27', 'docentes-1_qwaweweae', 'docentes444.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('28', 'grupos list', 'grupos_list.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('29', 'grupos edit', null, '2017-07-01 01:13:11', '2017-07-01 01:13:11', null, '0', null, '1');
INSERT INTO `changes` VALUES ('30', 'grupos edit ', 'gruopos_Edit.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('31', 'groups, alumnos come by ajax', 'gruposajax.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('32', 'students layout', 'alumnos_new.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('33', 'price table -- front page', 'price_Table.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('34', 'groups alumnos with image', null, '2017-07-01 01:13:11', '2017-07-01 01:13:11', null, '0', null, '1');
INSERT INTO `changes` VALUES ('35', 'grups image alumno', 'groups.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('36', 'studentes delete, also set student in table , but reverted back', 'studentes_delete.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('37', 'images cropt to fit , groups work as expected, meiang ajax search and selec and de select', 'groups.fw_1.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('38', 'horarios', null, '2017-07-01 01:13:11', '2017-07-01 01:13:11', null, '0', null, '1');
INSERT INTO `changes` VALUES ('39', 'Horarios list', 'horarios-list.fw_.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('40', 'Horarios form', 'Horarios-Sep.fw_1.png', '2017-07-01 01:13:11', '2017-07-01 01:13:11', '1', '0', null, '1');
INSERT INTO `changes` VALUES ('41', 'Given Opt Intelligence required to change the API call format, and given we cannot pass special chars over the URL, I created a functionality to generate a random secure password', 'password.fw_.png', '2017-07-01 01:22:20', '0000-00-00 00:00:00', '1', '0', null, '2');

-- ----------------------------
-- Table structure for codes
-- ----------------------------
DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT '1',
  `code` text,
  `js` text,
  `css` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of codes
-- ----------------------------
INSERT INTO `codes` VALUES ('1', 'session helper\nadd file in helpers called session_helper\nget me the school or any must parameter, if not\ntake me to the login page, pass the dir, so it logs to the correct login page', '0', '2017-07-06 05:39:43', '2017-07-05 22:39:43', '1', 'function getschoolid($dir = \'admin\'){\n    \n    if (empty($_SESSION[\'school_id\'])){\n        redirect($dir.\"/log/in\");\n    }\n    else{\n        \n        return $_SESSION[\'school_id\'];\n    }\n    \n}', '', '');
INSERT INTO `codes` VALUES ('2', 'add instance with record id \nwhen passed to the script ', '0', '2017-07-05 22:37:45', '2017-07-05 22:37:45', '1', '//case form in params \n\nif (!empty($params[\'id\']))\n                {\n                    //echo \"id is {$params[\'id\']}\";\n                    $this->id= $params[\'id\'];\n                    $this->record = new $this->modelName($params[\'id\']);\n                    \n                }', '', '');

-- ----------------------------
-- Table structure for components
-- ----------------------------
DROP TABLE IF EXISTS `components`;
CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` enum('row','div','input','textarea','email','select','radio','label','file','password','number') DEFAULT NULL,
  `visible` enum('1','0') DEFAULT '1',
  `extra` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `editable` enum('1','0') DEFAULT '1',
  `ordering` float(11,2) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `select_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of components
-- ----------------------------
INSERT INTO `components` VALUES ('1', 'enrollment', 'Matricula', 'input', '1', 'class=\'form-control\'', null, '1', '1.00', '', null);
INSERT INTO `components` VALUES ('2', 'last_name', 'Apellido Paterno', 'input', '1', 'class=\'form-control\'', null, '1', '2.00', '', null);
INSERT INTO `components` VALUES ('3', 'second_last_name', 'Apellido Materno', 'input', '1', 'class=\'form-control\'', null, '1', '3.00', '', null);
INSERT INTO `components` VALUES ('4', 'name', 'Nombre(s)', 'input', '1', 'class=\'form-control\' required', null, '1', '4.00', '', null);
INSERT INTO `components` VALUES ('5', 'email', 'Correo Electronico', 'email', '1', 'class=\'form-control\' required', null, '1', '5.00', '', null);
INSERT INTO `components` VALUES ('6', 'password', 'Contraseña', 'password', '1', 'class=\'form-control\' id=\'pass-input\'', null, '1', '7.00', '', null);
INSERT INTO `components` VALUES ('7', 'blood_id', 'Tipo de Sangre', 'select', '1', 'class=\'form-control\'', null, '1', '8.00', '', 'Blood::getSelectTypes');
INSERT INTO `components` VALUES ('8', 'curp', 'CURP', 'input', '1', 'class=\'form-control\'', null, '1', '9.00', '', null);
INSERT INTO `components` VALUES ('9', 'tutor', 'Nombre Padre/Tutor/Emergencias', 'input', '1', 'class=\'form-control\'', null, '1', '100.00', '', null);
INSERT INTO `components` VALUES ('10', 'phone', 'Telefono', 'input', '1', 'class=\'form-control\'', null, '1', '11.00', '', null);
INSERT INTO `components` VALUES ('11', 'mobile', 'Celular', 'input', '1', 'class=\'form-control\'', null, '1', '11.00', '', null);
INSERT INTO `components` VALUES ('12', 'address', 'Dirección', 'textarea', '1', 'class=\'form-control\' style=\'height:90px\'', null, '1', '11.00', '', null);
INSERT INTO `components` VALUES ('13', 'gender_id', 'Genero', 'select', '1', 'class=\'form-control\'', null, '1', '8.00', '', 'Gender::getSelect');
INSERT INTO `components` VALUES ('14', 'file', 'Foto', 'file', '1', 'class=\'form-control\'', null, '1', '12.00', null, null);
INSERT INTO `components` VALUES ('15', 'cel_em', 'Celular Padre/Tutor/Emergencias', 'input', '1', 'class=\'form-control\'', null, '1', '102.00', null, null);
INSERT INTO `components` VALUES ('16', 'tel_em', 'Telefono Padre/Tutor/Emergencia', 'input', '1', 'class=\'form-control\'', null, '1', '103.00', null, null);
INSERT INTO `components` VALUES ('17', 'alumnoestado_id', 'Status', 'select', '1', 'class=\'form-control\'', null, '1', '0.50', null, 'Alumnoestado::getSelect');
INSERT INTO `components` VALUES ('18', 'email_em', 'Email Padre/Tutor/Emergencia', 'input', '1', 'class=\'form-control\'', null, '1', '101.00', null, null);
INSERT INTO `components` VALUES ('19', 'dob', 'Fecha de Nacimiento', null, '1', 'class=\'form-control\'', null, '1', '7.50', null, null);

-- ----------------------------
-- Table structure for components_components
-- ----------------------------
DROP TABLE IF EXISTS `components_components`;
CREATE TABLE `components_components` (
  `id` int(11) NOT NULL,
  `component_id` int(11) DEFAULT NULL,
  `related_component_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of components_components
-- ----------------------------

-- ----------------------------
-- Table structure for components_copy
-- ----------------------------
DROP TABLE IF EXISTS `components_copy`;
CREATE TABLE `components_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` enum('row','div','input','textarea','email','select','radio','label','file','password','number') DEFAULT NULL,
  `visible` enum('1','0') DEFAULT '1',
  `extra` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `editable` enum('1','0') DEFAULT '1',
  `ordering` float(11,2) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of components_copy
-- ----------------------------
INSERT INTO `components_copy` VALUES ('1', 'name', 'Nombre', 'input', '1', 'class=\'form-control\'', null, '1', '3.00', null);
INSERT INTO `components_copy` VALUES ('2', 'last_name', 'Apellido Paterno', 'input', '1', 'class=\'form-control\'', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('3', 'second_last_name', 'Apellido Materno', 'input', '1', 'class=\'form-control\'', null, '1', '2.00', null);
INSERT INTO `components_copy` VALUES ('4', 'email', 'Correo Electronico', 'email', '1', 'class=\'form-control\'', null, '1', '4.00', null);
INSERT INTO `components_copy` VALUES ('5', 'address', 'Dirección', 'textarea', '1', 'class=\'form-control\'', null, '1', '5.00', null);
INSERT INTO `components_copy` VALUES ('6', 'enrollment', 'Matricula', 'input', '1', 'class=\'form-control\'', null, '1', '-1.00', null);
INSERT INTO `components_copy` VALUES ('7', 'file', 'Foto', 'file', '1', 'class=\'form-control\'', null, '1', '3.50', null);
INSERT INTO `components_copy` VALUES ('8', 'last_name', null, null, '1', null, null, '1', null, null);
INSERT INTO `components_copy` VALUES ('23', 'name', 'Nombre', 'input', '1', '', null, '1', '2.00', null);
INSERT INTO `components_copy` VALUES ('24', 'kkkk', 'artur', 'input', '1', 'poooo', null, '1', '1.00', 'erererere');
INSERT INTO `components_copy` VALUES ('25', 'second_last_name', 'Apellido Materno', 'input', '1', '', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('26', 'email', 'Correo Electronico', 'email', '1', '', null, '1', '3.00', null);
INSERT INTO `components_copy` VALUES ('27', 'file', 'Foto', 'file', '1', '', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('28', 'start', 'Inicio', 'input', '1', null, null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('29', 'end', 'End', 'input', '1', null, null, '1', '2.00', null);
INSERT INTO `components_copy` VALUES ('30', 'title', 'Titulo', 'input', '1', null, null, '1', '3.00', null);
INSERT INTO `components_copy` VALUES ('31', 'description', 'Descripcion', 'textarea', '1', null, null, '1', '4.00', null);
INSERT INTO `components_copy` VALUES ('32', 'title', 'Title', 'input', '1', null, null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('33', 'content', 'content', 'textarea', '1', null, null, '1', '2.00', null);
INSERT INTO `components_copy` VALUES ('34', 'code', 'code', 'textarea', '1', 'style=\'width:400px;height:300px\'', null, '1', '3.00', null);
INSERT INTO `components_copy` VALUES ('35', 'file', 'Image', 'file', '1', null, null, '1', '4.00', null);
INSERT INTO `components_copy` VALUES ('36', 'password', 'Contraseña', 'password', '1', 'class=\'form-control\'', null, '1', '0.00', null);
INSERT INTO `components_copy` VALUES ('37', 'month', 'Mes', 'input', '1', '', null, '1', '0.00', null);
INSERT INTO `components_copy` VALUES ('38', 'year', 'Año', 'input', '1', 'class=\'form-control\'', null, '1', '0.00', null);
INSERT INTO `components_copy` VALUES ('39', 'amount', 'Monto', 'number', '1', 'class=\'form-control\'', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('40', 'password', 'Contraseña', 'input', '1', 'class=\'form-control\'', null, '1', '5.00', null);
INSERT INTO `components_copy` VALUES ('41', 'name', 'Name', 'input', '1', 'class=\'form-control\'', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('42', 'name', 'Nombre', 'input', '1', 'class=\'form-control\'', null, '1', '0.00', null);
INSERT INTO `components_copy` VALUES ('43', 'name', 'Titulo', 'input', '1', 'class=\'form-control\'', null, '1', '1.00', '');
INSERT INTO `components_copy` VALUES ('44', 'content', 'Descripcion', 'textarea', '1', 'class=\'form-control\'', null, '1', '1.00', null);
INSERT INTO `components_copy` VALUES ('46', 'file', 'Anexar Documento o Imagen', 'file', '1', 'class=\'form-control\'', null, '1', '1.00', '');
INSERT INTO `components_copy` VALUES ('47', 'campaign_id', 'Campaing Id', 'input', '1', 'class=\'form-control\'', null, '1', '4.00', null);
INSERT INTO `components_copy` VALUES ('48', 'username', 'Username', 'input', '1', 'class=\'form-control\'', null, '1', '5.00', null);
INSERT INTO `components_copy` VALUES ('49', 'password', 'Password', 'input', '1', 'class=\'form-control\'', null, '1', '6.00', null);
INSERT INTO `components_copy` VALUES ('50', 'art', 'Artyu', 'input', '1', 'class=\'conytol\'', null, '1', '0.00', 'Aere');
INSERT INTO `components_copy` VALUES ('51', 'name', 'Nombre(s)', 'input', '1', 'class=\'form-control\'', null, '1', '1.00', '');

-- ----------------------------
-- Table structure for components_forms
-- ----------------------------
DROP TABLE IF EXISTS `components_forms`;
CREATE TABLE `components_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `component_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of components_forms
-- ----------------------------
INSERT INTO `components_forms` VALUES ('75', '1', '2');
INSERT INTO `components_forms` VALUES ('76', '2', '2');
INSERT INTO `components_forms` VALUES ('77', '3', '2');
INSERT INTO `components_forms` VALUES ('78', '4', '2');
INSERT INTO `components_forms` VALUES ('79', '5', '2');
INSERT INTO `components_forms` VALUES ('80', '6', '2');
INSERT INTO `components_forms` VALUES ('81', '8', '2');
INSERT INTO `components_forms` VALUES ('109', '1', '3');
INSERT INTO `components_forms` VALUES ('110', '2', '3');
INSERT INTO `components_forms` VALUES ('111', '3', '3');
INSERT INTO `components_forms` VALUES ('112', '4', '3');
INSERT INTO `components_forms` VALUES ('113', '5', '3');
INSERT INTO `components_forms` VALUES ('114', '6', '3');
INSERT INTO `components_forms` VALUES ('115', '7', '3');
INSERT INTO `components_forms` VALUES ('116', '8', '3');
INSERT INTO `components_forms` VALUES ('117', '10', '3');
INSERT INTO `components_forms` VALUES ('118', '11', '3');
INSERT INTO `components_forms` VALUES ('119', '12', '3');
INSERT INTO `components_forms` VALUES ('120', '13', '3');
INSERT INTO `components_forms` VALUES ('121', '14', '3');
INSERT INTO `components_forms` VALUES ('138', '1', '1');
INSERT INTO `components_forms` VALUES ('139', '2', '1');
INSERT INTO `components_forms` VALUES ('140', '3', '1');
INSERT INTO `components_forms` VALUES ('141', '4', '1');
INSERT INTO `components_forms` VALUES ('142', '5', '1');
INSERT INTO `components_forms` VALUES ('143', '6', '1');
INSERT INTO `components_forms` VALUES ('144', '7', '1');
INSERT INTO `components_forms` VALUES ('145', '8', '1');
INSERT INTO `components_forms` VALUES ('146', '9', '1');
INSERT INTO `components_forms` VALUES ('147', '10', '1');
INSERT INTO `components_forms` VALUES ('148', '11', '1');
INSERT INTO `components_forms` VALUES ('149', '12', '1');
INSERT INTO `components_forms` VALUES ('150', '13', '1');
INSERT INTO `components_forms` VALUES ('151', '14', '1');
INSERT INTO `components_forms` VALUES ('152', '15', '1');
INSERT INTO `components_forms` VALUES ('153', '16', '1');
INSERT INTO `components_forms` VALUES ('154', '17', '1');
INSERT INTO `components_forms` VALUES ('155', '18', '1');

-- ----------------------------
-- Table structure for cycles
-- ----------------------------
DROP TABLE IF EXISTS `cycles`;
CREATE TABLE `cycles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cycles
-- ----------------------------
INSERT INTO `cycles` VALUES ('1', '2017-2018', '0', null, null, '1');

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `is_image` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  `full_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO `documents` VALUES ('1', 'isPalPer.fw_6.png', null, '2017-06-24 00:53:03', '2017-06-24 00:53:03', '0', null);
INSERT INTO `documents` VALUES ('2', 'isPalPer.fw_8.png', null, '2017-06-24 00:53:34', '2017-06-24 00:53:34', '0', null);
INSERT INTO `documents` VALUES ('3', 'isPalPer.fw_10.png', null, '2017-06-24 01:03:54', '2017-06-24 01:03:54', '0', null);
INSERT INTO `documents` VALUES ('4', 'isPalPer.fw_12.png', null, '2017-06-24 01:05:11', '2017-06-24 01:05:11', '0', null);
INSERT INTO `documents` VALUES ('5', 'isPalPer.fw_14.png', '1', '2017-06-24 01:10:46', '2017-06-24 01:10:46', '0', null);
INSERT INTO `documents` VALUES ('6', 'isPalPer.fw_.png', '1', '2017-06-24 01:24:54', '2017-06-24 01:24:54', '0', null);
INSERT INTO `documents` VALUES ('7', 'isPalPer.fw_2.png', '1', '2017-06-24 01:37:47', '2017-06-24 01:37:47', '0', '/var/www/html/s/uploads/colegio_europeo/documents/isPalPer.fw_2.png');
INSERT INTO `documents` VALUES ('8', 'isPalPer.fw_4.png', '1', '2017-06-24 01:38:07', '2017-06-24 01:38:07', '0', '/var/www/html/s/uploads/colegio_europeo/documents/isPalPer.fw_4.png');

-- ----------------------------
-- Table structure for documents_homeworks
-- ----------------------------
DROP TABLE IF EXISTS `documents_homeworks`;
CREATE TABLE `documents_homeworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documents_homeworks
-- ----------------------------
INSERT INTO `documents_homeworks` VALUES ('1', '3', '2');
INSERT INTO `documents_homeworks` VALUES ('2', '4', '2');
INSERT INTO `documents_homeworks` VALUES ('3', '5', '16');
INSERT INTO `documents_homeworks` VALUES ('4', '6', '19');
INSERT INTO `documents_homeworks` VALUES ('5', '7', '20');
INSERT INTO `documents_homeworks` VALUES ('6', '8', '21');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2037 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('2034', '1', 'Todo el mees', '2017-05-01 00:00:00', '2017-05-31 00:00:00', 'todo el mes');
INSERT INTO `events` VALUES ('2035', '1', 'dia del trabajo', '2017-05-01 00:00:00', '2017-05-01 00:00:00', '');
INSERT INTO `events` VALUES ('2036', '1', 'dddd', '2017-06-01 00:00:00', '2017-06-01 00:00:00', 'fdafa');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', '1', 'Hambueguesa de Amaranto', '2017-06-17', null, null, null, '2017-06-17 21:26:20', '2017-06-17 21:26:20');
INSERT INTO `foods` VALUES ('2', '1', 'Quesadillas de Champiñones', '2017-06-16', null, null, null, '2017-06-17 21:27:05', '2017-06-17 21:27:05');
INSERT INTO `foods` VALUES ('3', '1', 'Arroz Chino Vegetariano', '2017-06-15', null, null, null, '2017-06-17 21:31:44', '2017-06-17 21:31:44');
INSERT INTO `foods` VALUES ('4', '1', 'Sopa de Verduras', '2017-06-14', null, null, null, '2017-06-17 21:31:52', '2017-06-17 21:31:52');
INSERT INTO `foods` VALUES ('5', '1', 'Sopa de Tortilla', '2017-06-13', null, null, null, '2017-06-17 21:31:56', '2017-06-17 21:31:56');
INSERT INTO `foods` VALUES ('6', '1', 'Sopa de Haba', '2017-06-12', null, null, null, '2017-06-17 21:32:00', '2017-06-17 21:32:00');
INSERT INTO `foods` VALUES ('7', '1', 'Pizza Vegetariana', '2017-06-18', null, null, null, '2017-06-20 07:37:42', '2017-06-20 07:37:42');
INSERT INTO `foods` VALUES ('8', '1', 'Arroz con Lentejas', '2017-06-19', null, null, null, '2017-06-20 07:38:24', '2017-06-20 07:38:24');
INSERT INTO `foods` VALUES ('9', '1', 'Potaje de Garbanzo', '2017-06-20', null, null, null, '2017-06-20 18:07:25', '2017-06-20 18:07:25');
INSERT INTO `foods` VALUES ('10', '1', 'Crema de Papa', '2017-06-21', null, null, null, '2017-06-21 16:03:54', '2017-06-21 16:03:54');
INSERT INTO `foods` VALUES ('11', '1', 'Chili de Soya', '2017-06-22', null, null, null, '2017-06-21 16:04:52', '2017-06-21 16:04:52');
INSERT INTO `foods` VALUES ('12', '1', 'Enfrijoladas de Huevo', '2017-06-23', null, null, null, '2017-06-24 11:23:49', '2017-06-24 11:23:49');
INSERT INTO `foods` VALUES ('13', '1', 'Doriesquites', '2017-06-24', null, null, null, '2017-06-24 11:24:20', '2017-06-24 11:24:20');
INSERT INTO `foods` VALUES ('14', '1', 'Chanclas Veganas', '2017-06-26', null, null, null, '2017-07-11 08:52:41', '2017-07-11 08:52:41');
INSERT INTO `foods` VALUES ('15', '1', 'Tostadas de Tinga Veganas', '2017-06-27', null, null, null, '2017-07-11 08:52:46', '2017-07-11 08:52:46');
INSERT INTO `foods` VALUES ('16', '1', 'Tlatloyos con Nopales', '2017-06-28', null, null, null, '2017-07-11 08:52:59', '2017-07-11 08:52:59');
INSERT INTO `foods` VALUES ('17', '1', 'Espaguetti Primavera', '2017-06-29', null, null, null, '2017-07-11 08:53:16', '2017-07-11 08:53:16');
INSERT INTO `foods` VALUES ('18', '1', 'Burritos Veganos', '2017-06-30', null, null, null, '2017-07-11 08:53:34', '2017-07-11 08:53:34');
INSERT INTO `foods` VALUES ('19', '1', 'Burritos Veganos', '2017-07-01', null, null, null, '2017-07-11 08:53:49', '2017-07-11 08:53:49');
INSERT INTO `foods` VALUES ('22', '1', 'Pinchos', '2017-07-07', null, null, null, '2017-07-11 08:56:13', '2017-07-11 08:56:13');
INSERT INTO `foods` VALUES ('23', '1', 'Tacos de Soya', '2017-07-08', null, null, null, '2017-07-11 08:56:33', '2017-07-11 08:56:33');
INSERT INTO `foods` VALUES ('24', '1', 'Tortas', '2017-07-09', null, null, null, '2017-07-11 08:56:49', '2017-07-11 08:56:49');
INSERT INTO `foods` VALUES ('25', '1', 'Coliflor Capeada', '2017-07-10', null, null, null, '2017-07-11 08:56:53', '2017-07-11 08:56:53');
INSERT INTO `foods` VALUES ('26', '1', 'Pizza Vegetariana', '2017-07-06', null, null, null, '2017-07-11 08:57:09', '2017-07-11 08:57:09');
INSERT INTO `foods` VALUES ('27', '1', 'Croquetas de Papa', '2017-07-04', null, null, null, '2017-07-11 08:58:01', '2017-07-11 08:58:01');
INSERT INTO `foods` VALUES ('28', '1', 'Mole de Olla Vegano', '2017-07-05', null, null, null, '2017-07-11 08:59:14', '2017-07-11 08:59:14');

-- ----------------------------
-- Table structure for forms
-- ----------------------------
DROP TABLE IF EXISTS `forms`;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forms
-- ----------------------------
INSERT INTO `forms` VALUES ('1', 'students', 'students', 'form.tpl', '0');
INSERT INTO `forms` VALUES ('2', 'operators', 'operators', 'form.tpl', '0');
INSERT INTO `forms` VALUES ('3', 'teachers', 'teachers', 'form.tpl', '0');

-- ----------------------------
-- Table structure for forms_copy
-- ----------------------------
DROP TABLE IF EXISTS `forms_copy`;
CREATE TABLE `forms_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forms_copy
-- ----------------------------
INSERT INTO `forms_copy` VALUES ('1', 'students', 'students', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('2', 'teachers form', 'teachers', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('3', 'events', 'events', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('4', 'algorithms', 'algorithms', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('5', 'tuitions', 'tuitions', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('6', 'meals', 'meals', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('7', 'subjects', 'subjects', 'form.tpl', '1', '0');
INSERT INTO `forms_copy` VALUES ('8', 'homeworks', 'homeworks', 'form.tpl', '1', '0');

-- ----------------------------
-- Table structure for genders
-- ----------------------------
DROP TABLE IF EXISTS `genders`;
CREATE TABLE `genders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of genders
-- ----------------------------
INSERT INTO `genders` VALUES ('1', 'Masculino', '0', null, null, null);
INSERT INTO `genders` VALUES ('2', 'Femenino', '0', null, null, null);

-- ----------------------------
-- Table structure for goals
-- ----------------------------
DROP TABLE IF EXISTS `goals`;
CREATE TABLE `goals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goals
-- ----------------------------
INSERT INTO `goals` VALUES ('2', '1', 'contra', '2017-06-01', null, null);
INSERT INTO `goals` VALUES ('3', '1', 'C.A.', '2017-06-01', null, null);
INSERT INTO `goals` VALUES ('4', '1', 'Algorithms', '2017-06-01', null, null);
INSERT INTO `goals` VALUES ('5', '1', 'Guitar', '2017-05-31', null, null);
INSERT INTO `goals` VALUES ('6', '1', 'Book Bs(5 Mins)', '2017-06-02', null, null);
INSERT INTO `goals` VALUES ('7', '1', 'SCHOOL', '2017-06-02', null, null);
INSERT INTO `goals` VALUES ('8', '1', 'Algorithms', '2017-05-29', null, null);
INSERT INTO `goals` VALUES ('9', '1', 'SCHOOL', '2017-06-08', null, null);
INSERT INTO `goals` VALUES ('10', '1', 'RIFF', '2017-05-29', null, null);
INSERT INTO `goals` VALUES ('11', '1', 'Guitar', '2017-06-08', null, null);
INSERT INTO `goals` VALUES ('12', '1', 'Jogging', '2017-06-08', null, null);
INSERT INTO `goals` VALUES ('13', '1', 'Cris', '2017-06-07', null, null);
INSERT INTO `goals` VALUES ('14', '1', 'Cris', '2017-06-08', null, null);
INSERT INTO `goals` VALUES ('15', '1', 'C.A.', '2017-06-08', null, null);
INSERT INTO `goals` VALUES ('16', '1', 'Jogging', '2017-06-09', null, null);
INSERT INTO `goals` VALUES ('17', '1', 'Guitar', '2017-06-09', null, null);
INSERT INTO `goals` VALUES ('18', '1', 'Cris', '2017-06-09', null, null);
INSERT INTO `goals` VALUES ('19', '1', 'SCHOOL', '2017-06-09', null, null);
INSERT INTO `goals` VALUES ('20', '1', 'SCHOOL', '2017-06-12', null, null);
INSERT INTO `goals` VALUES ('21', '1', 'Jogging', '2017-06-12', null, null);
INSERT INTO `goals` VALUES ('22', '1', 'Cris', '2017-06-12', null, null);
INSERT INTO `goals` VALUES ('23', '1', 'Robert', '2017-06-12', null, null);
INSERT INTO `goals` VALUES ('24', '1', 'Jogging', '2017-06-14', null, null);
INSERT INTO `goals` VALUES ('25', '1', 'Guitar', '2017-06-15', null, null);
INSERT INTO `goals` VALUES ('26', '1', 'SCHOOL', '2017-06-14', null, null);
INSERT INTO `goals` VALUES ('27', '1', 'Algorithms', '2017-06-14', null, null);
INSERT INTO `goals` VALUES ('28', '1', 'Algorithms', '2017-06-21', null, null);
INSERT INTO `goals` VALUES ('29', '1', 'Guitar', '2017-06-21', null, null);
INSERT INTO `goals` VALUES ('30', '1', 'Cris', '2017-06-21', null, null);

-- ----------------------------
-- Table structure for grades
-- ----------------------------
DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grades
-- ----------------------------
INSERT INTO `grades` VALUES ('1', 'Maternal', '0', null, null, '1');
INSERT INTO `grades` VALUES ('2', 'Kinder', '0', null, null, '1');
INSERT INTO `grades` VALUES ('3', 'Primaria', '0', '2017-06-27 02:29:30', '2017-06-27 02:29:30', '1');
INSERT INTO `grades` VALUES ('4', 'Secundaria', '0', '2017-06-27 02:29:32', '2017-06-27 02:29:32', '1');
INSERT INTO `grades` VALUES ('5', 'Preparatoria/Bachillerato', '0', '2017-06-27 02:29:31', '2017-06-27 02:29:31', '1');
INSERT INTO `grades` VALUES ('6', 'Licenciatura', '0', '2017-06-27 02:29:35', '2017-06-27 02:29:35', '1');
INSERT INTO `grades` VALUES ('7', 'Maestria', '0', '2017-06-27 02:29:36', '2017-06-27 02:29:36', '1');
INSERT INTO `grades` VALUES ('8', 'Doctorado', '0', '2017-06-27 02:29:37', '2017-06-27 02:29:37', '1');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', '5A', '1', '3', null);
INSERT INTO `groups` VALUES ('2', '', '1', '6', null);
INSERT INTO `groups` VALUES ('3', '2DO SECUNDARIA', '1', '2', null);
INSERT INTO `groups` VALUES ('4', 'POR Materia', '1', '1', null);
INSERT INTO `groups` VALUES ('5', '4A', '1', '3', null);
INSERT INTO `groups` VALUES ('6', 'AAAA', '1', '4', null);
INSERT INTO `groups` VALUES ('30', 'Gatitos', '1', '1', null);
INSERT INTO `groups` VALUES ('31', 'test ne', '1', '9', null);
INSERT INTO `groups` VALUES ('32', 'listado', '1', '9', null);
INSERT INTO `groups` VALUES ('33', 'art', '1', '1', '64a7aad8-69ca-4567-bca9-64aeffae99bb');
INSERT INTO `groups` VALUES ('34', 'test A-1-nALL', '1', '9', null);
INSERT INTO `groups` VALUES ('35', '', '1', '1', '726036bf-e9db-461f-ad3e-d627c128bfbb');

-- ----------------------------
-- Table structure for groups_programs___
-- ----------------------------
DROP TABLE IF EXISTS `groups_programs___`;
CREATE TABLE `groups_programs___` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups_programs___
-- ----------------------------

-- ----------------------------
-- Table structure for groups_schedules
-- ----------------------------
DROP TABLE IF EXISTS `groups_schedules`;
CREATE TABLE `groups_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups_schedules
-- ----------------------------
INSERT INTO `groups_schedules` VALUES ('1', '3', '13');
INSERT INTO `groups_schedules` VALUES ('2', '4', '13');
INSERT INTO `groups_schedules` VALUES ('3', '3', '11');
INSERT INTO `groups_schedules` VALUES ('4', '4', '11');
INSERT INTO `groups_schedules` VALUES ('5', '3', '1');
INSERT INTO `groups_schedules` VALUES ('6', '4', '1');
INSERT INTO `groups_schedules` VALUES ('7', '3', '2');
INSERT INTO `groups_schedules` VALUES ('8', '4', '2');
INSERT INTO `groups_schedules` VALUES ('9', '3', '3');
INSERT INTO `groups_schedules` VALUES ('10', '4', '3');
INSERT INTO `groups_schedules` VALUES ('11', '3', '4');
INSERT INTO `groups_schedules` VALUES ('12', '4', '4');
INSERT INTO `groups_schedules` VALUES ('13', '3', '5');
INSERT INTO `groups_schedules` VALUES ('14', '4', '5');
INSERT INTO `groups_schedules` VALUES ('15', '3', '6');
INSERT INTO `groups_schedules` VALUES ('16', '4', '6');
INSERT INTO `groups_schedules` VALUES ('17', '3', '7');
INSERT INTO `groups_schedules` VALUES ('18', '4', '7');
INSERT INTO `groups_schedules` VALUES ('19', '3', '8');
INSERT INTO `groups_schedules` VALUES ('20', '4', '8');
INSERT INTO `groups_schedules` VALUES ('21', '3', '9');
INSERT INTO `groups_schedules` VALUES ('22', '4', '9');

-- ----------------------------
-- Table structure for groups_students
-- ----------------------------
DROP TABLE IF EXISTS `groups_students`;
CREATE TABLE `groups_students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups_students
-- ----------------------------
INSERT INTO `groups_students` VALUES ('1', '11', '9');
INSERT INTO `groups_students` VALUES ('2', '6', '10');
INSERT INTO `groups_students` VALUES ('3', '8', '10');
INSERT INTO `groups_students` VALUES ('4', '9', '10');
INSERT INTO `groups_students` VALUES ('5', '10', '10');
INSERT INTO `groups_students` VALUES ('6', '6', '12');
INSERT INTO `groups_students` VALUES ('7', '8', '12');
INSERT INTO `groups_students` VALUES ('51', '6', '15');
INSERT INTO `groups_students` VALUES ('49', '12', '14');
INSERT INTO `groups_students` VALUES ('48', '10', '13');
INSERT INTO `groups_students` VALUES ('47', '9', '13');
INSERT INTO `groups_students` VALUES ('46', '8', '13');
INSERT INTO `groups_students` VALUES ('45', '6', '13');
INSERT INTO `groups_students` VALUES ('52', '7', '15');
INSERT INTO `groups_students` VALUES ('53', '8', '15');
INSERT INTO `groups_students` VALUES ('54', '9', '15');
INSERT INTO `groups_students` VALUES ('55', '10', '15');
INSERT INTO `groups_students` VALUES ('56', '11', '15');
INSERT INTO `groups_students` VALUES ('57', '12', '15');
INSERT INTO `groups_students` VALUES ('58', '11', '16');
INSERT INTO `groups_students` VALUES ('59', '3', '17');
INSERT INTO `groups_students` VALUES ('60', '4', '17');
INSERT INTO `groups_students` VALUES ('86', '488', '20');
INSERT INTO `groups_students` VALUES ('85', '5', '20');
INSERT INTO `groups_students` VALUES ('87', '600', '20');
INSERT INTO `groups_students` VALUES ('182', '12038', '26');
INSERT INTO `groups_students` VALUES ('177', '12021', '19');
INSERT INTO `groups_students` VALUES ('206', '1', '5');
INSERT INTO `groups_students` VALUES ('128', '3', '21');
INSERT INTO `groups_students` VALUES ('89', '6', '21');
INSERT INTO `groups_students` VALUES ('90', '8', '21');
INSERT INTO `groups_students` VALUES ('91', '9', '21');
INSERT INTO `groups_students` VALUES ('92', '11', '21');
INSERT INTO `groups_students` VALUES ('181', '12039', '26');
INSERT INTO `groups_students` VALUES ('178', '12020', '24');
INSERT INTO `groups_students` VALUES ('207', '12020', '5');
INSERT INTO `groups_students` VALUES ('179', '12021', '23');
INSERT INTO `groups_students` VALUES ('174', '12020', '18');
INSERT INTO `groups_students` VALUES ('173', '12021', '18');
INSERT INTO `groups_students` VALUES ('176', '12060', '19');
INSERT INTO `groups_students` VALUES ('175', '3', '19');
INSERT INTO `groups_students` VALUES ('172', '12020', '25');
INSERT INTO `groups_students` VALUES ('184', '3', '27');
INSERT INTO `groups_students` VALUES ('185', '12020', '27');
INSERT INTO `groups_students` VALUES ('186', '12021', '27');
INSERT INTO `groups_students` VALUES ('187', '12064', '28');
INSERT INTO `groups_students` VALUES ('188', '12021', '28');
INSERT INTO `groups_students` VALUES ('189', '1', '1');
INSERT INTO `groups_students` VALUES ('203', '12025', '3');
INSERT INTO `groups_students` VALUES ('202', '12020', '3');
INSERT INTO `groups_students` VALUES ('201', '3', '3');
INSERT INTO `groups_students` VALUES ('200', '12021', '3');
INSERT INTO `groups_students` VALUES ('199', '12060', '3');
INSERT INTO `groups_students` VALUES ('204', '12041', '3');
INSERT INTO `groups_students` VALUES ('208', '12020', '30');
INSERT INTO `groups_students` VALUES ('209', '12065', '30');
INSERT INTO `groups_students` VALUES ('210', '12065', '31');
INSERT INTO `groups_students` VALUES ('211', '12020', '31');
INSERT INTO `groups_students` VALUES ('212', '12020', '32');
INSERT INTO `groups_students` VALUES ('213', '12021', '32');
INSERT INTO `groups_students` VALUES ('216', '1', '33');
INSERT INTO `groups_students` VALUES ('215', '1', '34');
INSERT INTO `groups_students` VALUES ('217', '12065', '35');

-- ----------------------------
-- Table structure for groups_teachers
-- ----------------------------
DROP TABLE IF EXISTS `groups_teachers`;
CREATE TABLE `groups_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups_teachers
-- ----------------------------
INSERT INTO `groups_teachers` VALUES ('1', '8', '18', null);
INSERT INTO `groups_teachers` VALUES ('2', '14', '18', null);

-- ----------------------------
-- Table structure for groups_tuitions
-- ----------------------------
DROP TABLE IF EXISTS `groups_tuitions`;
CREATE TABLE `groups_tuitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups_tuitions
-- ----------------------------
INSERT INTO `groups_tuitions` VALUES ('1', '17', '1');
INSERT INTO `groups_tuitions` VALUES ('2', '18', '1');
INSERT INTO `groups_tuitions` VALUES ('3', '19', '1');
INSERT INTO `groups_tuitions` VALUES ('4', '20', '5');
INSERT INTO `groups_tuitions` VALUES ('5', '23', '30');
INSERT INTO `groups_tuitions` VALUES ('6', '24', '33');
INSERT INTO `groups_tuitions` VALUES ('7', '25', '3');

-- ----------------------------
-- Table structure for hashes
-- ----------------------------
DROP TABLE IF EXISTS `hashes`;
CREATE TABLE `hashes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `exists` enum('1','0') DEFAULT NULL,
  `school_id` int(255) DEFAULT '1',
  `deleted` int(1) DEFAULT '0',
  `campaign_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hashes
-- ----------------------------
INSERT INTO `hashes` VALUES ('1', '4836c23413d7bedf19d0395303045b6d', 'arturodelosangeles@live.com', '0000-00-00 00:00:00', '2017-06-17 00:00:00', '0', '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('2', '30ad29201aebe4d99ef42e43857cfc0d', 'stymmy1@aol.com', '2017-07-11 16:45:41', '2017-07-11 09:45:41', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('3', '5bb1c184dc28edd2a6b54867425ef3ae', 'ecuses@gmail.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('4', '06a02a3e5e6157d7f43ffbde3ae7ef65', 'cdautorio@gmail.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('5', '52f214b0caaf144204de36eac37bf35d', 'cdautorio@yahoo.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('6', 'aa4da1b4aa272e6e5dd90be8c1a780f5', 'chrisd@mycityadvertising.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('7', '260e6410fe3f9d0517b82bd7e8b22c72', 'cdautorio@hotmail.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('8', '05ed2ffa486c15ee5119fc06912e1c1f', 'beez2220@aim.com', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('9', '631a41d003a32d25fe878081ef365c49', 'fake1', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('10', '503f7fada600da935e2851a1c7326084', 'fake2', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('11', 'b85cbf6429c4b859de8475731dc92a9c', 'fake3', '2017-06-17 00:00:00', '2017-06-17 00:00:00', null, '1', '0', null, null, null, null, null);
INSERT INTO `hashes` VALUES ('12', '73acabc05e834b98734f64a5947988d7', 'arturodelosangeles@hotmail.com', '2017-06-28 03:53:15', '2017-06-27 20:53:15', '1', '1', '0', '56', 'SINTESYS', 'SINTESYS', 'CIGAR CAMPAIGN 2', 'http://myendpoint.com/action/findhash/{campaign}/username/{username}/password/{password}/campaing_id/{campaign}');
INSERT INTO `hashes` VALUES ('13', '73acabc05e834b98734f64a5947988d7', 'arturodelosangeles@hotmail.com', '2017-06-27 20:53:47', '2017-06-27 20:53:47', null, '1', '0', '56', 'SINTESYS', 'SINTESYS', 'CIGAR CAMPAIGN 2-cloned', 'http://myendpoint.com/action/findhash/{campaign}/username/{username}/password/{password}/campaing_id/{campaign}');
INSERT INTO `hashes` VALUES ('14', '73acabc05e834b98734f64a5947988d7', 'arturodelosangeles@hotmail.com', '2017-06-27 20:54:05', '2017-06-27 20:54:05', null, '1', '0', '56', 'SINTESYS', 'SINTESYS', 'CIGAR CAMPAIGN 2-cloned-cloned', 'http://myendpoint.com/action/findhash/{campaign}/username/{username}/password/{password}/campaing_id/{campaign}');
INSERT INTO `hashes` VALUES ('15', '0b344aaa30584005e0d843aeb8e238af', 'kenandruth@msn.com', '2017-07-14 17:18:35', '2017-07-14 10:18:35', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('16', '06a02a3e5e6157d7f43ffbde3ae7ef65', 'cdautorio@gmail.com', '2017-07-06 03:05:32', '2017-07-06 03:05:32', null, '1', '0', '55', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'diabetes 55', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('17', '6054366ce4647a3f1048e63682def835', 'dwindh@webtv.net', '2017-07-11 16:46:57', '2017-07-11 09:46:57', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('18', '00e47fb85a1f38d32f1ba48adc3c09b2', 'jfc1996@aol.com', '2017-07-11 16:47:30', '2017-07-11 09:47:30', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('19', '00e47aeb61de15537c2657648c14d92f', 'nhstormread2@aol.com', '2017-07-11 16:47:55', '2017-07-11 09:47:55', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('20', '30ad4e4d3f5de838302d2ae29e0fbbd3', 'antiswaka@yahoo.com', '2017-07-11 16:48:23', '2017-07-11 09:48:23', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('21', 'a35d3947bbdca4dd83e7bea9689a68a4', 'stymmy1sssssssssssss@aol.com', '2017-07-11 17:32:14', '2017-07-11 10:32:14', null, '1', '0', '72', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CHECK FALVIAR AND CIGAR ON EMAILS\nCampaign Id 72-dont exixts', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('22', '27451b00c65616019553295beb18f9cb', 'mozartstein@gmail.com', '2017-07-20 06:33:31', '2017-07-19 23:33:31', null, '1', '0', '79', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'check campaiign counts\n', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('23', '06a02a3e5e6157d7f43ffbde3ae7ef65', 'cdautorio@gmail.com', '2017-07-12 07:53:37', '2017-07-12 07:53:37', null, '1', '0', '73', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'Sint Goop Test', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('24', '27451b00c65616019553295beb18f9cb', 'mozartstein@gmail.com', '2017-07-12 17:37:52', '2017-07-12 10:37:52', null, '1', '0', '74', 'optintelligence2016', 'optintelligence2016', 'GOOP TEst with sub id ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}/sub_id1/1234');
INSERT INTO `hashes` VALUES ('25', '27451b00c65616019553295beb18f9cb', 'mozartstein@gmail.com', '2017-07-12 17:56:11', '2017-07-12 10:56:11', null, '1', '0', '64', 'KmasmarT2017', '4tebzxqy', 'sud id for cigar', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}/sub_id1/1234');
INSERT INTO `hashes` VALUES ('26', '06a02a3e5e6157d7f43ffbde3ae7ef65', 'cdautorio@gmail.com', '2017-07-14 21:33:44', '2017-07-14 14:33:44', null, '1', '0', '75', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'TEST EMAIL TRIGGER ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('28', '605500e4583880ab100f316292fad562', 'sdcruz4ever@yahoo.com', '2017-07-14 17:47:27', '2017-07-14 10:47:27', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('29', '30ae077d3d4e9e1a5c588b6701cd7ad4', 'mrscharlton@sbcglobal.net', '2017-07-14 17:50:39', '2017-07-14 10:50:39', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('30', '8ffd6b9c73cf5232f90c183dff6e8114', 'mechelle1120@gmail.com', '2017-07-14 17:53:18', '2017-07-14 10:53:18', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('31', '386b596b171e761916caadff62d13639', 'renee.sheldon@mindspring.c', '2017-07-14 17:53:51', '2017-07-14 10:53:51', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('32', '30ae0046b845904e34ed4b3749931e5c', 'renee.sheldon@mindspring.com', '2017-07-14 17:54:14', '2017-07-14 10:54:14', null, '1', '0', '76', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'CIGAR, goop, flaviar ', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}');
INSERT INTO `hashes` VALUES ('33', 'd459b1ea91d6971183c335f48628587e', 'arturodelosangeles@gmail.com', '2017-07-21 18:32:33', '2017-07-21 11:32:33', null, '1', '0', '79', 'sintesys', 'cdv8RC6ysXvRxn3d35x2', 'check campaign counts dub is', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/{username}/pass/{password}/hash/{hash}/campaign_id/{campaign}/sub_id1/5556678');
INSERT INTO `hashes` VALUES ('34', '7cd17a669dbe6c2c5433e132fac72cf7', 'ytryt@hgfhg.com', '2017-07-15 05:02:55', '2017-07-14 22:02:55', null, '1', '0', '78', 'KmasmarT2017', 'KmasmarT2017', '', 'http://kmadigital.com/api/index.php/service/action/find_hash/username/KmasmarT2017/pass/4tebzxqy/hash/{replace_with_hash}/campaign_id/78');

-- ----------------------------
-- Table structure for homeworks
-- ----------------------------
DROP TABLE IF EXISTS `homeworks`;
CREATE TABLE `homeworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of homeworks
-- ----------------------------
INSERT INTO `homeworks` VALUES ('1', 'asfas', null, '1', '0', '2017-06-24 02:12:35', '2017-06-24 02:12:35', null);
INSERT INTO `homeworks` VALUES ('2', 'fsfas', '5a', '1', '0', '2017-06-24 08:05:11', '2017-06-24 01:05:11', '23');
INSERT INTO `homeworks` VALUES ('3', 'dfd', 'all in one ', '1', '0', '2017-06-24 07:49:41', '2017-06-24 00:49:41', '19');
INSERT INTO `homeworks` VALUES ('4', 'paginas 3 y 4 del MDA ', '', '1', '0', '2017-06-23 21:40:59', '2017-06-23 21:40:59', null);
INSERT INTO `homeworks` VALUES ('5', 'pagina 66 coloring book', '', '1', '0', '2017-06-23 21:41:17', '2017-06-23 21:41:17', null);
INSERT INTO `homeworks` VALUES ('6', 'paginas 100 a 200', '', '1', '0', '2017-06-23 22:11:17', '2017-06-23 22:11:17', null);
INSERT INTO `homeworks` VALUES ('7', 'paginas 100 a 200', 'list', '1', '0', '2017-06-24 05:21:20', '2017-06-23 22:21:20', null);
INSERT INTO `homeworks` VALUES ('8', 'listado', 'test', '1', '0', '2017-06-23 22:19:36', '2017-06-23 22:19:36', null);
INSERT INTO `homeworks` VALUES ('9', 'hacer la tarea', 'ya', '1', '0', '2017-06-24 05:57:54', '2017-06-23 22:57:54', null);
INSERT INTO `homeworks` VALUES ('10', 'tets', 'all', '1', '0', '2017-06-24 05:59:41', '2017-06-23 22:59:41', null);
INSERT INTO `homeworks` VALUES ('11', 'test3', 'test3', '1', '0', '2017-06-24 06:10:05', '2017-06-23 23:10:05', '19');
INSERT INTO `homeworks` VALUES ('12', 'arturo', '', '1', '0', '2017-06-24 00:11:54', '2017-06-24 00:11:54', '23');
INSERT INTO `homeworks` VALUES ('13', 'fdsf', 'asdfa', '1', '0', '2017-06-24 00:18:56', '2017-06-24 00:18:56', '23');
INSERT INTO `homeworks` VALUES ('14', 'fdsf', 'asdfa', '1', '0', '2017-06-24 00:19:06', '2017-06-24 00:19:06', '23');
INSERT INTO `homeworks` VALUES ('15', 'fdsf', 'asdfa', '1', '0', '2017-06-24 07:46:33', '2017-06-24 00:46:33', '23');
INSERT INTO `homeworks` VALUES ('16', 'ddd', 'dd', '1', '0', '2017-06-24 01:10:46', '2017-06-24 01:10:46', '23');
INSERT INTO `homeworks` VALUES ('17', 'asfa', 'asf', '1', '0', '2017-06-24 01:24:28', '2017-06-24 01:24:28', '23');
INSERT INTO `homeworks` VALUES ('18', 'asfa', 'asf', '1', '0', '2017-06-24 01:24:42', '2017-06-24 01:24:42', '23');
INSERT INTO `homeworks` VALUES ('19', 'asfa', 'asf', '1', '0', '2017-06-24 01:24:54', '2017-06-24 01:24:54', '23');
INSERT INTO `homeworks` VALUES ('20', 'sss', 'sss', '1', '0', '2017-06-24 01:37:47', '2017-06-24 01:37:47', '23');
INSERT INTO `homeworks` VALUES ('21', 'ssssssssssssssssssssssssssss', 'sss', '1', '0', '2017-06-24 01:38:07', '2017-06-24 01:38:07', '23');
INSERT INTO `homeworks` VALUES ('22', '', '', '1', '0', '2017-06-24 13:16:09', '2017-06-24 13:16:09', '18');
INSERT INTO `homeworks` VALUES ('23', 'leer libro de algoritmos', 'leer libro ', '1', '0', '2017-06-24 20:29:13', '2017-06-24 20:29:13', '25');
INSERT INTO `homeworks` VALUES ('24', 'bañar a mirna', 'test', '1', '0', '2017-06-26 07:55:17', '2017-06-26 07:55:17', '26');
INSERT INTO `homeworks` VALUES ('25', 'tarea para 4', 'dasfasf', '1', '0', '2017-06-26 07:57:48', '2017-06-26 07:57:48', '25');

-- ----------------------------
-- Table structure for homeworks_teachers
-- ----------------------------
DROP TABLE IF EXISTS `homeworks_teachers`;
CREATE TABLE `homeworks_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` tinyint(1) DEFAULT NULL,
  `homework_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of homeworks_teachers
-- ----------------------------
INSERT INTO `homeworks_teachers` VALUES ('1', '14', '2');
INSERT INTO `homeworks_teachers` VALUES ('2', '14', '3');
INSERT INTO `homeworks_teachers` VALUES ('3', '14', '1');
INSERT INTO `homeworks_teachers` VALUES ('4', '14', '7');
INSERT INTO `homeworks_teachers` VALUES ('5', '14', '8');
INSERT INTO `homeworks_teachers` VALUES ('6', '14', '9');
INSERT INTO `homeworks_teachers` VALUES ('7', '14', '10');
INSERT INTO `homeworks_teachers` VALUES ('8', '14', '11');
INSERT INTO `homeworks_teachers` VALUES ('9', '14', '12');
INSERT INTO `homeworks_teachers` VALUES ('10', '14', '13');
INSERT INTO `homeworks_teachers` VALUES ('11', '14', '14');
INSERT INTO `homeworks_teachers` VALUES ('12', '14', '15');
INSERT INTO `homeworks_teachers` VALUES ('13', '14', '16');
INSERT INTO `homeworks_teachers` VALUES ('14', '14', '17');
INSERT INTO `homeworks_teachers` VALUES ('15', '14', '18');
INSERT INTO `homeworks_teachers` VALUES ('16', '14', '19');
INSERT INTO `homeworks_teachers` VALUES ('17', '14', '20');
INSERT INTO `homeworks_teachers` VALUES ('18', '14', '21');
INSERT INTO `homeworks_teachers` VALUES ('19', '14', '22');
INSERT INTO `homeworks_teachers` VALUES ('20', '14', '23');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for images_tasks
-- ----------------------------
DROP TABLE IF EXISTS `images_tasks`;
CREATE TABLE `images_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('error','info') DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('3', 'error', 'no profile found', '2017-06-24 19:02:37');
INSERT INTO `logs` VALUES ('4', 'error', 'no profile found', '2017-07-22 12:37:01');

-- ----------------------------
-- Table structure for meals
-- ----------------------------
DROP TABLE IF EXISTS `meals`;
CREATE TABLE `meals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(1) DEFAULT '0',
  `school_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of meals
-- ----------------------------
INSERT INTO `meals` VALUES ('1', 'Hambueguesa de Amaranto', '2017-06-17 20:20:25', '2017-06-17 20:20:25', '0', '1');
INSERT INTO `meals` VALUES ('2', 'Quesadillas de Champiñones', '2017-06-17 23:48:51', '2017-06-18 04:48:45', '0', '1');
INSERT INTO `meals` VALUES ('4', 'Arroz Chino Vegetariano', '2017-06-17 21:29:00', '2017-06-17 21:29:00', '0', '1');
INSERT INTO `meals` VALUES ('5', 'Sopa de Haba', '2017-06-17 21:29:30', '2017-06-17 21:29:30', '0', '1');
INSERT INTO `meals` VALUES ('6', 'Sopa de Tortilla', '2017-06-17 21:29:45', '2017-06-17 21:29:45', '0', '1');
INSERT INTO `meals` VALUES ('7', 'Sopa de Verduras', '2017-06-17 21:31:21', '2017-06-17 21:31:21', '0', '1');
INSERT INTO `meals` VALUES ('8', 'Pizza Vegetariana', '2017-06-20 07:37:31', '2017-06-20 07:37:31', '0', '1');
INSERT INTO `meals` VALUES ('9', 'Arroz con Lentejas', '2017-06-20 07:38:16', '2017-06-20 07:38:16', '0', '1');
INSERT INTO `meals` VALUES ('10', 'Potaje de Garbanzo', '2017-06-20 18:07:10', '2017-06-20 18:07:10', '0', '1');
INSERT INTO `meals` VALUES ('11', 'Crema de Papa', '2017-06-21 16:03:26', '2017-06-21 16:03:26', '0', '1');
INSERT INTO `meals` VALUES ('12', 'Chili de Soya', '2017-06-21 16:04:42', '2017-06-21 16:04:42', '0', '1');
INSERT INTO `meals` VALUES ('13', 'Enfrijoladas de Huevo', null, null, '0', '1');
INSERT INTO `meals` VALUES ('14', 'Doriesquites', null, null, '0', '1');
INSERT INTO `meals` VALUES ('15', 'Chanclas Veganas', null, null, '0', '1');
INSERT INTO `meals` VALUES ('16', 'Burritos Veganos', null, null, '0', '1');
INSERT INTO `meals` VALUES ('17', 'Tostadas de Tinga Veganas', null, null, '0', '1');
INSERT INTO `meals` VALUES ('18', 'Espaguetti Primavera', null, null, '0', '1');
INSERT INTO `meals` VALUES ('19', 'Tlatloyos con Nopales', '2017-07-12 23:11:02', '2017-07-12 16:11:02', '0', '1');
INSERT INTO `meals` VALUES ('20', 'Pinchos', null, null, '0', '1');
INSERT INTO `meals` VALUES ('21', 'Pizza Vegetariana', null, null, '0', '1');
INSERT INTO `meals` VALUES ('22', 'Tacos de Soya', null, null, '0', '1');
INSERT INTO `meals` VALUES ('23', 'Tortas', null, null, '0', '1');
INSERT INTO `meals` VALUES ('24', 'Coliflor Capeada', null, null, '0', '1');
INSERT INTO `meals` VALUES ('25', 'Croquetas de Papa', null, null, '0', '1');
INSERT INTO `meals` VALUES ('26', 'Mole de Olla Vegano', null, null, '0', '1');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'Tablero', 'javascript:;', null);
INSERT INTO `menus` VALUES ('2', 'Alumnos', 'javascript:;', 'students');
INSERT INTO `menus` VALUES ('3', 'Listado', 'students/params/action/list', 'students');
INSERT INTO `menus` VALUES ('4', 'Agregar', 'students/params/action/form', 'students');
INSERT INTO `menus` VALUES ('5', 'Docentes', 'javascript:;', 'teachers');
INSERT INTO `menus` VALUES ('6', 'Listado', 'teachers/params/action/list', 'teachers');
INSERT INTO `menus` VALUES ('7', 'Agregar', 'teachers/params/action/form', '	teachers');
INSERT INTO `menus` VALUES ('8', 'Grupos', 'javascript:;', null);
INSERT INTO `menus` VALUES ('9', 'Listado', 'groups/params/action/list', 'groups');
INSERT INTO `menus` VALUES ('10', 'Agregar', 'groups/params/action/form', null);
INSERT INTO `menus` VALUES ('11', 'Colegiaturas', 'javascript:;', null);
INSERT INTO `menus` VALUES ('12', 'Listado', 'tuitions', null);
INSERT INTO `menus` VALUES ('13', 'Agregar', 'tuitions/params/action/form', null);
INSERT INTO `menus` VALUES ('14', 'Eventos', 'javascript:;', null);
INSERT INTO `menus` VALUES ('15', 'Calendario', 'events/params/action/list', null);
INSERT INTO `menus` VALUES ('16', 'Agregar', 'events/params/action/form', null);
INSERT INTO `menus` VALUES ('17', 'Horarios', 'javascript:;', null);
INSERT INTO `menus` VALUES ('18', 'listado', 'schedules/params/action/list', null);
INSERT INTO `menus` VALUES ('19', 'Agregar', 'schedules/params/action/form', null);
INSERT INTO `menus` VALUES ('20', 'Admn Menus', 'menus/', null);
INSERT INTO `menus` VALUES ('21', 'Alogorithms', 'javascript:;', null);
INSERT INTO `menus` VALUES ('22', 'listado', 'algorithms/params/action/list', null);
INSERT INTO `menus` VALUES ('23', 'Add', 'algorithms/params/action/form', null);
INSERT INTO `menus` VALUES ('24', 'Projects', 'javascript:;', null);
INSERT INTO `menus` VALUES ('25', 'listado', 'projects/params/action/list', null);
INSERT INTO `menus` VALUES ('26', 'agregar', 'projects/params/action/form', null);
INSERT INTO `menus` VALUES ('27', 'Changes', 'javascript:;', null);
INSERT INTO `menus` VALUES ('28', 'listado', 'changes/params/action/list', null);
INSERT INTO `menus` VALUES ('29', 'Form', 'changes/params/action/form', null);
INSERT INTO `menus` VALUES ('30', 'Horarios T', 'schedules/params/action/lists', null);
INSERT INTO `menus` VALUES ('31', 'Tareas', 'javascript:;', null);
INSERT INTO `menus` VALUES ('32', 'Listado', 'homeworks/params/action/list', null);
INSERT INTO `menus` VALUES ('33', 'ddd', '', null);
INSERT INTO `menus` VALUES ('34', 'Goals', 'goals', null);
INSERT INTO `menus` VALUES ('35', 'Listado', 'events/params/action/list', null);
INSERT INTO `menus` VALUES ('36', 'forms-Add', 'forms/params/action/form', null);
INSERT INTO `menus` VALUES ('37', 'forms-list', 'forms/params/action/list', null);
INSERT INTO `menus` VALUES ('38', 'Meals', 'javascript:;', null);
INSERT INTO `menus` VALUES ('39', 'listado', 'meals/', null);
INSERT INTO `menus` VALUES ('40', 'agregar', 'meals/params/action/form/', null);
INSERT INTO `menus` VALUES ('41', 'Comidas', 'javascript:;', null);
INSERT INTO `menus` VALUES ('42', 'Listado', 'foods/', null);
INSERT INTO `menus` VALUES ('43', 'Agregar', 'foods/params/action/form', null);
INSERT INTO `menus` VALUES ('44', 'hashes', 'javascript:;', null);
INSERT INTO `menus` VALUES ('45', 'listadp', 'hashes/', null);
INSERT INTO `menus` VALUES ('46', 'Materias', 'javascript:;', null);
INSERT INTO `menus` VALUES ('47', 'Listado', 'subjects', null);
INSERT INTO `menus` VALUES ('48', 'Agregar', 'subjects/params/action/form', null);
INSERT INTO `menus` VALUES ('49', 'Grupos', 'groups/params/action/list', null);
INSERT INTO `menus` VALUES ('50', 'Tareas', 'javascript:;', null);
INSERT INTO `menus` VALUES ('51', 'Listado', 'homeworks/params/action/list/', null);
INSERT INTO `menus` VALUES ('52', 'Agregar', 'homeworks/params/action/form/', null);
INSERT INTO `menus` VALUES ('53', 'Asistencias', 'javascript:;', null);
INSERT INTO `menus` VALUES ('54', 'Listado', 'attendances/params/action/list', null);
INSERT INTO `menus` VALUES ('55', 'Agregar', 'attendances/params/action/form', null);
INSERT INTO `menus` VALUES ('56', 'Tareas', 'homeworks/params/action/list/', null);
INSERT INTO `menus` VALUES ('57', 'Grados Academicos', 'javascript:;', null);
INSERT INTO `menus` VALUES ('58', 'Listado', 'grades/', null);
INSERT INTO `menus` VALUES ('59', 'Agregar', 'grades/params/action/form', null);
INSERT INTO `menus` VALUES ('60', 'Codes', 'javascript:;', null);
INSERT INTO `menus` VALUES ('61', 'Listado', 'codes/', null);
INSERT INTO `menus` VALUES ('62', 'Add', 'codes/params/action/form', null);
INSERT INTO `menus` VALUES ('63', 'schools', 'javascript:;', null);
INSERT INTO `menus` VALUES ('65', 'Agregar', 'schools/params/action/form', null);
INSERT INTO `menus` VALUES ('64', 'Listado', 'schools/', null);
INSERT INTO `menus` VALUES ('66', 'Administrativos', 'javascript:;', null);
INSERT INTO `menus` VALUES ('67', 'Listado', 'operators', null);
INSERT INTO `menus` VALUES ('68', 'Agregar', 'operators/params/action/form', null);
INSERT INTO `menus` VALUES ('69', 'Profiles', 'javascript:;', null);
INSERT INTO `menus` VALUES ('70', 'Listado', 'profiles', null);
INSERT INTO `menus` VALUES ('71', 'Add New', 'profiles/params/action/form', null);
INSERT INTO `menus` VALUES ('72', 'Menus', 'javascript:;', null);
INSERT INTO `menus` VALUES ('73', 'Listado', 'menus', null);
INSERT INTO `menus` VALUES ('74', 'Add New', 'menus/params/action/form', null);

-- ----------------------------
-- Table structure for menus_menus
-- ----------------------------
DROP TABLE IF EXISTS `menus_menus`;
CREATE TABLE `menus_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `related_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menus_menus
-- ----------------------------
INSERT INTO `menus_menus` VALUES ('7', '5', '6');
INSERT INTO `menus_menus` VALUES ('16', '2', '3');
INSERT INTO `menus_menus` VALUES ('17', '2', '4');
INSERT INTO `menus_menus` VALUES ('8', '5', '7');
INSERT INTO `menus_menus` VALUES ('9', '8', '9');
INSERT INTO `menus_menus` VALUES ('10', '8', '10');
INSERT INTO `menus_menus` VALUES ('21', '11', '12');
INSERT INTO `menus_menus` VALUES ('22', '11', '13');
INSERT INTO `menus_menus` VALUES ('20', '14', '15');
INSERT INTO `menus_menus` VALUES ('14', '14', '16');
INSERT INTO `menus_menus` VALUES ('23', '17', '18');
INSERT INTO `menus_menus` VALUES ('24', '17', '19');
INSERT INTO `menus_menus` VALUES ('54', '1', '20');
INSERT INTO `menus_menus` VALUES ('26', '21', '22');
INSERT INTO `menus_menus` VALUES ('27', '21', '23');
INSERT INTO `menus_menus` VALUES ('31', '24', '25');
INSERT INTO `menus_menus` VALUES ('30', '24', '26');
INSERT INTO `menus_menus` VALUES ('32', '27', '28');
INSERT INTO `menus_menus` VALUES ('33', '27', '29');
INSERT INTO `menus_menus` VALUES ('34', '31', '32');
INSERT INTO `menus_menus` VALUES ('37', '32', '33');
INSERT INTO `menus_menus` VALUES ('39', '14', '35');
INSERT INTO `menus_menus` VALUES ('40', '38', '39');
INSERT INTO `menus_menus` VALUES ('42', '38', '40');
INSERT INTO `menus_menus` VALUES ('43', '41', '42');
INSERT INTO `menus_menus` VALUES ('44', '41', '43');
INSERT INTO `menus_menus` VALUES ('45', '44', '45');
INSERT INTO `menus_menus` VALUES ('46', '46', '47');
INSERT INTO `menus_menus` VALUES ('47', '46', '48');
INSERT INTO `menus_menus` VALUES ('48', '50', '51');
INSERT INTO `menus_menus` VALUES ('49', '50', '52');
INSERT INTO `menus_menus` VALUES ('50', '53', '54');
INSERT INTO `menus_menus` VALUES ('51', '53', '55');
INSERT INTO `menus_menus` VALUES ('52', '57', '58');
INSERT INTO `menus_menus` VALUES ('53', '57', '59');
INSERT INTO `menus_menus` VALUES ('55', '60', '61');
INSERT INTO `menus_menus` VALUES ('56', '60', '62');
INSERT INTO `menus_menus` VALUES ('58', '63', '64');
INSERT INTO `menus_menus` VALUES ('59', '63', '65');
INSERT INTO `menus_menus` VALUES ('60', '66', '67');
INSERT INTO `menus_menus` VALUES ('61', '66', '68');
INSERT INTO `menus_menus` VALUES ('62', '69', '70');
INSERT INTO `menus_menus` VALUES ('63', '69', '71');
INSERT INTO `menus_menus` VALUES ('64', '72', '73');
INSERT INTO `menus_menus` VALUES ('65', '72', '74');

-- ----------------------------
-- Table structure for menus_profiles
-- ----------------------------
DROP TABLE IF EXISTS `menus_profiles`;
CREATE TABLE `menus_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menus_profiles
-- ----------------------------
INSERT INTO `menus_profiles` VALUES ('18', '2', '53');
INSERT INTO `menus_profiles` VALUES ('17', '2', '31');
INSERT INTO `menus_profiles` VALUES ('16', '5', '8');
INSERT INTO `menus_profiles` VALUES ('15', '1', '57');
INSERT INTO `menus_profiles` VALUES ('14', '1', '46');
INSERT INTO `menus_profiles` VALUES ('13', '5', '11');
INSERT INTO `menus_profiles` VALUES ('12', '5', '5');
INSERT INTO `menus_profiles` VALUES ('11', '5', '2');
INSERT INTO `menus_profiles` VALUES ('10', '1', '66');
INSERT INTO `menus_profiles` VALUES ('19', '5', '1');
INSERT INTO `menus_profiles` VALUES ('20', '5', '14');
INSERT INTO `menus_profiles` VALUES ('21', '1', '15');
INSERT INTO `menus_profiles` VALUES ('22', '5', '17');
INSERT INTO `menus_profiles` VALUES ('23', '1', '49');
INSERT INTO `menus_profiles` VALUES ('24', '1', '56');

-- ----------------------------
-- Table structure for meta_alumnos
-- ----------------------------
DROP TABLE IF EXISTS `meta_alumnos`;
CREATE TABLE `meta_alumnos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `editable` tinyint(255) DEFAULT NULL,
  `show` tinyint(255) DEFAULT NULL,
  `type` enum('input','textarea','email') DEFAULT 'input',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of meta_alumnos
-- ----------------------------
INSERT INTO `meta_alumnos` VALUES ('1', 'alumno_id', 'alumno_id', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('2', 'AluMat', 'Matricula', '0', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('3', 'digitovalidador', 'digitovalidador', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('4', 'foto', 'foto', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('5', 'AluMatB', 'AluMatB', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('6', 'AluFecA', 'AluFecA', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('7', 'SAlCod', 'SAlCod', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('8', 'AluNom', 'Nombre', '0', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('9', 'AluApeP', 'Apellido Paterno', '0', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('10', 'AluApeM', 'Apellido Materno', '0', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('11', 'AluFecN', 'AluFecN', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('12', 'AluSex', 'AluSex', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('13', 'AluCiv', 'AluCiv', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('14', 'AluTrab', 'AluTrab', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('15', 'AluTur', 'AluTur', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('16', 'lugartrab', 'lugartrab', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('17', 'AluDir', 'Direccion Actual', '1', '1', 'textarea');
INSERT INTO `meta_alumnos` VALUES ('18', 'AluCP', 'AluCP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('19', 'AluCol', 'AluCol', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('20', 'Alumun', 'Alumun', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('21', 'AluCiu', 'AluCiu', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('22', 'AluEdo', 'AluEdo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('23', 'PlaCve', 'PlaCve', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('24', 'LicCve', 'LicCve', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('25', 'AluGpo', 'AluGpo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('26', 'AluSem', 'AluSem', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('27', 'AluNomP', 'Nombre', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('28', 'AluApePP', 'Apellido Paterno', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('29', 'AluApeMP', 'Apellido Materno', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('30', 'AluDirP', 'AluDirP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('31', 'AluCPP', 'AluCPP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('32', 'AluColP', 'AluColP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('33', 'AluCiuP', 'AluCiuP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('34', 'AluEdoP', 'AluEdoP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('35', 'AluOcuP', 'AluOcuP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('36', 'AluEmpP', 'AluEmpP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('37', 'AluDiEP', 'AluDiEP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('38', 'AluCPEP', 'AluCPEP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('39', 'AluCoEP', 'AluCoEP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('40', 'AluCiEP', 'AluCiEP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('41', 'AluEdEP', 'AluEdEP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('42', 'AluFEAo', 'AluFEAo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('43', 'AluCPBo', 'AluCPBo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('44', 'AluCPBc2', 'AluCPBc2', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('45', 'AluCPBc', 'AluCPBc', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('46', 'AluCSo', 'AluCSo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('47', 'AluCSc', 'AluCSc', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('48', 'AluACNo', 'AluACNo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('49', 'AluACNc', 'AluACNc', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('50', 'AluFotI', 'AluFotI', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('51', 'AluFoO', 'AluFoO', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('52', 'AluProP', 'AluProP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('53', 'AluPEA', 'AluPEA', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('54', 'AluPBPr', 'AluPBPr', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('55', 'AluObsM', 'AluObsM', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('56', 'AluFecB', 'AluFecB', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('57', 'AluRFC', 'AluRFC', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('58', 'AluExp', 'AluExp', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('59', 'AluPBEd', 'AluPBEd', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('60', 'AluObsG', 'AluObsG', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('61', 'AluCURP', 'AluCURP', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('62', 'PpcCve', 'PpcCve', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('63', 'AluRazB', 'AluRazB', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('64', 'AluNM', 'AluNM', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('65', 'AluNacL', 'AluNacL', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('66', 'AluNacE', 'AluNacE', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('67', 'AluTipS', 'AluTipS', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('68', 'AluT11P', 'Telefono 1 - Lada', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('69', 'AluT11N', 'Telefono 1 - Numero', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('70', 'AluT11E', 'Telefono 1 - Extension', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('71', 'AluT12P', 'Telefono 2 - Lada', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('72', 'AluT12N', 'Telefono 2 - Numero', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('73', 'AluT12E', 'Telefono 2 - Extension', '1', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('74', 'AluT21P', 'AluT21P', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('75', 'AluT21N', 'AluT21N', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('76', 'AluT21E', 'AluT21E', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('77', 'AluT22P', 'AluT22P', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('78', 'AluT22N', 'AluT22N', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('79', 'AluT22E', 'AluT22E', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('80', 'AluT31P', 'AluT31P', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('81', 'AluT31N', 'AluT31N', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('82', 'AluT31E', 'AluT31E', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('83', 'AluT32P', 'AluT32P', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('84', 'AluT32N', 'AluT32N', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('85', 'folio_ex', 'folio_ex', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('86', 'AcaAa', 'AcaAa', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('87', 'AcaPer', 'AcaPer', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('88', 'AluAntC', 'AluAntC', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('89', 'numerodefichabuap', 'numerodefichabuap', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('90', 'ExpedienteICI', 'ExpedienteICI', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('91', 'MatriculaBuap', 'MatriculaBuap', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('92', 'tipodeescuela', 'tipodeescuela', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('93', 'tutorcelular', 'Telefono/Celular', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('94', 'tutorcorreoelectronico', 'tutorcorreoelectronico', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('95', 'tutorrelacion', 'tutorrelacion', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('96', 'direcciontrabajo', 'Direccion de Trabajo', '1', '1', 'textarea');
INSERT INTO `meta_alumnos` VALUES ('97', 'puestotrabajo', 'Puesto de Trabajo', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('98', 'teltrabajo', 'Telefono de Trabajo', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('99', 'teltrabajoext', 'teltrabajoext', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('100', 'celular', 'Numero de Celular', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('101', 'telcasa', 'Telefono de Casa', '1', '1', 'input');
INSERT INTO `meta_alumnos` VALUES ('102', 'telrecados', 'telrecados', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('103', 'teltrabajolada', 'teltrabajolada', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('104', 'correoelectronico', 'Email', '1', '1', 'email');
INSERT INTO `meta_alumnos` VALUES ('105', 'AluCSc2', 'AluCSc2', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('106', 'AluCPc2', 'AluCPc2', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('107', 'AluACNc2', 'AluACNc2', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('108', 'Alupdir', 'Alupdir', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('109', 'Alupcol', 'Alupcol', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('110', 'alupcp', 'alupcp', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('111', 'alupmun', 'alupmun', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('112', 'alupest', 'alupest', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('113', 'firma', 'firma', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('114', 'pais', 'pais', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('115', 'codigodebarras', 'codigodebarras', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('116', 'CredencialImpresa', 'CredencialImpresa', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('117', 'licenciatura', 'licenciatura', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('118', 'credencialentregada', 'credencialentregada', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('119', 'fototomada', 'fototomada', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('120', 'fototomada2', 'fototomada2', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('121', 'password', 'password', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('122', 'base', 'base', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('123', 'fechademodificacion', 'fechademodificacion', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('124', 'areabachillerato', 'areabachillerato', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('125', 'numerodehijos', 'numerodehijos', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('126', 'correoregistroenviado', 'correoregistroenviado', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('127', 'numeroderegistro', 'numeroderegistro', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('128', 'fecha', 'fecha', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('129', 'usuario', 'usuario', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('130', 'razondebaja', 'razondebaja', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('131', 'fechamodificacionedicion', 'fechamodificacionedicion', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('132', 'fecha_foto', 'fecha_foto', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('133', 'porcentajedebeca', 'porcentajedebeca', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('134', 'reinscribir', 'reinscribir', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('135', 'deudor', 'deudor', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('136', 'visible', 'visible', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('137', 'borrado', 'borrado', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('138', 'user', 'user', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('139', 'aniodeingreso', 'aniodeingreso', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('140', 'TipoIngreso', 'TipoIngreso', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('141', 'matriculaoficialbuap', 'matriculaoficialbuap', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('142', 'cobroBeginAcaaa', 'cobroBeginAcaaa', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('143', 'cobroEndAcaaa', 'cobroEndAcaaa', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('144', 'cobroBeginAcaper', 'cobroBeginAcaper', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('145', 'cobroEndAcaper', 'cobroEndAcaper', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('146', 'pin', 'pin', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('147', 'calle', 'calle', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('148', 'numero', 'numero', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('149', 'interior', 'interior', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('150', 'm_comunicacion', 'm_comunicacion', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('151', 'alupaa', 'alupaa', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('152', 'alupac', 'alupac', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('153', 'aluprocer', 'aluprocer', '0', '0', 'input');
INSERT INTO `meta_alumnos` VALUES ('154', 'CarreraAdm', 'CarreraAdm', '0', '0', 'input');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prioridad` varchar(40) DEFAULT NULL,
  `noticia` longtext,
  `departamento` varchar(40) DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `visible` varchar(5) DEFAULT 'Y',
  `borrado` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('20', 'MEDIA', 'SE INCLUYO , PARA LOS ALUMNOS QUE AUN NO HAN HECHO SU EVALUACION MAGISTERIAL, EL CAMPO COMMENTARIOS DONDE LOS ALUMNOS PODRAN EXPRESAR SU SENTIR CON RESPECTO A SUS PROFESORES', 'Secretaria Academica', 'a.delosangeles', '2007-03-28 13:56:31', 'Y', 'N');
INSERT INTO `news` VALUES ('5', 'MEDIA', 'PARA AGREGAR UNA NOTICIA SOLO SE TIENE QUE HACER CLIC EN ICONO UBICADO EN LA PARTE SUPERIOR DERECHA DE ESTA TABLA. LLENAR LOS CAMPOS NECESARIOS Y LISTO, LA NOTICIA SERÁ PUBLICADA Y TODOS LOS USUARIOS DEL SISTEMA PODRAN TENER ACCESO A ELLA.', 'Todos', 'a.delosangeles', '2007-03-17 19:32:49', 'Y', 'N');
INSERT INTO `news` VALUES ('7', 'ALTA', 'LA SECCIÓN DE AYUDA CONSISTE EN VIDEOS QUE DEMUESTRAN COMO USAR LOS MODULOS. PARA USARLA,SÓLO HAGA CLIC EN <STRONG>AYUDA</STRONG> EN EL MENU PRINCIPAL.', 'Todos', 'a.delosangeles', '2007-03-22 08:47:38', 'Y', 'N');
INSERT INTO `news` VALUES ('9', 'ALTA', 'EL MAESTRO ARTURO DE LOS ANGELES HA INTEGRADO AL SISTEMA EL MÓDULO <H4>EVALUACIÓN MAGISTERIAL</H4> QUE YA PUEDE SER ACCESADO POR LOS ALUMNOS DESDE SUS CUENTAS PARA LLEVAR A CABO EN CUALQUIER MOMENTO QUE SE DESEE LA EVALUACIÓN DEL DESEMPEÑO DE LOS CATEDRATICOS. ESTE SISETMA CUMPLE CON LAS ESPECIFICACIONES QUE SOLICITÓ EL MAESTRO GALINDO,  PERO AHORA CON LA VENTAJA DE QUE LA INFORMACION SE PUDE OBTENER Y MANEJAR DENTRO DEL SISTEMA, EN LINEA.', 'Todos', 'a.delosangeles', '2007-03-22 09:14:08', 'Y', 'N');
INSERT INTO `news` VALUES ('10', 'ALTA', 'EL MÓDULO PARA EVALUAR EL DESEMPEÑO DE LOS DOCENTES SE ENCUENTRA EN EL MENÚ PRINCIPAL DE LOS ALUMNOS CON EL NOMBRE <STRONG>EVALUACIÓN MAGISTERIAL</STRONG>', 'Todos', 'a.delosangeles', '2007-03-22 09:19:09', 'Y', 'N');
INSERT INTO `news` VALUES ('11', 'ALTA', 'ARTURO YA SE INICIO LA EVALUACION MAGISTERIAL, TUVIMOS ALGUNOS PROBLEMAS A LA HORA DE INGRESAR DATOS, EL SISTEMA TRONO POR COMPLETO REESTABLECIENDOSE MINUTOS DEPUES(EL PROBLEMA FUE SATURACION DEL USO DE PROCESADOR POR PARTE DEL SERVIDOR AL EFECTUAR EL PROCESO )', 'Todos', 'v.hugo', '2007-03-22 12:24:02', 'Y', 'N');
INSERT INTO `news` VALUES ('12', 'ALTA', 'NO HAY RELACION ENTRE EL PROCESO DE EVALUACION MAGISTERIAL Y EL HECHO DE QUE EL SISTEMA SE HAYA DETENIDO POR ALGUNOS MINUTOS. EL PROCESO DE EVALUACION MAGISTERIAL PUDE LLEVARSE ACABO DE FORMA SEGURA Y NORMAL.', 'Todos', 'a.delosangeles', '2007-03-22 12:34:07', 'Y', 'N');
INSERT INTO `news` VALUES ('13', 'ALTA', 'ARTURO: HEMOS REGISTRADO PROBLEMAS CON ABRAHAM GAVITO PÉREZ Y FORTINO CORTÉS HERNANDEZ, QUIENES NO PUEDIERON EJECUTAR LA EVALUACIÓN MAGISTERIAL.', 'Todos', 'p.yesica', '2007-03-22 17:26:13', 'Y', 'N');
INSERT INTO `news` VALUES ('14', 'ALTA', 'NO EXISTE NINGUNA RAZON PARA QUE <STRONG>GAVITO PEREZ ABRAHAM</STRONG> NO HAYA LLEVADO A CABO LA EVALUACION MAGISTERIAL. ALGUNAS VECES EL PROBLEMA ESTA EN LA CONTRASEÑA. POR EJEMPLO ES TIPICO QUE SE  CONFUNDA EL 6 CON LA LETRA G. DE CUALQUIER MODO  <STRONG>GAVITO PEREZ ABRAHAM</STRONG> CON MATRICULA <STRONG>206905206</STRONG> Y CONTRASEÑA <STRONG>C6A3G</STRONG> ES ERCONOCIDO POR EL SISTEMA Y PUEDE TOMAR LA EVALUACION SIN NINGUN PROBLEMA.', 'Todos', 'a.delosangeles', '2007-03-22 17:50:31', 'Y', 'N');
INSERT INTO `news` VALUES ('16', 'MEDIA', 'YA SE PUDEN BORRAR DE LA LISTA PRINCIPAL DE ALUMNOS REGISTROS DUPLICADOS O NO VALIDOS.', 'Secretaria Academica', 'a.delosangeles', '2007-03-24 19:11:51', 'Y', 'N');
INSERT INTO `news` VALUES ('17', 'MEDIA', 'PARA PAGOS HECHOS MEDIANTE LA CUENTA MAESTRA O CAJA YA SE PUEDE INCLUIR EL DATO FECHA DE PAGO.', 'Contabilidad', 'a.delosangeles', '2007-03-24 21:52:56', 'Y', 'N');
INSERT INTO `news` VALUES ('19', 'ALTA', 'ARTURO: LOS ALUMNOS DE 2ªCUATRIMESTRES DE CS. POLITICAS NO TIENEN REGISTRADA EN LA FICHA DE PAGO LAS MATERIAS DE ADELANTO. TE PEDIMOS VERIFIQUES ESTO PARA SOLUCIONAR PROBLEMAS EN LOS PAGOS. ', 'Todos', 'p.yesica', '2007-03-28 12:04:54', 'Y', 'N');
INSERT INTO `news` VALUES ('21', 'MEDIA', 'MAESTROS->EVAL', 'Secretaria Academica', 'a.delosangeles', '2007-03-30 01:54:00', 'Y', 'N');
INSERT INTO `news` VALUES ('22', 'ALTA', 'PROBLEMA CON FICHA ALUMNA. ERROR EN PAGINA\r\nYOU HAVE AN ERROR IN YOUR SQL SYNTAX; CHECK THE MANUAL THAT CORRESPONDS TO YOUR MYSQL SERVER VERSION FOR THE RIGHT SYNTAX TO USE NEAR \'AND REFERENCIA = 0407 AND BORRADO = \'N\'\' AT LINE 1114\r\n\r\nMATRICULA 204921877', 'Todos', 'v.hugo', '2007-04-30 13:21:58', 'Y', 'N');
INSERT INTO `news` VALUES ('23', 'MEDIA', 'EN RESPUESTA A V.HUGO > HUGO NO PUDE REPRODUCIR EL ERROR. LO ÚNICO QUE SE ME OCURRE ES SI EL NAVEGADOR DE LA CHICA ACEPTA COOKIES Y/O TIENE JAVA SCRIPT HABILITADO. TODOS LOS NAVEGADORES ACTUALES LO TIENEN POR OMISIÓN. SALUDOS', 'Todos', 'a.delosangeles', '2007-04-30 23:44:45', 'Y', 'N');
INSERT INTO `news` VALUES ('25', 'MEDIA', 'UNA VEZ CONCLUIDO EL DESARROLLO PRINCIPAL DEL SISTEMA, EL ALUMNO FICTICIO <STRONG>ARTURO DE LOS ANGELES</STRONG> Y EL USUARIO <STRONG>A.DELOSANGELES</STRONG> SERAN QUITADOS DEL SISTEMA, LO CUAL TAMBIEN AYUDARÁ A EVITAR CONFUSIONES CON LOS DATOS COMO HA SUCEDIDO EN EL PASADO. <BR/> POR ENDE <STRONG>NO</STRONG> ES NECESARIO  PUBLICAR AQUI ASUSNTOS RELACIONADOS AL SISTEMA. LA VÍA PARA TAL EFECTO ES A TRAVÉS DEL ING. HUGO VILLEGAS. O DIRECTAMENTE CON EL MTRO. ARTURO DE LOS ANGELES AL 3 79 60 07 O POR EMAIL A JOSEARTURODELOSANGELES@GMAIL.COM\r\n\r\nSALUDOS.', 'Todos', 'a.delosangeles', '2007-05-03 08:07:07', 'Y', 'N');
INSERT INTO `news` VALUES ('26', 'ALTA', 'EL SISTEMA SERA SUSPENDIDO EL DIA DE HOY 18 DE JULIO DE 2007  A LAS 14:10\r\nPOR RAZONES DE MANTENIMIENTO. EL MTRO. ARTURO DE LOS ANGELES ESTA CONSCIENTE DE LAS SUSPENSIONES QUE HAN HABIDO ULTIMAMENTE Y ESTA TRABAJANDO PARA QUE EL SISTEMA VUELVA A FUNCIONAR NORMALMENTE LO ANTES POSIBLE. GRACIAS POR SU COMPRENSION ANTE ESTOS DETALLES TECNICOS', 'Todos', 'arturo', '2007-07-18 12:42:02', 'Y', 'N');
INSERT INTO `news` VALUES ('27', 'ALTA', 'EL SISTEMA ESTARA EN LINEA NUEVAMENTE A LAS 16:00 DE ESTE MISMO DIA (18-JUL-2007)', 'Todos', 'arturo', '2007-07-18 12:45:05', 'Y', 'N');
INSERT INTO `news` VALUES ('28', 'ALTA', 'SE ACTUALIZO EL SERVIDOR WEB A UNO DE MAYOR CAPACIDAD. SIN EMBARGO SI SE PRESENTASE ALGUNA FALLA FAVOR DE REPORTARLA AL TEL 3796007 O BIEN POR EMAIL A: JOSEARTURODELOSANGELES@GMAIL.COM \r\nCON EL MTRO. ARTURO DE LOS ANGELES. ', 'Todos', 'arturo', '2007-07-23 08:03:00', 'Y', 'N');
INSERT INTO `news` VALUES ('29', 'MEDIA', '\"PREACTAS CAPTURAR\" AHORA SE ENCUENTRA EN EL MENU <STRONG>CARGA ACADEMICA</STRONG> EN LA COLUMNA <EM>ACTAS</EM>', 'Control Escolar', 'arturo', '2007-07-25 08:02:20', 'Y', 'N');
INSERT INTO `news` VALUES ('30', 'ALTA', '<H2>RUTA PARA LOS ALUMNOS DE NUEVO INGRESO<H2>\r\n<H3>http://www.serviciosestudiantiles.com/ici/alumnos/nuevoingreso/<H3>', 'Todos', 'arturo', '2007-08-04 05:44:56', 'Y', 'N');
INSERT INTO `news` VALUES ('31', 'ALTA', '<H2>YA SE CONFIGURO EL SISTEMA PARA QUE PUEDA  REALIZARSE EL PROCESO DE INSCRIPCION CONFORME A LO QUE SE ACORDO EN LA REUNION DEL MARTES</H2>', 'Todos', 'arturo', '2007-08-04 07:50:05', 'Y', 'N');
INSERT INTO `news` VALUES ('32', 'MEDIA', '<H3>EL SISTEMA SE BASARA EN QUE EL ALUMNO HAYA PAGADO SU REINSCRIPCION (Y POR ENDE SUS DEUDAS ANTERIORES)PARA  QUE PUEDE TOMAR MATERIAS , SIN EMBARGO SI SE PRESENTA EL CASO DE ALGUNA EXCEPCION, SE PUEDE PERMITIR LA REINSCRIPCION DESDE EL ADMINISTRADOR EN ALUMNOS, SELECCIONANDO AL ALUMNO Y HACIENDO CLIC EN LA ACCION (AL PIE DE LOS RESULTADOS) PERMITIR REINSCRIPCION</H3>\r\n', 'Control Escolar', 'arturo', '2007-08-05 10:56:15', 'Y', 'N');
INSERT INTO `news` VALUES ('34', 'MEDIA', 'FILTROS EN ALUMNOS REINSCRITOS', 'Control Escolar', 'arturo', '2007-09-03 15:13:07', 'Y', 'N');
INSERT INTO `news` VALUES ('35', 'MEDIA', 'DATOS DE ALUMNOS DE NUEVO INGRESO (REPORTE BUAP)\r\n\r\nALUMNOS -> NUEVO INGRESO', 'Control Escolar', 'arturo', '2007-09-04 12:40:26', 'Y', 'N');
INSERT INTO `news` VALUES ('36', 'MEDIA', 'Para Imprimir LIstas\r\n\r\n1.- carga academica \r\n2.-Seleccionar los cursos (maximo seis)\r\n3.-Escoger la accion: Imprimir Listas ', 'Control Escolar', 'arturo', '2007-09-07 09:01:07', 'Y', 'N');
INSERT INTO `news` VALUES ('37', 'ALTA', '<H2>CON LA FINALIDAD DE QUE LOS ALUMNOS VUELVAN A HACER SUS PAGOS VIA FICHAS DE BANCO AHORA LOS USUARIOS DE CONTROL ESCOLAR Y SECRETARIA ACADEMICA PUEDEN IMPRIMIR A LOS ALUMNOS FICHAS DE PAGO DE CUALQUIER ADEUDO</H2>', 'Todos', 'arturo', '2007-09-17 05:25:19', 'Y', 'N');
INSERT INTO `news` VALUES ('38', 'MEDIA', 'SE AGREGO EL MODULO <STRONG>PROFESORES</STRONG><BR>\r\n<p>\r\nhttp://www.serviciosestudiantiles.com/ici/maestros/login.php\r\n</p>\r\n<BR>\r\n\r\nPOR ESTA VEZ , PARA QUE LOS MAESTROS LO PUEDAN ACCESAR NECESITARAN QUE SE LES CREE UNA CONTRASENA. EN Maestros - EDITAR.\r\n\r\n', 'Todos', 'arturo', '2007-11-05 06:11:48', 'Y', 'N');
INSERT INTO `news` VALUES ('39', 'MEDIA', 'SE MODIFICARON LOS <STRONG>PERMISOS</STRONG> DE LAS CUENTAS DE LOS USUARIOS DE ACUERDO A LO REQUERIDO POR LA LIC. ANA MARIA.', 'Todos', 'arturo', '2007-11-05 07:36:42', 'Y', 'N');
INSERT INTO `news` VALUES ('40', 'ALTA', 'AUDITORIA INTERNA\r\n8 NOVIEMBRE DE 2007', 'Todos', 'v.hugo', '2007-11-08 10:34:09', 'Y', 'N');
INSERT INTO `news` VALUES ('41', 'MEDIA', 'GARCIA ORTIZ', 'Todos', 'arturo', '2007-11-27 12:39:10', 'Y', 'N');
INSERT INTO `news` VALUES ('43', null, '<h3><font  color=\"#FF0000\"> Importante (FAVOR DE LEER TODO): </font></h3>  \r\n<p>&nbsp;	\r\n<h4> <font size=\"+2\">Los alumnos deben mantener la misma matricula con la que se les da de alta en el Sistema durante toda su estancia en el Instituto.</font></h4>\r\n<p><font size=\"+2\">Si existe la necesidad de cambiarla por requisito de la BUAP, se debe usar un nuevo campo llamado <strong><font size=\"+1\" color=\"#990000\">Matricula OFICIAL BUAP\r\n</font></strong></font></p>\r\n<p ><font face=\"Courier New, Courier, monospace\" color=\"#0033FF\"> NO ES NECESARIO CAPTURAR LA <font color=\"#FF0000\">MATRICULA OFICIAL BUAP </font>PARA TODOS LOS ALUMNOS, SOLO PARA AQUELLOS QUE CAMBIEN CONFORME A LOS DATOS DE LA BUAP, EL SISTEMA DETECTARA SI HAY MATRICULA OFICIAL BUAP Y LA USARA PARA ACTAS, LISTAS Y OTROS DOCUMENTOS. SIN EMBARGO PARA FICHAS DE PAGO EL SISTEMA USARA LA MATRICULA (LA QUE SIEMPRE SE HA USADO)QUE SE LE ASIGNE AL ALUMNO DESDE SU INSCRIPCION.</font></p>\r\n<p >EL OBJETIVO DE ESTO ES QUE LOS DATOS DE PAGOS EN LOS QUE SE USA LA MATRICULA INICIAL , (CON LA QUE DESPUES SE GENERA EL DIGITO HSBC) NO SE PIERDAN AL CAMBIAR LA MATRICULA DEL ALUMNO. </p>\r\n<p >EL DIGITO HSBC QUE SE GENERA A PARTIR DE LA MATRICULA INICIAL DEL ALUMNO (ES ASI COMO SE DEBE CONTINUAR GENERANDO) NO DEBE CAMBIAR DURANTE TODA LA ESTANCIA DEL ALUMNO EN EL INSTITUTO, PARA QUE NO SE PIERDA LA REFERENCIA A LOS PAGOS QUE HA HECHO. SI HAY LA NECESIDAD DE QUE SE LE CAMBIE LA MATRICULA , ENTONCES SE DEBE USAR <font color=\"#FF0000\">EL CAMPO MATRICUAL OFICIAL BUAP</font></p>\r\n</h4></p><BR>Para capturar la matricula oficial buap(en caso de ser necesario) : alumnos->editar->matricula oficial BUAP', null, null, '2007-11-28 08:46:02', 'Y', 'N');
INSERT INTO `news` VALUES ('44', 'ALTA', '<H3>LOS MODULOS CARGA ACADEMICA Y LISTAS HAN  SIDO ACTUALIZADOS, AUN FALTAN MODULOS POR CAMBIAR, DICHOS CAMBIOS TOMARAN EFECTO DURANTE LOS PROXIMOS DIAS </H3>', 'Todos', 'arturo', '2008-01-08 02:47:49', 'Y', 'N');
INSERT INTO `news` VALUES ('45', 'MEDIA', 'LA ENCUESTA ES LISTA PARA SER USADA POR LOS ALUMNOS.', 'Todos', 'arturo', '2008-03-05 09:36:18', 'Y', 'N');
INSERT INTO `news` VALUES ('46', 'MEDIA', 'YA SE PEDEN AGREGAR ALUMNOS DESDE CARGA ACADEMICA A  LAS LISTAS.', 'Control Escolar', 'a.delosangeles', '2008-03-06 03:14:41', 'Y', 'N');
INSERT INTO `news` VALUES ('49', 'ALTA', '<object width=\"425\" height=\"344\"><param name=\"movie\" value=\"http://www.youtube.com/v/pxzg9kQoGik&hl=en&fs=1\"></param><param name=\"allowFullScreen\" value=\"true\"></param><embed src=\"http://www.youtube.com/v/pxzg9kQoGik&hl=en&fs=1\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" width=\"425\" height=\"344\"></embed></object>', 'Todos', 'arturo', '2008-08-04 11:00:07', 'Y', 'N');
INSERT INTO `news` VALUES ('51', 'MEDIA', 'SE PUEDEN SEGUIR AGREGANDO FOTOS DE ALUMNOS', 'Todos', 'arturo', '2008-08-12 07:30:59', 'Y', 'N');
INSERT INTO `news` VALUES ('54', 'BAJA', '\r\nCONEXION', 'Todos', 'j.javogalindo', '2013-11-27 16:11:27', 'Y', 'N');
INSERT INTO `news` VALUES ('55', 'ALTA', '\r\nEL INSTITUTO DE CIENCIAS JURÍDICAS DE PUEBLA LES DESEA UNAS FELICES VACACIONES!!!', 'Todos', 'c.margarita', '2013-11-28 16:24:38', 'Y', 'N');
INSERT INTO `news` VALUES ('59', 'ALTA', 'ALUMNOS NO TIENEN ACCESO A SISTEMA HASTA NUEVO AVISO. \r\n', 'Todos', 'm.mago', '2015-11-18 22:06:50', 'Y', 'N');
INSERT INTO `news` VALUES ('60', 'MEDIA', 'LOS ALUMNOS PUEDEN CONSULTAR CALIFICACIONES.\r\n', 'Todos', 'm.mago', '2016-01-11 09:53:19', 'Y', 'N');
INSERT INTO `news` VALUES ('61', 'ALTA', '<a Href = \"http://goo.gl/forms/3kF5FzR12v\"> <strong> Liga de requerimientos de sistema </strong> <a/><h3> Requiere inicio de sesión del correo institucional</h3>', 'Todos', 'mago', '2016-04-20 09:01:20', 'Y', 'N');

-- ----------------------------
-- Table structure for nocobrar
-- ----------------------------
DROP TABLE IF EXISTS `nocobrar`;
CREATE TABLE `nocobrar` (
  `nocobrar_id` int(255) unsigned NOT NULL,
  `alumno_id` int(255) unsigned NOT NULL,
  `noCobrarAcaper` int(255) NOT NULL,
  `NoCobrarAcaaa` int(255) NOT NULL,
  PRIMARY KEY (`nocobrar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nocobrar
-- ----------------------------

-- ----------------------------
-- Table structure for operators
-- ----------------------------
DROP TABLE IF EXISTS `operators`;
CREATE TABLE `operators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `unique` varchar(255) DEFAULT NULL,
  `enrollment` varchar(255) DEFAULT NULL,
  `curp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of operators
-- ----------------------------
INSERT INTO `operators` VALUES ('1', 'Arturo(Op)', 'arturo.delosangeles@sintesys.us12', '', 'de los Angeles', '1', '0', '94b2d06e-b08d-41f5-a8d0-90ff7fb99e55', '559966', 'aaa');
INSERT INTO `operators` VALUES ('2', 'Jose', 'arturo', 'salgado', null, '1', '0', null, null, null);
INSERT INTO `operators` VALUES ('3', 'Pio', 'arturo', 'angeles', null, '1', '0', null, null, null);
INSERT INTO `operators` VALUES ('4', null, 'arturo@java.com', 'myrna101', null, null, '0', null, null, null);
INSERT INTO `operators` VALUES ('5', null, 'mahetzi', 'mahetzi', null, null, '0', null, null, null);
INSERT INTO `operators` VALUES ('6', null, 'colegio@gmail.com', 'myrna101', null, null, '0', null, null, null);
INSERT INTO `operators` VALUES ('1001', null, 'belly', 'belly', 'de los angeles', null, '0', null, null, null);
INSERT INTO `operators` VALUES ('1002', 'arturo', 'arturo.delosangeles@sintesys.us1', 'wnn4m7nd', 'salgado1', '1', '0', 'b42c440d-d1d1-4f16-a07e-947c87aa3b73', '960005911', null);
INSERT INTO `operators` VALUES ('1003', 'mago', 'arturo.delosangeles@sintesys.us', 'myrna101', 'lopez', '11', '0', 'b7a7737c-af6e-492a-a819-9b4fe06d4670', '555', 'test');
INSERT INTO `operators` VALUES ('1004', 'JENNIFFER GUZMAN', 'jen@gmail.com', 'myrna101', 'GUZMAN', '1', '0', 'b65e5da3-6476-4760-8cf1-ac642a9e6635', '5555', 'Aesa17q21');

-- ----------------------------
-- Table structure for participantes
-- ----------------------------
DROP TABLE IF EXISTS `participantes`;
CREATE TABLE `participantes` (
  `participante_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `modified` date NOT NULL,
  `visible` varchar(3) NOT NULL DEFAULT 'Y',
  `borrado` varchar(3) NOT NULL DEFAULT 'N',
  `user` varchar(50) NOT NULL,
  `evento` int(10) NOT NULL,
  PRIMARY KEY (`participante_id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participantes
-- ----------------------------
INSERT INTO `participantes` VALUES ('1', 'VILLEGAS', 'CABRERA', 'HUGO ENRIQUE', '2015-09-22', 'Y', 'N', '', '4');
INSERT INTO `participantes` VALUES ('2', 'ROMERO', 'VARGAS', 'PEDRO', '2007-12-06', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('3', 'E', 'E', 'DIPLOMADO EN CRIMINOLOGIA', '2007-12-06', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('4', 'PEREZ', 'LOPEZ', 'EJEMPLO', '2007-12-06', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('5', 'KOZIOL', 'WEISS', 'GABRIELE', '2007-12-06', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('6', 'EJEMPLO', 'EJEMPLO', 'EJEMPLO', '2008-05-08', 'Y', 'N', '', '0');
INSERT INTO `participantes` VALUES ('7', 'E', 'E', 'E', '2008-05-08', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('8', 'E', 'E', 'E', '2008-05-08', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('9', 'AGUILAR', 'CALDERON', 'ALEJO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('10', 'ALDACO ', 'VELEZ', 'RAUL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('11', 'ALEJO', 'LEZAMA', 'ESTEFANI ANAHI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('12', 'ALVARADO ', 'HERRERA ', 'VICTOR MANUEL ', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('13', 'AMBROCIO', 'ALVAREZ', 'CAROLINA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('14', 'AVENDAÑO ', 'Y MONTIEL', 'GERARDO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('15', 'BADILLO', 'CORTES', 'MAYOLA ACACIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('16', 'BAUTISTA', 'HERNANDEZ', 'MIGUEL ANGEL', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('17', 'BALTAZAR', 'HERNANDEZ', 'JOSUE YAHIR', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('18', 'BRIONES', 'NAVA ', 'MARISOL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('19', 'CAMACHO', 'GARCIA', 'MARCO ANTONIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('20', 'CAMPOS', 'GIL', 'IRVIN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('21', 'CARRILLO', 'SANCHEZ', 'ROCIO VIALETH', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('22', 'CASTILLO', 'LOPEZ', 'EMMA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('23', 'CUAHUEY', 'SALAZAR ', 'LAURO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('24', 'CHACON', 'CANO', 'MARIA DE LOS ANGELES', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('25', 'DE LA PEÑA ', 'FIGUEROA', 'CYNTIA NAYELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('26', 'DURAN', 'VALENCIA', 'EVA ARELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('27', 'ESPARZA', 'BONILLA', 'NORA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('28', 'ESPINA', 'HUERTA', 'CESAR', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('29', 'ESPINOZA', 'FLORES', 'ADELINA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('30', 'ESPINOSA', 'TLATOA', 'EDUARDO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('31', 'FARFAN', 'AYALA', 'DULCE ELENA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('32', 'GONZALEZ', 'BERNAL', 'ARIANNE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('35', 'GONZALEZ', 'LOZANO', 'MARISOL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('33', 'GARCIA', 'GARCIA', 'JOAB', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('34', 'GONZALEZ', 'BERNAL', 'ARIANNE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('36', 'GUEVARA ', 'MARTINEZ', 'VICTOR HUGO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('37', 'GUEVARA ', 'PATRON', 'ARACELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('38', 'HERNANDEZ', 'CASTELL', 'ESMERALDA DONAJHI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('39', 'HERNANDEZ', 'GUEVARA', 'DENISS', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('40', 'HERNANDEZ ', 'MEJIA', 'OSCAR SEBASTIAN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('41', 'HERNANDEZ', 'RAMIREZ', 'ERICK ETELBERTO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('42', 'HERNANDEZ', 'TLACUILO', 'MAURICIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('43', 'HERRERA', 'DE LA ROSA', 'JOSE DELFINO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('44', 'JUAREZ', 'MERINO', 'ESPERANZA INGRY', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('45', 'JUAREZ', 'QUIROZ', 'EFREN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('46', 'LADINO', 'MORALES', 'BRAULIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('47', 'LARA', 'CERVANTES', 'ISAURO SAUL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('48', 'LEON', 'LANDA', 'ARELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('49', 'LOPEZ ', 'VELEZ', 'DIANA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('50', 'MARIA', 'MACEDA', 'ALFREDO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('51', 'MARQUEZ', 'ESCOBEDO', 'JOSE ANTONIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('52', 'MARQUEZ', 'ESCOBEDO', 'MARTHA YANIN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('53', 'MARTINEZ', 'BRAVO', 'ALMA LORENA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('54', 'MEDEL ', 'CORIO', 'RAQUEL YASMIN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('55', 'MENDEZ', 'JIMENEZ', 'MARIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('56', 'MENDEZ', 'PEREZ', 'ALMA SELENE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('57', 'MENDEZ', 'ZAMBRANO', 'ETHIEN MIGUEL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('58', 'MENDOZA ', 'JIMENEZ', 'MARIA FERNANDA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('59', 'MENDOZA ', 'LIMA ', 'JOSE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('60', 'MENDOZA ', 'ROMERO', 'MONTSERRAT CAROLINA', '2008-05-21', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('61', 'MEZA', 'DELGADO', 'GERARDO ENCARNACION', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('62', 'MORALES', 'CARO', 'BRENDA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('63', 'MORENO', 'CID', 'ALICIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('64', 'MUÑOZ ', 'PEREZ', 'ADRIANA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('65', 'MUÑOZ ', 'ROSAS', 'CARLO FELIPE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('66', 'NAVA', 'ALVARADO', 'GERARDO DE JESUS', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('67', 'OLMOS ', 'LUNA', 'LUZ ADRIANA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('68', 'OROZCO', 'ALDAVE', 'JOSUE ANTONIO', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('69', 'PAREDES ', 'MORALES', 'JUAN ALBERTO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('70', 'PEÑA ', 'SOTO', 'MARIA DEL CARMEN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('71', 'PEREZ', 'MONTAÑO', 'PATRICIA JAQUELINE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('72', 'PEREZ', 'OROZCO', 'EVELYN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('73', 'PICAZO', 'APARICIO', 'HERMES ULISES', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('74', 'PLATAS', 'HERRERA', 'RAUL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('75', 'PORRAS ', 'MINUTTI', 'ALFREDO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('76', 'RAMIREZ', 'MARTINEZ', 'ALBERTO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('77', 'REYES', 'OSORIO', 'MARTIN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('78', 'REYES', 'PACHECO', 'MARIA CONCEPCION', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('79', 'RIVERA', 'BARRADAS', 'ADRIANA', '2008-05-21', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('80', 'RODRIGUEZ', 'ARCIGA', 'MARIA ADRIANA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('81', 'RODRIGUEZ', 'BARRERA', 'MARIA ALBERTINA', '2008-05-21', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('82', 'RODRIGUEZ', 'HERNANDEZ', 'ELIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('83', 'RODRIGUEZ', 'NECOECHEA', 'PRISCILA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('84', 'RUEDA', 'TOLAMA', 'BRENDA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('85', 'SALAZAR', 'ROMERO', 'ARACELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('86', 'SALGADO', 'BECERRA', 'NAYELI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('87', 'SANCHEZ', 'AGUILAR ', 'MARIANA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('88', 'SANCHEZ', 'MANZANO', 'OSCAR', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('89', 'SANCHEZ', 'MENDIETA', 'LORENA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('90', 'SANCHEZ', 'SALAZAR ', 'JOSE GABRIEL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('91', 'SANTOS ', 'HERRERA', 'ROMINA ARTEMIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('92', 'SAYON', 'JUAN', 'JACQUELINE LILIAN', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('93', 'SERDIO', 'SANTILLANA', 'ARIADNA CECILIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('94', 'SOTO', 'SANTIESTEBAN', 'JESUS', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('95', 'TRANQUILINO', 'MENDEZ', 'FLAVIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('96', 'TREJO ', 'RENDON', 'EIRA YARMELLI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('97', 'UC YAM', 'NAVA', 'LILIA GUADALUPE', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('98', 'VALENZUELA ', 'ALVARADO', 'RICARDO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('99', 'VARGAS', 'ORDAZ', 'RIGOBERTO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('100', 'VALADEZ', 'GARCIA', 'ERNESTO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('101', 'VAZQUEZ', 'MARTINEZ', 'JOSE ANTONIO', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('102', 'VAZQUEZ', 'VAZQUEZ', 'JUAN CARLOS', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('103', 'VELEZ', 'MERINO', 'VERONICA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('104', 'VERA', 'HERNANDEZ', 'CORAL', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('105', 'XIQUE', 'LUNA', 'LILIA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('106', 'ZACATZONTEL', 'SOTO', 'SALVADOR', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('107', 'ZAVALA', 'MONROY', 'DENHI', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('108', 'ZAVALETA', 'MIRON', 'ESTRELLA', '2008-05-12', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('109', 'ANALCO', 'RODRIGUEZ', 'WENDY', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('110', 'BONIFACIO', 'GARCIA', 'DIANA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('111', 'CABAGNE', 'HERNANDEZ', 'ANABEL', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('112', 'CESPEDES', 'COATECONTZI', 'MARTHA PATRICIA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('113', 'COATL ', 'CUAYA', 'CARINA PAULA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('114', 'DE LA TORRE', 'SERRANO', 'SELENE', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('115', 'GONZALEZ', 'HERRERA', 'DANIELA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('116', 'GUADARRAMA', 'LOBATON', 'CLAUDIA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('117', 'VELAZQUEZ', 'HERNANDEZ', 'ANDREA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('118', 'MARTINEZ', 'MARTINEZ', 'MARIANA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('119', 'MOTA', 'FLORES', 'MARTHA VIRIDIANA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('120', 'MOUNAYER', 'MARIN', 'ELIAS', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('121', 'OROPEZA', 'HERNANDEZ', 'VERONICA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('122', 'PALACIOS', 'GONZALEZ', 'GISSEL MARIA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('123', 'PEÑA', 'MORENO', 'MARIO ALBERTO', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('124', 'SALAZAR', 'OSORIO', 'GRACIELA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('125', 'VALDEZ', 'SANCHEZ', 'DIANA', '2008-05-19', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('133', 'CUMPLIDO', 'RODRIGUEZ', 'RAUL', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('132', 'CUMPLIDO', 'RODRIGUEZ', 'RAUL', '2008-05-23', 'Y', 'N', '', '0');
INSERT INTO `participantes` VALUES ('131', 'RAMOS ZACARIAS OMMAR', '', '', '0000-00-00', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('130', 'BARAJAS MONTIEL ROXANA LOURDES', '', '', '0000-00-00', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('134', 'FLORES', 'RUIZ', 'LLUVIA DEL CARMEN', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('135', 'PACHECO', 'HERNANDEZ', 'JOSUE DAVID', '2008-05-23', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('136', 'SORIANO ROSAS SIRILO', '', '', '0000-00-00', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('137', 'TERCERO JUAREZ GRISEL', '', '', '0000-00-00', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('138', 'HERNANDEZ VELAZQUEZ ANDREA', '', '', '0000-00-00', 'Y', 'N', '', '2');
INSERT INTO `participantes` VALUES ('139', 'VARGAS HERNANDEZ FRANCISCO JAVIER', '', '', '0000-00-00', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('140', 'VAZQUEZ DEL ROSARIO ALEJANDRA', '', '', '0000-00-00', 'Y', 'N', '', '1');
INSERT INTO `participantes` VALUES ('141', 'QUIROZ MANZANO JOSELYN', '', '', '0000-00-00', 'Y', 'N', '', '3');
INSERT INTO `participantes` VALUES ('142', 'VELEZ AGUILAR MARICELA', '', '', '0000-00-00', 'Y', 'N', '', '4');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `tuition_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `paymenttype_id` int(11) DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('154', null, '0', '0000-00-00 00:00:00', '2017-07-16 11:38:45', null, '1500.00', '20', '1', null, '165710bc-665d-4827-9140-6c7e54df73f3');
INSERT INTO `payments` VALUES ('155', null, '0', '2017-07-16 00:35:34', '2017-07-16 00:35:34', null, '6500.00', '20', '12020', null, 'b8582f6e-5d42-43a3-9b85-b7468ec55db2');
INSERT INTO `payments` VALUES ('156', null, '0', '0000-00-00 00:00:00', '2017-07-16 00:46:43', null, '3200.00', '25', '12020', null, 'c2913577-e833-44fb-815f-5400373ca0cc');
INSERT INTO `payments` VALUES ('157', null, '0', '2017-07-16 00:36:04', '2017-07-16 00:36:04', null, '1500.00', '23', '12020', null, 'dc911615-3022-4103-b596-190350a37fad');
INSERT INTO `payments` VALUES ('158', null, '0', '0000-00-00 00:00:00', '2017-07-16 00:47:59', null, '5500.00', '17', '1', null, '90a46f33-818e-4d3e-a64e-afc21be1c063');
INSERT INTO `payments` VALUES ('159', null, '0', '2017-07-16 02:16:48', '2017-07-16 02:16:48', null, '1500.00', '23', '12065', null, 'b495d2b8-86e6-4902-8814-390880e358ac');
INSERT INTO `payments` VALUES ('160', null, '0', '0000-00-00 00:00:00', '2017-07-16 10:57:26', null, '650.00', '18', '1', null, 'b85ed108-c445-4dfd-87c2-5cd4f7ab4a7b');
INSERT INTO `payments` VALUES ('161', null, '0', '2017-07-16 10:57:36', '2017-07-16 10:57:36', null, '1500.00', '19', '1', null, '5bdd6217-43ed-41ae-a443-ddf5f2118f82');
INSERT INTO `payments` VALUES ('162', null, '0', '2017-07-16 12:43:12', '2017-07-16 12:43:12', null, '6000.00', '24', '1', null, '87fac9a9-de01-4608-a9b3-960c1d408792');

-- ----------------------------
-- Table structure for payments_mine
-- ----------------------------
DROP TABLE IF EXISTS `payments_mine`;
CREATE TABLE `payments_mine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `tuition_id` int(11) DEFAULT NULL,
  `debit_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments_mine
-- ----------------------------

-- ----------------------------
-- Table structure for paymenttypes
-- ----------------------------
DROP TABLE IF EXISTS `paymenttypes`;
CREATE TABLE `paymenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paymenttypes
-- ----------------------------
INSERT INTO `paymenttypes` VALUES ('1', 'Efectivo', '0', '2017-07-06 05:23:25', '2017-07-06 05:23:25', '1');
INSERT INTO `paymenttypes` VALUES ('2', 'Paypal', '0', '2017-07-06 05:23:27', '2017-07-06 05:23:27', '1');
INSERT INTO `paymenttypes` VALUES ('3', 'Tarjeta de Credito', '0', '2017-07-06 05:23:32', '2017-07-06 05:23:32', '1');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `add_users` varchar(1) DEFAULT NULL,
  `delete_users` varchar(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES ('1', 'admin', '2017-07-23 00:29:45', '2017-07-23 00:29:45', null, null, 'Directivo');
INSERT INTO `profiles` VALUES ('2', 'teachers', '2017-07-23 00:29:51', '2017-07-23 00:29:51', null, null, 'Docente');
INSERT INTO `profiles` VALUES ('3', 'students', '2017-07-23 00:29:54', '2017-07-23 00:29:54', null, null, 'Alumno');
INSERT INTO `profiles` VALUES ('4', 'super_admin', '2017-07-23 00:30:00', '2017-07-23 00:30:00', null, null, 'Super');
INSERT INTO `profiles` VALUES ('5', 'operator', '2017-07-23 04:27:08', '2017-07-22 21:27:08', null, null, 'Administrativo');

-- ----------------------------
-- Table structure for profiles_users
-- ----------------------------
DROP TABLE IF EXISTS `profiles_users`;
CREATE TABLE `profiles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of profiles_users
-- ----------------------------

-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of programs
-- ----------------------------
INSERT INTO `programs` VALUES ('1', 'Maternal', '0', '2017-06-27 02:31:43', '2017-06-27 02:31:43', '1');
INSERT INTO `programs` VALUES ('2', 'Kinder', '0', '2017-06-27 02:34:13', '2017-06-27 02:34:13', '1');
INSERT INTO `programs` VALUES ('3', 'Primaria', '0', '2017-06-27 02:34:15', '2017-06-27 02:34:15', '1');
INSERT INTO `programs` VALUES ('4', 'Secundaria', '0', '2017-06-27 02:34:14', '2017-06-27 02:34:14', '1');
INSERT INTO `programs` VALUES ('5', 'Bachillerato/Preparatoria', '0', '2017-06-27 02:34:16', '2017-06-27 02:34:16', '1');
INSERT INTO `programs` VALUES ('6', 'Licenciatura en Psicologia', '0', '2017-06-27 02:34:17', '2017-06-27 02:34:17', '1');
INSERT INTO `programs` VALUES ('7', 'Ing. en Sistemas', '0', '2017-06-27 02:34:18', '2017-06-27 02:34:18', '1');
INSERT INTO `programs` VALUES ('8', 'Maestria en Technologia de la Informacion', '0', '2017-06-27 02:34:19', '2017-06-27 02:34:19', '1');
INSERT INTO `programs` VALUES ('9', 'Doctorado en Educacion', '0', '2017-06-27 02:34:20', '2017-06-27 02:34:20', '1');

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `school_id` int(4) DEFAULT '1',
  `notes` varchar(255) DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('1', 'Chris', '1', 'test\nsimon\n\ncall as it should be\nhttp://kmadigital.com/api/inde\nx.php/service/action/find_hash/\nusername/abcd/pass/9098098/hash/7891\n2121121221/campaign_id/54\n\nwE NOW NEED TO RESTRICT THE CHARS IN PASSWORD, USERNAME\n', '0');
INSERT INTO `projects` VALUES ('2', 'michelle', '1', null, '0');
INSERT INTO `projects` VALUES ('3', 'ici', '1', null, '0');
INSERT INTO `projects` VALUES ('4', 'Rifas', '1', null, '0');
INSERT INTO `projects` VALUES ('5', 'Chris', '1', null, '0');
INSERT INTO `projects` VALUES ('6', 'escuela', '1', null, '0');
INSERT INTO `projects` VALUES ('7', 'Chris Sunday', '1', null, '0');
INSERT INTO `projects` VALUES ('8', 'test project', '1', null, '0');
INSERT INTO `projects` VALUES ('9', 'examen', '1', null, '0');
INSERT INTO `projects` VALUES ('10', 'TODO LIST', '1', null, '0');
INSERT INTO `projects` VALUES ('11', 'tareas 22 mayo', '1', null, '0');
INSERT INTO `projects` VALUES ('12', 'KMA Admin/Client Bugs', '1', null, '0');
INSERT INTO `projects` VALUES ('13', 'actual', '1', null, '0');
INSERT INTO `projects` VALUES ('14', 'Mail trigger', '1', 'things', '0');
INSERT INTO `projects` VALUES ('15', 'Pending', '1', 'las cosas que se me ocurran que no pueda hacer por estar dentro de los 20 mins', '0');
INSERT INTO `projects` VALUES ('16', 'escuela escuela', '1', 'la escuela como tal ', '0');
INSERT INTO `projects` VALUES ('17', 'escuela pagina', '1', 'la pagina web de la escuela', '0');
INSERT INTO `projects` VALUES ('18', 'Valet-RDI', '1', 'update \naccording to annotations', '0');
INSERT INTO `projects` VALUES ('19', 'FIN DE SEMANA 17-18 DE JUNIO', '1', 'THINGKS TO DO ', '0');
INSERT INTO `projects` VALUES ('20', 'Escuela Nuevos Temas', '1', 'temas \nfin de junio \ninicios de Julio', '0');
INSERT INTO `projects` VALUES ('21', 'Liberty', '1', 'liberty site', '0');
INSERT INTO `projects` VALUES ('22', 'LEAVE', '1', 'THINGS TO DO BEFORE LEAVING', '0');
INSERT INTO `projects` VALUES ('23', 'SMART-VACATIONS', '1', 'THINGS I CHANGED \nON EMERGENCY ', '0');
INSERT INTO `projects` VALUES ('24', 'CRITICAL 2 ', '1', 'test', '0');

-- ----------------------------
-- Table structure for projects_copy
-- ----------------------------
DROP TABLE IF EXISTS `projects_copy`;
CREATE TABLE `projects_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projects_copy
-- ----------------------------
INSERT INTO `projects_copy` VALUES ('1', 'escuela');
INSERT INTO `projects_copy` VALUES ('2', 'floretia');
INSERT INTO `projects_copy` VALUES ('3', 'develop school');
INSERT INTO `projects_copy` VALUES ('4', 'Chris Dautorio');
INSERT INTO `projects_copy` VALUES ('5', 'ICI');
INSERT INTO `projects_copy` VALUES ('6', 'Carnatz');
INSERT INTO `projects_copy` VALUES ('7', 'general system features');
INSERT INTO `projects_copy` VALUES ('8', 'michelle');
INSERT INTO `projects_copy` VALUES ('9', 'book');
INSERT INTO `projects_copy` VALUES ('12', 'rifas');
INSERT INTO `projects_copy` VALUES ('10', 'blog');
INSERT INTO `projects_copy` VALUES ('11', 'Future development and fixes');
INSERT INTO `projects_copy` VALUES ('13', 'SCHOOL WEB SITE');
INSERT INTO `projects_copy` VALUES ('14', 'test');
INSERT INTO `projects_copy` VALUES ('15', 'Indicidual tasks RObert Hilton');
INSERT INTO `projects_copy` VALUES ('16', 'Robert Billing');
INSERT INTO `projects_copy` VALUES ('17', 'KMA DEMO');
INSERT INTO `projects_copy` VALUES ('18', 'aaa');

-- ----------------------------
-- Table structure for projects_tasks
-- ----------------------------
DROP TABLE IF EXISTS `projects_tasks`;
CREATE TABLE `projects_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projects_tasks
-- ----------------------------
INSERT INTO `projects_tasks` VALUES ('1', '1', '1');
INSERT INTO `projects_tasks` VALUES ('2', '2', '2');
INSERT INTO `projects_tasks` VALUES ('3', '3', '1');
INSERT INTO `projects_tasks` VALUES ('4', '4', '1');
INSERT INTO `projects_tasks` VALUES ('5', '5', '1');
INSERT INTO `projects_tasks` VALUES ('6', '6', '3');
INSERT INTO `projects_tasks` VALUES ('7', '7', '3');
INSERT INTO `projects_tasks` VALUES ('8', '8', '4');
INSERT INTO `projects_tasks` VALUES ('9', '9', '5');
INSERT INTO `projects_tasks` VALUES ('10', '10', '5');
INSERT INTO `projects_tasks` VALUES ('11', '11', '8');
INSERT INTO `projects_tasks` VALUES ('12', '12', '8');
INSERT INTO `projects_tasks` VALUES ('13', '13', '2');
INSERT INTO `projects_tasks` VALUES ('14', '14', '9');
INSERT INTO `projects_tasks` VALUES ('15', '15', '9');
INSERT INTO `projects_tasks` VALUES ('16', '16', '6');
INSERT INTO `projects_tasks` VALUES ('17', '17', '10');
INSERT INTO `projects_tasks` VALUES ('18', '18', '11');
INSERT INTO `projects_tasks` VALUES ('19', '19', '11');
INSERT INTO `projects_tasks` VALUES ('20', '20', '12');
INSERT INTO `projects_tasks` VALUES ('21', '21', '12');
INSERT INTO `projects_tasks` VALUES ('22', '22', '12');
INSERT INTO `projects_tasks` VALUES ('23', '23', '12');
INSERT INTO `projects_tasks` VALUES ('24', '24', '12');
INSERT INTO `projects_tasks` VALUES ('25', '25', '12');
INSERT INTO `projects_tasks` VALUES ('26', '26', '10');
INSERT INTO `projects_tasks` VALUES ('27', '27', '12');
INSERT INTO `projects_tasks` VALUES ('28', '28', '13');
INSERT INTO `projects_tasks` VALUES ('29', '29', '13');
INSERT INTO `projects_tasks` VALUES ('30', '30', '14');
INSERT INTO `projects_tasks` VALUES ('31', '31', '15');
INSERT INTO `projects_tasks` VALUES ('32', '32', '14');
INSERT INTO `projects_tasks` VALUES ('33', '33', '14');
INSERT INTO `projects_tasks` VALUES ('34', '34', '14');
INSERT INTO `projects_tasks` VALUES ('35', '35', '16');
INSERT INTO `projects_tasks` VALUES ('36', '36', '16');
INSERT INTO `projects_tasks` VALUES ('37', '37', '16');
INSERT INTO `projects_tasks` VALUES ('38', '38', '16');
INSERT INTO `projects_tasks` VALUES ('39', '39', '16');
INSERT INTO `projects_tasks` VALUES ('40', '40', '16');
INSERT INTO `projects_tasks` VALUES ('41', '41', '1');
INSERT INTO `projects_tasks` VALUES ('42', '42', '1');
INSERT INTO `projects_tasks` VALUES ('43', '43', '18');
INSERT INTO `projects_tasks` VALUES ('44', '44', '1');
INSERT INTO `projects_tasks` VALUES ('45', '45', '1');
INSERT INTO `projects_tasks` VALUES ('46', '46', '16');
INSERT INTO `projects_tasks` VALUES ('47', '47', '16');
INSERT INTO `projects_tasks` VALUES ('48', '48', '16');
INSERT INTO `projects_tasks` VALUES ('49', '49', '16');
INSERT INTO `projects_tasks` VALUES ('50', '50', '16');
INSERT INTO `projects_tasks` VALUES ('51', '51', '19');
INSERT INTO `projects_tasks` VALUES ('52', '52', '19');
INSERT INTO `projects_tasks` VALUES ('53', '53', '19');
INSERT INTO `projects_tasks` VALUES ('54', '54', '19');
INSERT INTO `projects_tasks` VALUES ('55', '55', '20');
INSERT INTO `projects_tasks` VALUES ('56', '56', '20');
INSERT INTO `projects_tasks` VALUES ('57', '57', '1');
INSERT INTO `projects_tasks` VALUES ('58', '58', '21');
INSERT INTO `projects_tasks` VALUES ('59', '59', '21');
INSERT INTO `projects_tasks` VALUES ('60', '60', '21');
INSERT INTO `projects_tasks` VALUES ('61', '61', '21');
INSERT INTO `projects_tasks` VALUES ('62', '62', '1');
INSERT INTO `projects_tasks` VALUES ('63', '63', '22');
INSERT INTO `projects_tasks` VALUES ('64', '64', '22');
INSERT INTO `projects_tasks` VALUES ('65', '65', '22');
INSERT INTO `projects_tasks` VALUES ('66', '66', '22');
INSERT INTO `projects_tasks` VALUES ('67', '67', '22');
INSERT INTO `projects_tasks` VALUES ('68', '68', '22');
INSERT INTO `projects_tasks` VALUES ('69', '69', '22');
INSERT INTO `projects_tasks` VALUES ('70', '70', '22');
INSERT INTO `projects_tasks` VALUES ('71', '71', '23');
INSERT INTO `projects_tasks` VALUES ('72', '72', '23');
INSERT INTO `projects_tasks` VALUES ('73', '73', '23');
INSERT INTO `projects_tasks` VALUES ('74', '74', '23');
INSERT INTO `projects_tasks` VALUES ('75', '75', '23');
INSERT INTO `projects_tasks` VALUES ('76', '76', '23');
INSERT INTO `projects_tasks` VALUES ('77', '77', '23');
INSERT INTO `projects_tasks` VALUES ('78', '78', '24');

-- ----------------------------
-- Table structure for public_features
-- ----------------------------
DROP TABLE IF EXISTS `public_features`;
CREATE TABLE `public_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `package_id` enum('1','2','3') DEFAULT '1',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of public_features
-- ----------------------------
INSERT INTO `public_features` VALUES ('1', 'Alumnos', 'Ver Calificaciones\r\nVer Tareas\r\nVer Pagos\r\n', '1', 'fa-address-book');
INSERT INTO `public_features` VALUES ('2', 'Docentes', 'Calificaciones\r\nLista de Asistencia\r\nDejar tareas', '1', 'fa-users');
INSERT INTO `public_features` VALUES ('3', 'Administrativos', 'Armar Horarios\r\nArmar Grupos\r\nEstablecer Colegiaturas\r\nManejo de Alumnos\r\nManejo de Docentes\r\nBuzon de Sugerencias Anomimo para los Alumnos/Padres de Familia\r\nEventos\r\nAdministrar Pagos\r\n\r\n', '1', 'fa-user');
INSERT INTO `public_features` VALUES ('4', 'Tareas', 'Permite a los docentes asignar tareas', '1', 'fa-tasks');
INSERT INTO `public_features` VALUES ('5', 'Eventos', 'Docentes y Administrativos pueden publicar eventos', '1', 'fa-calendar');
INSERT INTO `public_features` VALUES ('6', 'Colegiaturas', 'Permite administrar y programar las colegiaturas. Asi como llevar registro de adeudos.', '1', 'fa-money');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mon_beg` time DEFAULT NULL,
  `mon_end` time DEFAULT NULL,
  `tue_beg` time DEFAULT NULL,
  `tue_end` time DEFAULT NULL,
  `wed_beg` time DEFAULT NULL,
  `wed_end` time DEFAULT NULL,
  `thu_beg` time DEFAULT NULL,
  `thu_end` time DEFAULT NULL,
  `fri_beg` time DEFAULT NULL,
  `fri_end` time DEFAULT NULL,
  `sat_beg` time DEFAULT NULL,
  `sat_end` time DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedules
-- ----------------------------
INSERT INTO `schedules` VALUES ('20', '17:00:00', '20:50:00', '13:00:00', '14:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '11', null, '17', null);

-- ----------------------------
-- Table structure for schools
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schools
-- ----------------------------
INSERT INTO `schools` VALUES ('1', 'Colegio Europeo', 'colegio_europeo', '937b27a6-efff-4065-a9e9-3c117d8c002c', '2017-07-22 22:29:15', '2017-07-22 22:29:15', '0');
INSERT INTO `schools` VALUES ('2', 'mahetziramirez', 'mahetzi', null, '2017-07-22 19:57:26', '2017-07-22 19:57:26', '1');
INSERT INTO `schools` VALUES ('3', 'mahetzi-test', 'mahetzi', null, '2017-07-22 19:57:26', '2017-07-22 19:57:26', '1');
INSERT INTO `schools` VALUES ('4', 'quintana roo ggg', 'quintana', null, '2017-07-22 19:57:29', '2017-07-22 19:57:29', '1');
INSERT INTO `schools` VALUES ('5', 'popocatepetl', 'popocatepetl', null, '2017-07-22 19:57:27', '2017-07-22 19:57:27', '1');
INSERT INTO `schools` VALUES ('6', 'colegio mexico', 'colegio_mexico', null, '2017-07-22 19:57:30', '2017-07-22 19:57:30', '1');
INSERT INTO `schools` VALUES ('7', 'Colegio Mauillido', 'colegio_maullido', null, '2017-07-22 19:57:31', '2017-07-22 19:57:31', '1');
INSERT INTO `schools` VALUES ('8', 'Colegio Quintana roo', 'quintana_roo', null, '2017-07-22 19:57:32', '2017-07-22 19:57:32', '1');
INSERT INTO `schools` VALUES ('9', 'patito', 'patito', 'cdba94cd-4645-4d40-b1ec-be5893086c10', '2017-07-22 22:51:48', '2017-07-22 15:51:48', '0');
INSERT INTO `schools` VALUES ('10', 'Instituto de Ciencias Juridicas', 'ici', 'fa81064f-dd5b-4859-ab0d-df3d97c642e4', '2017-07-23 02:51:08', '2017-07-22 19:51:08', '0');
INSERT INTO `schools` VALUES ('11', 'Centro de Estudios Superiores de Tlaxcala', 'cest', 'd2d0c293-13bf-458a-bf15-1e91a44834f2', '2017-07-23 03:01:20', '2017-07-22 20:01:20', '0');

-- ----------------------------
-- Table structure for schools_users
-- ----------------------------
DROP TABLE IF EXISTS `schools_users`;
CREATE TABLE `schools_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schools_users
-- ----------------------------
INSERT INTO `schools_users` VALUES ('1', '1', '1');
INSERT INTO `schools_users` VALUES ('2', '2', '2');
INSERT INTO `schools_users` VALUES ('3', '3', '3');
INSERT INTO `schools_users` VALUES ('4', '4', '2');
INSERT INTO `schools_users` VALUES ('5', '5', '3');
INSERT INTO `schools_users` VALUES ('6', '6', '6');
INSERT INTO `schools_users` VALUES ('7', '1001', '7');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `second_last_name` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `photo_raw_name` varchar(255) DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT 'soft delete to recover in reports, payments, etc',
  `email` varchar(255) DEFAULT NULL,
  `address` tinytext,
  `enrollment` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `blood_id` int(11) DEFAULT NULL,
  `curp` varchar(255) DEFAULT NULL,
  `tutor` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `gender_id` int(255) DEFAULT NULL,
  `alumnoestado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12070 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', 'bellissa', 'de los angeles', 'ramirez', '1', 'doctor-6.jpg', '1cd0022b34de22b3211d156af6387ed0_thumb.jpg', 'a3302edc-40de-4e21-a491-e3ef2cec7867', '0', 'josearturodelosangeles@gmail.com', 'rio sabinas\n6126\nSan Manuel\n72570', '55664477', 'd41d8cd98f00b204e9800998ecf8427e', '2', '72570', 'Arturo', '2336283', '2228617291', '2', null);
INSERT INTO `students` VALUES ('2', 'Perla', 'Rosas', 'Perez', '1', 'ccca1.jpg', '_86134032_gettyimages-473251958_thumb.jpg', 'daa30203-683d-4cbc-a578-d6fa5f268fb8', '1', 'tesr@gmail.com', '291 old gate ln\nUnit D', '960005911', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('3', 'arturo', 'popopopoppo', 'ppppp', '1', 'person-1.jpg', 'Spiky-Men-Hair-for-a-Round-Face_thumb.jpg', '8e0e930f-7e89-4c90-9ebb-7641f7c545b6', '0', 'josearturodelosangeles@gmail.com', '', '5235234599999999', 'd41d8cd98f00b204e9800998ecf8427e', '0', '', '', '', '', '0', null);
INSERT INTO `students` VALUES ('12020', 'Horus', 'de los angeles', 'ramirez', '1', 'orus.jpg', 'professor-21_thumb.jpg', '9f1dcd8d-b0e8-424e-873d-3f610b728e20', '0', 'orus@mailcat.com', 'Rio Grijalva 6117\nSan Manuel\nPuebla \n72570', '555666999', 'd41d8cd98f00b204e9800998ecf8427e', '2', 'Aesa17q21hdfnlr06', 'bellissa de los angeles ramirez', '2336283', '2228617291', null, null);
INSERT INTO `students` VALUES ('12021', 'aleida', 'de los angeles', 'ramirez', '1', 'professor-52.jpg', 'professor-5_thumb.jpg', '26e2b4ce-6696-48c1-98a7-85f5b8d506e0', '0', 'ecuses@gmail.com', 'Rio Sabinas 6126', '015555595603', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12022', 'pepe', '', '', '1', 'Spiky-Men-Hair-for-a-Round-Face17.jpg', 'WIN_20170524_16_01_07_Pro1_thumb.jpg', '391c948f-0b36-4b20-964a-105290562148', '0', '', '', '81111111', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12023', '', '', '', '1', 'WIN_20170524_16_01_07_Pro.jpg', 'WIN_20170524_16_01_07_Pro_thumb.jpg', '217fdf67-89d4-4d95-8828-cec6c12c24d8', '1', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12027', 'w', 'w', 'w', '1', null, null, 'a78d86f8-90be-4ffb-8f6c-75e9204550e5', '1', 'w@asdf.com', 'w', 'w', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12028', 'jose arturo', 'de los angeles', 'salgado', '1', 'professor-22.jpg', 'professor-22_thumb.jpg', '25a91cbf-eea4-4f20-a85b-ae295979193e', '1', 'josearturodelosangeles@gmail.com', 'Rio Sabinas 6126', '960005911', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12060', 'JENNIFFER GUZMAN', 'jklkjlkjlkj', 'tuytuytuy', '1', 'tumblr_o1g37s76tp1scpynio4_1280.jpg', null, '18c4a490-5aa5-42a0-881a-46562573ec31', '0', '', '1941 46TH STREET', '81111111', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12025', 'nallely', 'juarez', 'perez', '1', 'images2.jpg', '89149-620-282_thumb.jpg', 'a57dab2e-be0b-45ce-b1f0-7375edd62abc', '0', '', '', '98987-454', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12024', 'clara', 'rosas', 'perez', '1', '7-efficient-beauty-tips-for-girls.jpg', 'etc-courtenay-new_thumb.jpg', '51118bb2-6e04-4ee3-87bc-7ede6c2859dc', '0', '', '', '20006555', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12026', '777', '777', '777', '1', 'images.jpg', 'professor-3_thumb.jpg', '002539da-621f-4035-acbb-34521abb6f0f', '0', '777@fas.com', 'calle mi calle\ncasa mi casa', '7777', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12029', 'asdf', 'asdf', 'asf', '1', 'professor-32.jpg', null, '160a2446-2232-4e75-81b6-1ad90c433f88', '0', 'arturodelosangeles@hotmail.com', '', 'asdf', 'd41d8cd98f00b204e9800998ecf8427e', '0', '', '', '', '', null, null);
INSERT INTO `students` VALUES ('12030', 'aaa', 'aaa', 'aaa', '1', 'professor-11.jpg', null, 'a8008b66-7e4a-4bda-8b70-66ff76419fc4', '0', 'arturodelosangeles@hotmail.com', 'aaa', 'aaa', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12031', 'aaa', 'aaa', 'aaa', '1', 'professor-4.jpg', null, 'cda8b74e-a00f-467a-97e2-c068d4f6f820', '0', 'arturodelosangeles@hotmail.com', 'aaa', 'aaa', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12032', 'ffff', 'de los angeles', 'dentro', '1', 'professor-21.jpg', null, '5ad04545-d552-4c61-bfb8-448e3ca979c9', '0', '', '', '20006555', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12033', '', '', '', '1', '_86134032_gettyimages-4732519583.jpg', null, '1b6b9985-c72f-4832-a2e7-3f29c43aa2fa', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12034', 'arturo', 'salgado', 'perez', '1', 'Spiky-Men-Hair-for-a-Round-Face18.jpg', null, '9229b31f-37d8-47cb-b374-cf6ee9c8d577', '1', 'arturodelosangeles@hotmail.com', '9999', '960005911', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12035', '', '', '', '1', 'professor-51.jpg', null, 'e9479173-c71e-457d-a237-b78d2be3262c', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12036', '', '', '', '1', 'professor-62.jpg', null, '08f5ac2c-881d-409e-b3c1-f977d32586f4', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12037', '', '', '', '1', null, null, '6350e704-8c19-4e8d-a4a7-e157dac1e623', '1', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12038', 'no thumh', '', '', '1', 'ccca.jpg', null, '2119401b-42a9-4aa9-9732-8d9092ff452a', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12039', 'Perla', '', '', '1', 'perla.jpg', null, '36a5aacb-69af-4c79-bb5a-4d14f9bafc3f', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12040', '', '', '', '1', null, null, '2f1d658b-613b-44e0-b919-02fb4f65f6a4', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12041', '', '', '', '1', 'beautiful-1-600x878.jpg', null, '6e18239c-8bf8-4353-a913-173d7526d5e8', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12042', '', '', '', '1', 'no-thumb_(1).png', null, '2fa91c45-16b5-4fcb-bbe2-f1be4f8d8ae5', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12043', '', '', '', '1', '_86134032_gettyimages-4732519583.jpg', null, '80ce82d2-d3ea-4d7f-90d4-68606dfee3ab', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12044', '', '', '', '1', '7-efficient-beauty-tips-for-girls1.jpg', null, '91e012dd-27f3-478f-93bd-668587abdb1d', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12045', 'aaa', 'aaa', 'aaa', '1', 'Spiky-Men-Hair-for-a-Round-Face19.jpg', null, '210c733b-1297-4519-a3ea-0c5d442ed676', '0', 'arturodelosangeles@hotmail.com', 'aaa', 'aaa', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12046', '', '', '', '1', null, null, '92836a74-be2f-4f11-8da6-b492f0e5f7c7', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12047', '', '', '', '1', null, null, '49e5c3ec-3b4d-4ae9-8e7e-7d6a9f6a4f01', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12048', '', '', '', '1', null, null, '977b338a-6853-4dc5-ab10-321ed8eb74ad', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12049', '', '', '', '1', '1cd0022b34de22b3211d156af6387ed047.jpg', null, '4d4d9278-ab66-4025-9db1-19ecacce5885', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12050', '', '', '', '1', 'professor-12.jpg', null, '19ec7ef5-dcf6-4e02-8605-f641654fd772', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12051', '', '', '', '1', 'Spiky-Men-Hair-for-a-Round-Face20.jpg', null, 'eacadad5-958b-42f1-bc52-de9a8d8dd660', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12052', '', 'rerer', 'rerer', '1', 'professor-41.jpg', null, '336290c8-a962-4d09-af89-3c0bfc2911e5', '0', '', '', 'rere', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12053', '', '', '', '1', 'professor-22.jpg', null, '27e4b5ec-4765-46a5-b7e8-e316e0bb0717', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12054', '', '', '', '1', '7-efficient-beauty-tips-for-girls2.jpg', null, '970e5e8d-49b4-4771-a60b-098610833d6e', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12055', '', '', '', '1', '1cd0022b34de22b3211d156af6387ed048.jpg', null, '0d5393af-196e-4549-a555-1e6f91931117', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12056', '', '', '', '1', '_86134032_gettyimages-4732519584.jpg', null, '4dd5232b-28e7-4221-aa41-05b4ff135ff2', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12057', '', '', '', '1', 'Spiky-Men-Hair-for-a-Round-Face13.jpg', null, 'a0c69c39-0634-4ce5-81f4-622991f16cc8', '1', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12061', 'as', '', '', '1', 'small.jpg', null, '74033855-5a42-45e1-8180-79dcb3d1cf4e', '0', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12058', 'arturo', '4', '4', '1', '_86134032_gettyimages-4732519585.jpg', null, '82d9627e-c632-4672-853a-853b95315be1', '0', 'arturodelosangeles@hotmail.com', '4', '4444', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12059', 'arturo', 'salgado1', 'perez', '1', '7-efficient-beauty-tips-for-girls3.jpg', null, '88dbc83d-d023-40fc-bf76-1966680bb095', '0', 'arturodelosangeles@hotmail.com', 'pppp', '52255514154989', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12019', 'ttt', '', '', '1', 'professor-2.jpg', 'professor-2_thumb.jpg', '4cad0b01-2986-447b-84b4-f5ea5542bc18', '1', '', '', '798798987987', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12062', null, 'salgado1', 'perez-96666', '1', null, null, '110818cf-1d3b-48bc-b5a9-8678db6764ee', '0', null, null, '521541111454', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12063', null, '', '', '1', null, null, 'ab483967-9e6e-4084-9651-32a3857393c7', '0', null, null, 'yuiyiyiyiyi', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12064', null, 'de los angeles', 'ramirez daviggg', '1', 'professor-23.jpg', null, '428a455e-ec1a-480e-b5d2-967289192f71', '0', null, null, '960005911', null, null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12065', 'Nini', 'De los angeles', 'Ramirez', '1', 'nini.jpg', null, '863b26a0-cb84-461a-bbea-72130f8de553', '0', 'nini@cat.com', '', '131315151', '8e759682bb89f64cfc559f4b634589e3', '0', '', '', '', '', null, null);
INSERT INTO `students` VALUES ('12066', 'sss', '', '', '1', null, null, '1768f59d-ef5e-4e4a-8721-2cc7e760aaf1', '0', 'sss@rw.ocom', null, '', 'd41d8cd98f00b204e9800998ecf8427e', null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12067', 's', '', '', '1', null, null, '97c3a114-b41e-4043-a397-5dadc54a2d9b', '0', 'sss@rw.ocom', null, '', 'd41d8cd98f00b204e9800998ecf8427e', null, null, null, null, null, null, null);
INSERT INTO `students` VALUES ('12068', 'rosa', 'salgado1', 'perez', '9', 'person-4.jpg', null, 'c544a668-1ca4-4c41-ba6d-1bd300439d9d', '0', 'rosaperez@gamil.com', '', '960005911', '990765d46ca39446402cc1913b03df06', '1', '', '', '', '', '0', null);
INSERT INTO `students` VALUES ('12069', 'Marte', 'robles', 'fernandez', '11', 'person-6.jpg', null, '0f4d491e-afe4-465c-a797-00b7dcad5047', '0', 'marte@gmail.com', 'Planeta Marte', '55555', 'd41d8cd98f00b204e9800998ecf8427e', '1', 'marte1234', 'papa de marte', '2336283', '2228617291', '1', '1');

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `credits` float DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES ('1', 'Introducción a la Computación', null, null, '1', '0', 'fasfasf');
INSERT INTO `subjects` VALUES ('2', 'Matematicas', null, null, '1', '0', 'Algebra\nand more');
INSERT INTO `subjects` VALUES ('3', 'Español', null, null, '1', '0', '444444444\n');
INSERT INTO `subjects` VALUES ('4', 'Ingles I asdf', null, null, '1', '0', '5765765765345435435434341q212121-*75/*-*/*-\n');
INSERT INTO `subjects` VALUES ('5', 'Ingles 2-edit ', null, null, '1', '0', 'fasfasdf');
INSERT INTO `subjects` VALUES ('6', 'Quimica 1', null, null, '1', '0', 'fundamentos de q33333333');
INSERT INTO `subjects` VALUES ('7', null, null, null, '1', '0', '[[[');
INSERT INTO `subjects` VALUES ('8', 'Estambres I', null, null, '1', '0', null);
INSERT INTO `subjects` VALUES ('9', 'Introduccion a los ratones', null, null, '1', '0', null);
INSERT INTO `subjects` VALUES ('10', 'Arquitectura de Cajas', null, null, '1', '0', null);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('completed','open','started') DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT '1',
  `file` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1', 'filter for advertise ', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('2', 'add chat ', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('3', 'reports ', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('4', 'reports 2', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('5', 'reports 5', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('6', 'add the fields', 'completed', null, null, null, null, null);
INSERT INTO `tasks` VALUES ('7', 'check overlap', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('8', 'Face book or not', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('9', 'advertiser show profiles ', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('10', 'advertise show reports ', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('11', 'sub 1', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('12', 'sub two', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('13', 'sub task', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('14', 'pregunta Si se puede', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('15', 'pregunta 2,claro', null, null, null, null, null, null);
INSERT INTO `tasks` VALUES ('16', 'login the login page', null, '18eb48d8-f9c3-47bd-92fd-9a46d326ceab', null, null, null, null);
INSERT INTO `tasks` VALUES ('17', 'SET up roberts hilton', 'completed', 'a3f438be-b69a-4c7f-9b7e-e93c44cc74cb', null, null, null, null);
INSERT INTO `tasks` VALUES ('18', 'ermove Model label', null, '1a1989cf-da89-4a5f-bc5c-a4cbbacc518d', '1', null, null, null);
INSERT INTO `tasks` VALUES ('19', '25 mins schoool', null, 'fb81634e-a066-4972-9e7b-08af34f25f16', '1', null, null, null);
INSERT INTO `tasks` VALUES ('20', 'fix', null, 'd4d178ea-3b1a-4be2-aa4a-0c5e84f91a63', '1', 'error1.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('21', 'remove model label', null, '9851b284-913c-4377-9d54-c4418c79507e', '1', 'model.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('22', 'logged in as arturo, but owner suggest demo user', null, '639eb182-f01c-488b-ae46-0b8f0afa6f0f', '1', 'user_wrong.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('23', 'edit user under advertise doesnt work', null, 'c3d68c70-5226-42d1-947f-62657ec5012f', '1', 'edit-user-for_advertiser.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('24', 'name must be complete, not first name', null, '10f42d1e-fb29-4d57-8142-b9a2e2a7982a', '1', 'show_complete_name.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('25', 'show complete name', null, '81abb242-b0c5-43d2-8e50-6be6c67be035', '1', 'show_complete_name.fw_1.png', null, null);
INSERT INTO `tasks` VALUES ('26', 'test', null, '978646ba-3568-4251-b9e1-1f6c40459145', '1', null, null, null);
INSERT INTO `tasks` VALUES ('27', 'clean this rubish, the selects look bad', null, '6c1ee215-da26-45b6-840d-3ec35d08414f', '1', 'rubishh.fw_.png', null, null);
INSERT INTO `tasks` VALUES ('28', 'leeer los emails, traer los resutlados', null, '11ed5b4b-dc1b-4106-a07b-9da5829337b9', '1', null, null, null);
INSERT INTO `tasks` VALUES ('29', 'quitar mi email config al subir a prod', null, '8ccec4f1-4a73-4478-a7c9-64fc87ac5256', '1', 'about_bg.jpg', null, null);
INSERT INTO `tasks` VALUES ('30', 'Read valid campaign', null, '6ac4b86a-444b-4572-8731-7fab4e25e2c4', '1', null, null, null);
INSERT INTO `tasks` VALUES ('31', 'comprar libro ale', null, 'd386533d-ff0d-42b4-998a-3900aa0777ab', '1', null, null, null);
INSERT INTO `tasks` VALUES ('32', 'gather emails', null, '24d64d88-ade7-44d9-a46c-3c7538815d05', '1', null, null, null);
INSERT INTO `tasks` VALUES ('33', 'we have to create the basic reportin', null, '198634bb-9364-430c-9763-efca27495f1a', '1', null, null, null);
INSERT INTO `tasks` VALUES ('34', 'we have to add the new login system', null, '3999a3ac-5807-425a-8e6c-fb4a6e99ea97', '1', null, null, null);
INSERT INTO `tasks` VALUES ('35', 'paginacion en main controller ', null, 'f5ab392f-2b97-4154-bd6d-1ae5702cbc4a', '1', null, null, null);
INSERT INTO `tasks` VALUES ('36', 'agegar cosas al alumno, notas, tipo de sangre, etc', null, '4df9da6c-43c2-4ce8-82eb-17fa50140666', '1', null, null, null);
INSERT INTO `tasks` VALUES ('37', 'copiar mucho de alumnos y meterlo a maestros y personal', null, '87151efb-441a-4c4f-af90-c1ccd7c50a2f', '1', null, null, null);
INSERT INTO `tasks` VALUES ('38', 'foto en detial debe ser responsive ', null, 'f2f3f293-e191-4577-a9b7-d8eda15cd3dd', '1', null, null, null);
INSERT INTO `tasks` VALUES ('39', 'filtrar busqueda grupos', null, '51541f94-e050-405e-a979-03bd45041d3d', '1', null, null, null);
INSERT INTO `tasks` VALUES ('40', 'save thumb for images', null, 'd5c7a0b3-2b5b-4051-a3f4-2e51ea5dbb50', '1', null, null, null);
INSERT INTO `tasks` VALUES ('41', 'LA TABLA OPT INTEL DEBE GUARDAR EN OPT INTEL LOGS', null, 'c6c96b1c-86c3-4523-a973-b26973b8d6a0', '1', null, null, null);
INSERT INTO `tasks` VALUES ('42', 'reportes', null, 'ea7d0f92-1f3b-4fd9-bc94-bfb2766e3ef7', '1', null, null, null);
INSERT INTO `tasks` VALUES ('43', 'coomplete according to pdf', null, '24303ba4-7f8b-45f3-b102-c015d55f6387', '1', null, null, null);
INSERT INTO `tasks` VALUES ('44', 'testear la campania', null, '44cbb0b9-1d1b-480c-a040-977dde386a4d', '1', null, null, null);
INSERT INTO `tasks` VALUES ('45', 'agegar los usuarios para la campania', null, '01cdb41a-ff6a-4922-a499-a60cd6663539', '1', null, null, null);
INSERT INTO `tasks` VALUES ('46', 'muestra para grupos  , por default , solo activos, cuando se desactivan ya no salen, esto para mejorar el flitro tabien', null, '613f222c-cf6b-4053-b842-aa58a853712c', '1', null, null, null);
INSERT INTO `tasks` VALUES ('47', 'grupos limite ? Publicar - PErmitir auto inscripcion', null, '5a82ad3b-4027-4039-b7b8-29b840e5490b', '1', null, null, null);
INSERT INTO `tasks` VALUES ('48', 'constant today - define each day, but changagle to test changes in tume', null, 'a6c44c33-7600-47d7-8c2d-cdcfca204a59', '1', null, null, null);
INSERT INTO `tasks` VALUES ('49', 'Materias Catalog', null, '581a79bb-cad0-4dcc-b681-ff72348d41e8', '1', null, null, null);
INSERT INTO `tasks` VALUES ('50', 'colegiaturas de fecha hasta fecha, x cobro Nombre e.g. 12 meses ', null, '264a226a-cf21-4a6c-9dfc-6c3cd49fc3a9', '1', null, null, null);
INSERT INTO `tasks` VALUES ('51', 'CHRIS, TEST API, REPORT, NETWORK', null, '3bdfd867-f006-4681-9e58-90898c572bf6', '1', null, null, null);
INSERT INTO `tasks` VALUES ('52', 'ROBERT INTERFACE LINK BUILDER', null, '6c61400a-93ef-43cf-9b72-185c8e30c07c', '1', null, null, null);
INSERT INTO `tasks` VALUES ('53', 'ICI - FIX ERRORS, TO HAVE THE MONEY BACK', null, '47e1486d-a00f-4652-bf61-9ddd92c4bdd7', '1', null, null, null);
INSERT INTO `tasks` VALUES ('54', 'FICHA RAP', null, 'a9c0bfb8-39f1-4a1c-987a-1f92750a244b', '1', null, null, null);
INSERT INTO `tasks` VALUES ('55', 'agregar interfaz programas', null, 'f50d6583-ea48-42bd-b3bf-948d28873bc5', '1', null, null, null);
INSERT INTO `tasks` VALUES ('56', 'agregar interfaz grados', null, 'cdb49737-6b85-4f7c-a10f-86aa78e5e5af', '1', null, null, null);
INSERT INTO `tasks` VALUES ('57', 'en el API asegurarse de que deleted no es cero ', null, 'e52b75c7-8edf-4df5-abff-98bbeac42bae', '1', null, null, null);
INSERT INTO `tasks` VALUES ('58', 'respnsive menu 1.5', null, 'd7d06426-0b50-4edb-b9bd-d112aa8dcef6', '1', null, null, null);
INSERT INTO `tasks` VALUES ('59', 'function to retrieve theatres', null, '294cfd30-13fe-499f-b7cc-6054a7bc796f', '1', null, null, null);
INSERT INTO `tasks` VALUES ('60', 'theatre custom type', null, '9c14a0f0-26ce-4ecd-bc41-69a9618c2199', '1', null, '2017-07-04 22:01:23', '2017-07-04 15:01:23');
INSERT INTO `tasks` VALUES ('61', 'about us page', null, '066f18c2-137e-43f8-946e-f1ea72cf721d', '1', null, '2017-07-05 22:42:08', '2017-07-05 22:42:08');
INSERT INTO `tasks` VALUES ('62', 'http://kmadigital.com/smart/advertisers/log/in', null, 'd6deecce-3e42-4234-9396-ca6397a9290c', '1', null, '2017-07-06 07:47:51', '2017-07-06 07:47:51');
INSERT INTO `tasks` VALUES ('63', 'Push HILTON TO PRODUCTION', null, 'd0ad7886-e7b8-4f86-bce1-2c62bcf9b1c0', '1', null, '2017-07-13 09:36:49', '2017-07-13 09:36:49');
INSERT INTO `tasks` VALUES ('64', 'CHRIS WALK TOHROUGH', null, '4615ef4c-61c3-4122-92be-4d86578f33ab', '1', null, '2017-07-13 09:55:52', '2017-07-13 09:55:52');
INSERT INTO `tasks` VALUES ('65', 'CRON JOB', null, 'f3240a8d-f7e1-415f-8aac-57fcbd55f82b', '1', null, '2017-07-13 09:56:03', '2017-07-13 09:56:03');
INSERT INTO `tasks` VALUES ('66', 'ESTEBAN DOCS', null, '2b5724ea-4a7b-464f-889f-81f2a48bff77', '1', null, '2017-07-13 09:56:11', '2017-07-13 09:56:11');
INSERT INTO `tasks` VALUES ('67', 'cHRIS WATCHES ACTIVITY ', null, 'cc23f6ec-bf05-4238-ae53-1837ade7dd55', '1', null, '2017-07-13 09:56:31', '2017-07-13 09:56:31');
INSERT INTO `tasks` VALUES ('68', 'I need to match the Fields positive to the campaign ', null, '7d58d2da-1b72-4868-8c3a-1dd095fb70da', '1', null, '2017-07-13 11:25:34', '2017-07-13 11:25:34');
INSERT INTO `tasks` VALUES ('69', 'test hilton production', null, '24d8fc80-3a36-4226-8dbd-9a02583c208a', '1', null, '2017-07-13 22:24:01', '2017-07-13 22:24:01');
INSERT INTO `tasks` VALUES ('70', 'ICI - FIX ERRORS, TO HAVE THE MONEY BACK', null, '3da35af5-892e-418a-96a9-de65098fd14c', '1', null, '2017-07-14 11:57:10', '2017-07-14 11:57:10');
INSERT INTO `tasks` VALUES ('71', 'PROFILE WAS POINTING TO CONSUMERS_UPDATE INSTEAD OF CONSUMERS3', null, '7e014b27-9d06-4247-8e33-601eec7841eb', '1', null, '2017-07-18 22:54:40', '2017-07-18 22:54:40');
INSERT INTO `tasks` VALUES ('72', 'REMOVE EXPORT BUTTON', null, '875f0075-5778-49f0-b51d-5f21f179aa90', '1', null, '2017-07-18 22:55:11', '2017-07-18 22:55:11');
INSERT INTO `tasks` VALUES ('73', 'user is empty', null, 'b5f8a8db-743e-430d-ac0d-c45af9f0ab36', '1', 'user-empty.png', '2017-07-19 06:27:29', '2017-07-18 23:27:29');
INSERT INTO `tasks` VALUES ('74', 'client overall reports, selects were empty', null, 'b3a02424-9c9c-4cd7-b143-66dffd582416', '1', null, '2017-07-19 07:39:14', '2017-07-19 00:39:14');
INSERT INTO `tasks` VALUES ('75', 'client campaigns, session expires and no campaign is shown', null, '6532e746-813c-47f4-9b9a-084ab90ef0bc', '1', null, '2017-07-19 01:40:58', '2017-07-19 01:40:58');
INSERT INTO `tasks` VALUES ('76', 'clients overall reports hide selects', null, '81f9eea8-50a3-4ddf-98de-984eebf77d2a', '1', null, '2017-07-19 01:52:24', '2017-07-19 01:52:24');
INSERT INTO `tasks` VALUES ('77', 'remove details from --', null, '3d6590e6-11e8-4e4f-a580-e1aa02a09813', '1', null, '2017-07-19 08:54:04', '2017-07-19 01:54:04');
INSERT INTO `tasks` VALUES ('78', 'iF ISER IS ADMIN, GET OTHER HASHES . ALL HASHES, models/client.pjp 348, session id client or admin, use session', null, '2a25d661-adf0-4fbc-ac0a-0449e98b1179', '1', null, '2017-07-20 03:51:29', '2017-07-19 20:51:29');

-- ----------------------------
-- Table structure for tasks_copy
-- ----------------------------
DROP TABLE IF EXISTS `tasks_copy`;
CREATE TABLE `tasks_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('completed','open','started') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tasks_copy
-- ----------------------------
INSERT INTO `tasks_copy` VALUES ('1', 'maestros', null);
INSERT INTO `tasks_copy` VALUES ('2', 'listado', 'started');
INSERT INTO `tasks_copy` VALUES ('3', 'edicion', null);
INSERT INTO `tasks_copy` VALUES ('4', 'alumnos--', null);
INSERT INTO `tasks_copy` VALUES ('5', 'listados', null);
INSERT INTO `tasks_copy` VALUES ('6', 'vista detalles', null);
INSERT INTO `tasks_copy` VALUES ('7', 'fotos', null);
INSERT INTO `tasks_copy` VALUES ('8', 'floreros', null);
INSERT INTO `tasks_copy` VALUES ('9', 'replace tasks with generic model name', 'completed');
INSERT INTO `tasks_copy` VALUES ('10', 'options must be related to the parent project only', 'completed');
INSERT INTO `tasks_copy` VALUES ('11', 'user interface', null);
INSERT INTO `tasks_copy` VALUES ('12', 'add styles', null);
INSERT INTO `tasks_copy` VALUES ('13', 'Bring images', 'completed');
INSERT INTO `tasks_copy` VALUES ('14', 'recover password', 'completed');
INSERT INTO `tasks_copy` VALUES ('15', 'broken links', 'completed');
INSERT INTO `tasks_copy` VALUES ('16', 'conflicto de horarios', 'completed');
INSERT INTO `tasks_copy` VALUES ('17', 'documentos', 'completed');
INSERT INTO `tasks_copy` VALUES ('18', 'eventos--', 'completed');
INSERT INTO `tasks_copy` VALUES ('19', 'update via jquery field , table value, show update message', 'completed');
INSERT INTO `tasks_copy` VALUES ('20', 'pagination', 'open');
INSERT INTO `tasks_copy` VALUES ('21', 'search, generic, set up tables to search', null);
INSERT INTO `tasks_copy` VALUES ('22', 'users roles : admin, user, ', 'open');
INSERT INTO `tasks_copy` VALUES ('23', 'for each role, determine what can see and edit, like a permissions lists', null);
INSERT INTO `tasks_copy` VALUES ('24', 'upload Many Images to the tasks', 'open');
INSERT INTO `tasks_copy` VALUES ('25', 'revisar hat y agregar tareas', 'completed');
INSERT INTO `tasks_copy` VALUES ('26', 'install chat', 'started');
INSERT INTO `tasks_copy` VALUES ('27', 'captcha to avoid junk mail', 'started');
INSERT INTO `tasks_copy` VALUES ('28', 'cambiar a captcha', 'open');
INSERT INTO `tasks_copy` VALUES ('29', 'michell sub task', null);
INSERT INTO `tasks_copy` VALUES ('30', 'michelle third task', null);
INSERT INTO `tasks_copy` VALUES ('31', 'add events calendar', null);
INSERT INTO `tasks_copy` VALUES ('32', 'add paypal paying system , as decoupled as possible', null);
INSERT INTO `tasks_copy` VALUES ('33', 'add principle , lots of people have done this, you must do it as well', null);
INSERT INTO `tasks_copy` VALUES ('34', 'upload to server ivans', 'completed');
INSERT INTO `tasks_copy` VALUES ('35', 'start framework for blog', null);
INSERT INTO `tasks_copy` VALUES ('36', 'students task is not workin', 'completed');
INSERT INTO `tasks_copy` VALUES ('37', 'use functionality we had in the previous blog', null);
INSERT INTO `tasks_copy` VALUES ('38', 'one projec has subprojects, and each project has many tasks , like a tree ', null);
INSERT INTO `tasks_copy` VALUES ('39', 'check tree , works with subtasks, one parent, in this case project', null);
INSERT INTO `tasks_copy` VALUES ('40', 'Test mobile', 'completed');
INSERT INTO `tasks_copy` VALUES ('41', 'libeerty', 'completed');
INSERT INTO `tasks_copy` VALUES ('42', 'Captcha', 'completed');
INSERT INTO `tasks_copy` VALUES ('43', 'las imagenes no suben por que el save se cambio ', 'completed');
INSERT INTO `tasks_copy` VALUES ('44', 'web site', null);
INSERT INTO `tasks_copy` VALUES ('45', 'login with facebook', null);
INSERT INTO `tasks_copy` VALUES ('46', 'pay with paypal, it should be ready from other projects', null);
INSERT INTO `tasks_copy` VALUES ('47', 'form , back to list buttom', null);
INSERT INTO `tasks_copy` VALUES ('48', 'google api', 'started');
INSERT INTO `tasks_copy` VALUES ('49', 'set up env php7 ', 'completed');
INSERT INTO `tasks_copy` VALUES ('50', 'request demo', 'completed');
INSERT INTO `tasks_copy` VALUES ('51', 'fix menu, should work similar to tasks', 'completed');
INSERT INTO `tasks_copy` VALUES ('81', 'eee', null);
INSERT INTO `tasks_copy` VALUES ('53', 'bring missing pages', 'completed');
INSERT INTO `tasks_copy` VALUES ('54', 'selling web site ', null);
INSERT INTO `tasks_copy` VALUES ('55', 'front page', null);
INSERT INTO `tasks_copy` VALUES ('56', 'plan page', null);
INSERT INTO `tasks_copy` VALUES ('57', 'Ask for notificationemail', 'started');
INSERT INTO `tasks_copy` VALUES ('58', 'datepickers as required', null);
INSERT INTO `tasks_copy` VALUES ('59', 'mysql functions', null);
INSERT INTO `tasks_copy` VALUES ('60', '3 TABLE PRICES STATIC', null);
INSERT INTO `tasks_copy` VALUES ('61', 'FEATURES FOR EACH PRICE STATIC', null);
INSERT INTO `tasks_copy` VALUES ('64', 'admin', null);
INSERT INTO `tasks_copy` VALUES ('62', 'REQUEST DEMO FORM', null);
INSERT INTO `tasks_copy` VALUES ('63', 'USE GOOGLE CPATCHA IN DEMO FORM', null);
INSERT INTO `tasks_copy` VALUES ('65', 'items on sh4eet', null);
INSERT INTO `tasks_copy` VALUES ('66', 'wp', null);
INSERT INTO `tasks_copy` VALUES ('67', 'one to many projects', null);
INSERT INTO `tasks_copy` VALUES ('68', 'Display Alumnos field', null);
INSERT INTO `tasks_copy` VALUES ('69', 'display alumnos field', null);
INSERT INTO `tasks_copy` VALUES ('70', 'test ', 'started');
INSERT INTO `tasks_copy` VALUES ('71', 'Empalme de horrios', 'completed');
INSERT INTO `tasks_copy` VALUES ('72', 'A veces cargan doble', 'completed');
INSERT INTO `tasks_copy` VALUES ('73', 'Clients for hotels', null);
INSERT INTO `tasks_copy` VALUES ('74', 'Wwwwww', null);
INSERT INTO `tasks_copy` VALUES ('75', 'sav info to request table', null);
INSERT INTO `tasks_copy` VALUES ('76', 'update fields to request table', null);
INSERT INTO `tasks_copy` VALUES ('77', 'test as erin', null);
INSERT INTO `tasks_copy` VALUES ('78', 'Lunes 7 hors', null);
INSERT INTO `tasks_copy` VALUES ('79', 'martes 8', null);
INSERT INTO `tasks_copy` VALUES ('80', 'miercoles', null);
INSERT INTO `tasks_copy` VALUES ('82', 'fix tree to be used in all self related models', 'completed');
INSERT INTO `tasks_copy` VALUES ('83', 'Fix menu, wieth new tree class', null);
INSERT INTO `tasks_copy` VALUES ('84', 'test', null);
INSERT INTO `tasks_copy` VALUES ('85', 'use facebook login api', null);

-- ----------------------------
-- Table structure for tasks_tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks_tasks`;
CREATE TABLE `tasks_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `related_task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tasks_tasks
-- ----------------------------
INSERT INTO `tasks_tasks` VALUES ('1', '1', '4');
INSERT INTO `tasks_tasks` VALUES ('2', '1', '5');
INSERT INTO `tasks_tasks` VALUES ('3', '11', '12');
INSERT INTO `tasks_tasks` VALUES ('4', '2', '13');
INSERT INTO `tasks_tasks` VALUES ('5', '53', '54');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `second_last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `photo_raw_name` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('1', 'Arturo', 'www', 'Wewewtttttttttttttttttt', 'demo@keymarketingadvantage.com', 'WIN_20170524_16_01_07_Pro1.jpg', '_86134032_gettyimages-4732519582_thumb.jpg', '1', '0', null);
INSERT INTO `teachers` VALUES ('2', '9999', '', '', '', '1cd0022b34de22b3211d156af6387ed049.jpg', 'patient-11_thumb.jpg', '1', '0', null);
INSERT INTO `teachers` VALUES ('3', 'Johans', '', '', '', '1cd0022b34de22b3211d156af6387ed050.jpg', 'patient-111_thumb.jpg', '1', '0', null);
INSERT INTO `teachers` VALUES ('4', 'Ernest', '', '', '', '7-efficient-beauty-tips-for-girls4.jpg', 'patient-6_thumb.jpg', '1', '0', null);
INSERT INTO `teachers` VALUES ('5', 'Louis', 'aaa', 'aaa', '', 'patient-102.jpg', 'patient-102_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('6', 'ana', '', '', '', 'patient-91.jpg', 'patient-91_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('7', 'jose', 'de los angeles', 'salgad', 'arturo.delosangeles@sintesys.us', 'patient-104.jpg', 'patient-104_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('8', 'Jose Arturo', 'de los angeles', 'salgadooo', 'arturo.delosangeles@sintesys.us', 'patient-105.jpg', 'patient-105_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('9', 'berenice', 'ramirezz', 'lozada', 'arturo.delosangeles@sintesys.us', 'patient-9.jpg', 'patient-9_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('10', 'Www', 'www', 'wwww', 'johnstward@gmail.com', 'patient-101.jpg', 'patient-101_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('11', 'ddd', 'dddd', 'dddd', 'ddsds@asdf.com', 'patient-106.jpg', 'patient-106_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('12', 'arturo', 'de los angeles', 'de los angeles', '', 'patient-107.jpg', 'patient-107_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('13', 'arturo', 'de los angeles', 'de los angeles', '', 'patient-121.jpg', 'patient-121_thumb.jpg', '1', '1', null);
INSERT INTO `teachers` VALUES ('14', 'mahetzi berenice', 'ramirez', 'lozada', 'mahetziramirez@gmail.com', 'professor-42.jpg', null, '1', '0', 'bellissa');
INSERT INTO `teachers` VALUES ('15', null, 'salgado1', 'perez', 'arturodelosangeles@hotmail.com', null, null, '1', '0', null);
INSERT INTO `teachers` VALUES ('16', null, null, 'Min Woo Shi', 'minushi@catmail.com', 'Minu.jpg', null, '1', '0', null);
INSERT INTO `teachers` VALUES ('17', 'patricia', 'de los angeles', 'vargas', 'paty@gmail.com', 'student-10.jpg', null, '11', '0', '');

-- ----------------------------
-- Table structure for tuitions
-- ----------------------------
DROP TABLE IF EXISTS `tuitions`;
CREATE TABLE `tuitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `penalty` decimal(10,2) DEFAULT NULL,
  `penalty_form` enum('percentage','amount') DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `makes_discount` tinyint(4) DEFAULT NULL,
  `cycle_id` tinyint(4) DEFAULT NULL,
  `period_id` tinyint(4) DEFAULT NULL,
  `month` tinyint(2) DEFAULT NULL,
  `selectedTreeFields` varchar(255) DEFAULT NULL,
  `unique` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tuitions
-- ----------------------------
INSERT INTO `tuitions` VALUES ('17', 'Colegiatura Agosto 2017', '6500', '', '1', '2017-07-11', '0.00', '', '0', null, '1', '1', '7', 'group_1', 'bb65afb1-4239-49cb-81b6-3faeddf67db6');
INSERT INTO `tuitions` VALUES ('18', 'Colegiatura', '3200', '', '1', '2017-07-11', '0.00', '', '0', null, '1', '1', '7', '', 'b92a6676-5b70-450a-a616-5aeee432048b');
INSERT INTO `tuitions` VALUES ('19', 'Colegiatura Septiembre 2017', '6500', '', '1', '2017-08-10', '0.00', '', '0', null, '1', '1', '7', '', 'a6fb6c48-f010-4dc4-8e33-11ed66474360');
INSERT INTO `tuitions` VALUES ('20', 'Colegiatura Octubre', '6500', '', '1', '2017-08-10', '0.00', '', '0', null, '1', '1', '7', '', 'f038bb09-4d3a-4111-aad7-5dc4cfaf72e2');
INSERT INTO `tuitions` VALUES ('21', 'Pago Extra', '3200', '', '1', '2017-07-20', '0.00', '', '0', null, '1', '1', '8', 'group_1,group_5,program_3', '4784726a-a399-4e02-a349-d3e77546955b');
INSERT INTO `tuitions` VALUES ('22', 'Colegiatura Agosto 2017', '6500', '', '1', '2017-07-11', '0.00', '', '0', null, '1', '1', '7', '', 'ef02e88e-e3f1-4808-8080-cad85b80b685');
INSERT INTO `tuitions` VALUES ('23', 'admision gatitos', '1500', '6555', '1', '2017-07-25', '10.00', '', '0', null, '1', '1', '8', 'group_30', '6a6a06ff-33c8-4de2-9a67-672302191e81');
INSERT INTO `tuitions` VALUES ('24', 'Agregar', '6000', '66621', '1', '2017-07-19', '10.00', '', '0', null, '1', '1', '9', 'group_33', '5ada5a80-e5d5-452c-948d-c05570cc1983');
INSERT INTO `tuitions` VALUES ('25', 'listado', '3200', '', '1', '2017-07-13', '0.00', '', '0', null, '1', '1', '7', 'group_3,program_2', 'a73a7d8a-4833-42e9-8546-cda6891c0ffa');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Arturo', 'arturo', 'arturo', 'de los Angeles');
INSERT INTO `users` VALUES ('2', 'Jose', 'arturo', 'salgado', null);
INSERT INTO `users` VALUES ('3', 'Pio', 'arturo', 'angeles', null);
INSERT INTO `users` VALUES ('4', null, 'arturo@java.com', 'myrna101', null);
INSERT INTO `users` VALUES ('5', null, 'mahetzi', 'mahetzi', null);
INSERT INTO `users` VALUES ('6', null, 'colegio@gmail.com', 'myrna101', null);
INSERT INTO `users` VALUES ('1001', null, 'belly', 'belly', 'de los angeles');
SET FOREIGN_KEY_CHECKS=1;
