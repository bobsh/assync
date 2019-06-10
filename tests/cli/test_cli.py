"""CLI tests."""

from __future__ import print_function
import pytest  # type: ignore
from assync.cli import cli


def test_cli(capsys):
    """Test CLI tool init."""
    with pytest.raises(SystemExit):
        cli()  # pylint: disable=no-value-for-parameter
    out, err = capsys.readouterr()
    assert 'Tool for assync' in out
    print(out, err)
