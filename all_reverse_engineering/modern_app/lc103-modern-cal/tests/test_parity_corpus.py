import unittest

from lc103_modern_cal.parity_corpus import load_golden_parity_corpus, run_golden_parity_corpus


class ParityCorpusTests(unittest.TestCase):
    def test_load_bundled_corpus(self) -> None:
        scenarios = load_golden_parity_corpus()
        self.assertGreaterEqual(len(scenarios), 3)
        self.assertTrue(any(s.id == "start_do_next_current_source" for s in scenarios))

    def test_run_bundled_corpus(self) -> None:
        scenarios = load_golden_parity_corpus()
        report = run_golden_parity_corpus(scenarios)
        self.assertEqual(len(scenarios), report["scenario_count"])
        self.assertEqual(0, report["fail_count"])
        self.assertEqual(report["scenario_count"], report["pass_count"])


if __name__ == "__main__":
    unittest.main()
