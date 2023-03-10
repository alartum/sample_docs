class Baz:
    def __init__(self, param1: int, param2: str) -> None:
        """Creates a new Baz object.

        Parameters
        ----------
        param1 : int
            First parameter.
        param2 : str
            Second parameter.
        """
        self.param1 = param1
        self.param2 = param2

    def print_hello(self, who: str = "World"):
        """Prints `Hello, <someone>!` where <someone> is
        specified in the parameters.

        Parameters
        ----------
        who : str, optional
            Something to say hello to, by default "World"
        """
        print(f"Hello, {who}!")
