<?php
class AdminerResponsive
{
    public function head()
    {
        echo '
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
        <script '.nonce().'>
            (function(document) {
                "use strict";
                document.addEventListener("DOMContentLoaded", init, false);
                function init() {
                    var menu = document.getElementById("menu");
                    var button = menu.getElementsByTagName("h1")[0];

                    if (!menu || !button) {
                        return;
                    }

                    button.addEventListener("click", function() {
                        if (menu.className.indexOf(" open") >= 0) {
                            menu.className = menu.className.replace(/ *open/, "");
                        } else {
                            menu.className += " open";
                        }
                    }, false);

                    var scrolled = localStorage.getItem("_adminerScrolled");
                    if (scrolled && scrolled >= 0) {
                        menu.scrollTop = scrolled;
                    }

                    window.addEventListener("unload", function() {
                        localStorage.setItem("_adminerScrolled", menu.scrollTop);
                    });
                }
            })(document);
        </script>
        ';
    }
}
