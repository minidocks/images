<?php

$debugMode = $container->hasParameter('mautic.debug') ? $container->getParameter('mautic.debug') : $container->getParameter('kernel.debug');

$container->loadFromExtension('monolog', [
    'channels' => [
        'mautic',
    ],
    'handlers' => [
        'main' => [
            'formatter'    => $debugMode ? 'mautic.monolog.fulltrace.formatter' : null,
            'type'         => 'fingers_crossed',
            'buffer_size'  => '200',
            'action_level' => ($debugMode) ? 'debug' : 'error',
            'handler'      => 'nested',
            'channels'     => [
                '!mautic',
            ],
        ],
        'nested' => [
            'type' => 'stream',
            'path' => '/proc/1/fd/1',
            'level'     => ($debugMode) ? 'debug' : 'error',
        ],
        'mautic' => [
            'formatter' => $debugMode ? 'mautic.monolog.fulltrace.formatter' : null,
            'type' => 'stream',
            'path' => '/proc/1/fd/1',
            'level'     => ($debugMode) ? 'debug' : 'notice',
            'channels'  => [
                'mautic',
            ],
        ],
    ],
]);
