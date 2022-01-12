<?php
 /**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$WP_DATABASE_NAME' );

/** MySQL database username */
define( 'DB_USER', '$WP_DATABASE_USR' );

/** MySQL database password */
define( 'DB_PASSWORD', '$WP_DATABASE_PWD' );

/** MySQL hostname */
define( 'DB_HOST', '$MYSQL_HOST' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

// define( 'AUTH_KEY',         'put your unique phrase here' );
// define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
// define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
// define( 'NONCE_KEY',        'put your unique phrase here' );
// define( 'AUTH_SALT',        'put your unique phrase here' );
// define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
// define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
// define( 'NONCE_SALT',       'put your unique phrase here' );

define('AUTH_KEY',         'E:cb^}PpuWesa>jYY%yQZua%CU |H*!0<.PV#/7+RB)Zgzr+x9L&b7q,>+#un-b<');
define('SECURE_AUTH_KEY',  'um+XKiem7x/P7-vbt2w# Dc[7c-E;^Gx eJf5BGN31xge,6z^w+Tv+Qkx.2Q!qJG');
define('LOGGED_IN_KEY',    '+~qGEm_8]_7+1?H|s]Qhorb#Em)W<&ANUn%}D:Tf>1o8Qyif77u:+aUC|{V@mg(@');
define('NONCE_KEY',        '4r}YJ,k3T&t^Pc9yi3Q<b_BBv!pFGIA{ptm)Dx5FA|> FNBA+/4[6{6N~-)+!0]s');
define('AUTH_SALT',        'IHaifdeGP+_uFMtGoygwhGRE`[|#|EpnGh{;o.L (la<?Ayi8$D8@-#y`H7(+zY3');
define('SECURE_AUTH_SALT', ']SP*&4vzy1EJDLQKsO[0<)<FNsT:?F{&Bj_o$Zrkn_|~z2:V[QfsS6s>%pEPCnyU');
define('LOGGED_IN_SALT',   '<sg2?HqT(2MG./1x6NID)LJLjC}QT6<}9#u7%XG.d%Bw|-MyWbna9y9zS*6&T8#R');
define('NONCE_SALT',       'cb|->`g@gwxRm`b#K$K]^dcpcAPRWENM(lUYX>/S.Nk6]=U7b/0_9b^V5|=kj 7)');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );