import unittest

from lc103_modern_cal.protocol import assess


class ProtocolTests(unittest.TestCase):
    def test_query_detection(self) -> None:
        info = assess("CALDATE?")
        self.assertTrue(info.is_query)
        self.assertFalse(info.is_value_write)

    def test_value_write_detection(self) -> None:
        info = assess("CALSET,0,1.23")
        self.assertTrue(info.is_mutating)
        self.assertTrue(info.is_value_write)

    def test_non_mutating(self) -> None:
        info = assess("VER#?")
        self.assertFalse(info.is_mutating)


if __name__ == "__main__":
    unittest.main()
