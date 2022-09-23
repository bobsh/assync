"""setuptools configuration.

This defines the packaging metadata.
"""
import glob
import os
import setuptools  # type: ignore

with open("README.md", "r") as fh:
    LONG_DESCRIPTION = fh.read()


DATAFILES = [('share/man/man1',
              [f for f in glob.glob(os.path.join('man', '*'))])]

setuptools.setup(
    name="assync",
    version="0.1.0",
    author="Nobody",
    author_email="no@one.home",
    description="A small example package",
    long_description=LONG_DESCRIPTION,
    long_description_content_type="text/markdown",
    url="https://github.com/bobsh/assync",
    packages=setuptools.find_packages(exclude=["tests.*", "tests"]),
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Topic :: Software Development :: Libraries :: Application Frameworks",
    ],
    entry_points={
        'console_scripts': [
            'asstool = assync.cli:cli',
        ],
    },
    keywords=['nats'],
    install_requires=[
        "asyncio-nats-streaming==0.4.0",
        "click==7.0",
        "protobuf==3.18.3",
    ],
    data_files=DATAFILES,
)
