<?php
class AdminerLoginEnvs
{
    private $servers = [];

    public function __construct($prefix = 'DATABASE_URL_')
    {
        exec('printenv', $output);
        foreach ($output as $line) {
            [$key, $value] = explode('=', $line, 2);
            if (0 === stripos($key, $prefix)) {
                $this->servers[substr($key, strlen($prefix))] = parse_url($value);
            }
        }

        if ($_POST['auth'] && !empty($this->servers)) {
            $key = $_POST['auth']['server'];
            $_POST['auth']['driver'] = $this->servers[$key]['scheme'];
        }
    }

    public function loginFormField($name, $heading, $value) {
        if (empty($this->servers)) {
            return null;
        }

        if ($name === 'server') {
            return $heading . "<select name='auth[server]'>" . optionlist(array_keys($this->servers), SERVER) . "</select>\n";
        }

        return '';
    }

    public function loginForm()
    {
        if (empty($this->servers)) {
            return null;
        }

        echo '<table cellspacing="0">
            <tr><th>'.lang('Server').'<td><select name="auth[server]">'.optionlist(array_keys($this->servers), SERVER).'</select>
        </table>
        <p><input type="submit" value="'.lang('Login').'">'.checkbox("auth[permanent]", 1, $_COOKIE["adminer_permanent"], lang('Permanent login')) . "\n";

        return true;
    }

    public function credentials() {
        if (empty($this->servers)) {
            return null;
        }

        $host = rtrim($this->servers[SERVER]['host'] . ':' . $this->servers[SERVER]['port'] ?? '', ':');

        return array($host, $this->servers[SERVER]['user'], $this->servers[SERVER]['pass']);
    }

    public function login($login, $password) {
        if (empty($this->servers)) {
            return null;
        }

        if (!$this->servers[SERVER]) {
            return false;
        }
    }
}
