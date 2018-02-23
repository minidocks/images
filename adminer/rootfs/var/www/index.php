<?php
function adminer_object() {
    // required to run any plugin
    include_once "./plugins/plugin.php";

    // autoloader
    foreach (glob("plugins/*.php") as $filename) {
        include_once "./$filename";
    }

    $plugins = [];
    foreach (preg_split('/[ ,]/', getenv('ADMINER_PLUGINS')) as $plugin) {
        if (class_exists($plugin)) {
            $plugins[] = new $plugin;
        }
    }

    /* It is possible to combine customization and plugins:
    class AdminerCustomization extends AdminerPlugin {
    }
    return new AdminerCustomization($plugins);
    */

    return new AdminerPlugin($plugins);
}

// include original Adminer or Adminer Editor
include "./adminer.php";
