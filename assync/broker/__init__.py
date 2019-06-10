"""Broker work."""


import click
from assync.broker.status import status
from assync.broker.server import start


@click.group()
def broker():
    """Broker commands."""
    pass


broker.add_command(status)
broker.add_command(start)
