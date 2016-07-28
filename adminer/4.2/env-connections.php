<?php
class AdminerEnvConnections
{
    private $env = [];

    public function __construct()
    {
        exec('printenv', $output);
        foreach ($output as $line) {
            list($key, $value) = explode('=', $line, 2);
            $this->env[$key] = $value;
        }
    }

    public function navigation($missing)
    {
        $pwds = (array) $_SESSION['pwds'];
        $dbs = (array) $_SESSION['db'];

        foreach ($this->getMysqlConnections() as $server => $data) {
            if (!isset($data['user']) || !isset($data['password'])) {
                continue;
            }

            $username = $data['user'];
            $password = $data['password'];
            $pwds['server'][$server][$username] = $password;
            $dbs['server'][$server][$username] = [isset($data['database']) ? $data['database'] : ''];
        }

        $_SESSION['pwds'] = $pwds;
        $_SESSION['db'] = $dbs;

        return null;
    }

    private function getMysqlConnections()
    {
        $connections = [];
        foreach ($this->env as $key => $value) {
            $pos = strpos($key, '_ENV_MYSQL_');
            if (!$pos) {
                continue;
            }

            $key = strtolower($key);
            $connections[substr($key, 0, $pos)][substr($key, $pos + 11)] = $value;
        }

        return $connections;
    }
}
