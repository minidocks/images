<?php
$parameters = [
    'db_driver' => 'pdo_mysql',
    'install_source' => 'Docker',
];

if (array_key_exists('MAUTIC_DB_HOST', $_ENV)) {
    // Figure out if we have a port in the database host string
    if (strpos($_ENV['MAUTIC_DB_HOST'], ':') !== false) {
        list($host, $port) = explode(':', $_ENV['MAUTIC_DB_HOST'], 2);
        $parameters['db_port'] = $port;
    } else {
        $host = $_ENV['MAUTIC_DB_HOST'];
    }
    $parameters['db_host'] = $host;
}
if (array_key_exists('MAUTIC_DB_NAME', $_ENV)) {
    $parameters['db_name'] = $_ENV['MAUTIC_DB_NAME'];
}
if (array_key_exists('MAUTIC_DB_TABLE_PREFIX', $_ENV)) {
    $parameters['db_table_prefix'] = $_ENV['MAUTIC_DB_TABLE_PREFIX'];
}
if (array_key_exists('MAUTIC_DB_USER', $_ENV)) {
    $parameters['db_user'] = $_ENV['MAUTIC_DB_USER'];
}
if (array_key_exists('MAUTIC_DB_PASSWORD', $_ENV)) {
    $parameters['db_password'] = $_ENV['MAUTIC_DB_PASSWORD'];
}
if (array_key_exists('MAUTIC_TRUSTED_PROXIES', $_ENV)) {
    $parameters['trusted_proxies'] = explode(',', $_ENV['MAUTIC_TRUSTED_PROXIES']);
}
