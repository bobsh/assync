"""Broker work."""


import click
from nats.aio.client import Client as NATS
from stan.aio.client import Client as STAN
from assync.broker.status import status
from assync.broker.server import start


class Broker:
    """Broker class."""

    def __init__(self):
        """Initialize broker handler."""
        self.nc = NATS()
        self.sc = STAN()


@click.group()
def broker():
    """Broker commands."""
    pass


broker.add_command(status)
broker.add_command(start)
