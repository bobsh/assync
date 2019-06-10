"""Nats streaming server manager."""

import click
import os
import time
import signal
import sys
import json
import subprocess  # nosec
import http.client


class StanServer:
    """Stan server manager."""

    def __init__(self,
                 port=4222,
                 http_port=8222,
                 debug=True,
                 ):
        """Initialize server."""
        self.port = port
        self.http_port = http_port
        self.proc = None
        self.debug = debug

        env_debug_flag = os.environ.get("DEBUG_NATS_TEST")
        if env_debug_flag == "true":
            self.debug = True

    def start(self):
        """Start the server."""
        cmd = [
            "nats-streaming-server",
            "-p", "%d" % self.port,
            "-m", "%d" % self.http_port,
            "-a", "127.0.0.1",
        ]
        if self.debug:
            cmd.append("-SDV")
            cmd.append("-DV")

        if self.debug:
            self.proc = subprocess.Popen(cmd, shell=False)  # nosec
        else:
            self.proc = subprocess.Popen(
                cmd, stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                shell=False)  # nosec

        if self.debug:
            if self.proc is None:
                click.echo(
                    "Failed to start server listening on port %d started."
                    % self.port)
            else:
                click.echo(
                    "Server listening on port %d started."
                    % self.port)
        return self.proc

    def stop(self):
        """Stop the server."""
        if self.debug:
            click.echo(
                "Server listening on %d will stop." % self.port)

        if self.debug:
            if self.proc is None:
                click.echo(
                    "Failed terminating server listening on port %d"
                    % self.port)

        if self.proc.returncode is not None:
            if self.debug:
                click.echo(
                    ("Server listening on port {port} finished running "
                     "already with exit {ret}").format(
                        port=self.port, ret=self.proc.returncode))
        else:
            os.kill(self.proc.pid, signal.SIGKILL)
            self.proc.wait()
            if self.debug:
                click.echo(
                    "Server listening on %d was stopped." % self.port)


@click.command()
def start():
    """Start a stan server."""
    server = StanServer()
    server.start()

    endpoint = '127.0.0.1:{port}'.format(port=server.http_port)
    retries = 0
    while True:
        if retries > 100:
            break

        try:
            httpclient = http.client.HTTPConnection(endpoint, timeout=5)
            httpclient.request('GET', '/subsz')
            response = httpclient.getresponse()
            if response.status == 200:
                # Check that at least the minimum subjects for a
                # NATS Streaming session are ready.
                connz = json.loads(response.read())
                if connz['num_subscriptions'] < 7:
                    continue
                else:
                    break
        except (http.client.HTTPException, ConnectionRefusedError):
            retries += 1
            time.sleep(0.1)

    click.echo("Started")

    def signal_handler(*_):
        server.stop()
        sys.exit(0)

    signal.signal(signal.SIGINT, signal_handler)
    click.echo("Press ctrl-c to exit")
    signal.pause()
