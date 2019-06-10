"""Status check for broker."""

import click


@click.command()
def status():
    """Status of broker."""
    click.echo("Foo")


if __name__ == "__main__":
    status()  # pylint: disable=no-value-for-parameter
