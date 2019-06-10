"""Broker work."""


import click
from assync.broker.status import status


@click.group()
def broker():
    """Broker commands."""
    pass


broker.add_command(status)
