"""CLI tools."""

import click
from assync.broker import broker


@click.group()
@click.option('--debug/--no-debug', default=False)
def cli(debug):
    """Tool for assync."""
    click.echo('Debug mode is %s' % ('on' if debug else 'off'))


cli.add_command(broker)


if __name__ == "__main__":
    cli()  # pylint: disable=no-value-for-parameter
