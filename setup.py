from setuptools import find_packages, setup

setup(
    name='SomeCrazyApp',
    version='1.0',
    description="SomeCrazyApp",
    author='techmoe',
    license='MIT',
    packages=['crazyapp'],
    install_requires=['requests'],
    entry_points="""
    [console_scripts]
    crazyapp = crazyapp.main:main
    """
)