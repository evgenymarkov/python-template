from python_example import hello


def test_get_greeting():
    assert hello.get_greeting("username") == "Hello, username!"
