Mailhog
=======

Configuring MailHog
-------------------

You can configure MailHog using command line options or environment variables:

| Environment         | Command line    | Default         | Description
| ------------------- | --------------- | --------------- | -----------
| MH_CORS_ORIGIN      | -cors-origin    |                 | If set, a Access-Control-Allow-Origin header is returned for API endpoints
| MH_HOSTNAME         | -hostname       | mailhog.example | Hostname to use for EHLO/HELO and message IDs
| MH_API_BIND_ADDR    | -api-bind-addr  | 0.0.0.0:8025    | Interface and port for HTTP API server to bind to
| MH_UI_BIND_ADDR     | -ui-bind-addr   | 0.0.0.0:8025    | Interface and port for HTTP UI server to bind to
| MH_MAILDIR_PATH     | -maildir-path   |                 | Maildir path (for maildir storage backend)
| MH_MONGO_COLLECTION | -mongo-coll     | messages        | MongoDB collection name for message storage
| MH_MONGO_DB         | -mongo-db       | mailhog         | MongoDB database name for message storage
| MH_MONGO_URI        | -mongo-uri      | 127.0.0.1:27017 | MongoDB host and port
| MH_SMTP_BIND_ADDR   | -smtp-bind-addr | 0.0.0.0:1025    | Interface and port for SMTP server to bind to
| MH_STORAGE          | -storage        | memory          | Set message storage: memory / mongodb / maildir
| MH_OUTGOING_SMTP    | -outgoing-smtp  |                 | JSON file defining outgoing SMTP servers
| MH_UI_WEB_PATH      | -ui-web-path    |                 | WebPath under which the ui is served (without leading or trailing slahes), e.g. 'mailhog'
