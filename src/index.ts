process.on('uncaughtException', (err: unknown) => {
    // eslint-disable-next-line no-console
    console.error('There was an uncaught error', err);
    process.exit(1);
});
