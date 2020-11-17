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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

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
define('AUTH_KEY',         '[sS*C8[1D?*v>{[NG@ZBzC@hl.2?CV`X3HkCM;F6uV+)7nOWo6|$rGwY E/P<Po-');
define('SECURE_AUTH_KEY',  'dfs!S--UuF.%r/E)fEpSSEwZAQA%j6l:_k}~DO;)4H2D^|oy>( ].w(K*o7M=kyD');
define('LOGGED_IN_KEY',    '}.lHNd<eu7B*^hzoV2NF%Y#0Y4p@>%DvN//A%kPh;*fIuVJbkpe^qk}0n2:[uO)@');
define('NONCE_KEY',        '6)/O(v K`v}q4g?c~133n@_zJvw;:wz0BM vdm-`dV+*6Nj../gGH7Ia+nkDON)>');
define('AUTH_SALT',        '|+Gw<`=gQlg,<T,4i!RLkX2e@8bRW-e~/{Q7sh jDZcyHL)dCi+j?&]vqmz#^#qt');
define('SECURE_AUTH_SALT', '.4:6,jA j*:AL_PFJZsB_4|Nb%U}!?F=b^J0[Y#zST+k^2:#:nZG_E]<DT/CFR X');
define('LOGGED_IN_SALT',   ';^99+O5nEbw/ q*oP+gtO/g-)/J_i3m5@&c-lS[|.1-rx vpO^-M<Ub(:zc5v(^8');
define('NONCE_SALT',       ',IvyAo8Vn<yuUv0s3G=$%i m19%gIj5|nL[|xnO(-4(NU/V#xc-.d5Y*$&D-P*;+');

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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
