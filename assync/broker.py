"""Broker stuff."""


import click


@click.group()
def broker():
    """Broker commands."""
    pass


@broker.command()
def test():
    """Test some stuff."""
    click.echo("Foo")
