#!/usr/bin/env python3
"""
requirements-engineering tree verifier (READ-ONLY).

History note: an earlier build_tree.py existed that recreated the tree from
early-skeleton template content. It was REMOVED on 2026-09-01 because running
it would overwrite the compiled modules with placeholder text. The compiled
tree is the source of truth now; use git or a directory copy to move it.

This script only VERIFIES that the expected tree is present and non-trivial.
It writes nothing.
"""
import os
import sys

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

EXPECTED = {
    "SKILL.md": 5000,
    "README.md": 4000,
    "PROGRESS.md": 4000,
    "stages/s1-business-analysis.md": 5000,
    "stages/s2-elicitation.md": 5000,
    "stages/s3-analysis.md": 5000,
    "stages/s4-specification.md": 5000,
    "stages/s5-validation.md": 5000,
    "stages/s6-management.md": 5000,
    "methods/ears-syntax.md": 10000,
    "methods/specification-quality.md": 10000,
    "methods/brown-cow.md": 8000,
    "methods/problem-statement.md": 10000,
    "methods/traceability.md": 8000,
    "methods/impact-analysis.md": 10000,
    "methods/conflict-resolution.md": 8000,
    "methods/implementation-neutrality.md": 8000,
    "methods/opportunity-assessment.md": 8000,
    "methods/acceptance-specs.md": 10000,
    "kb/ears-patterns.yaml": 8000,
    "kb/specification-quality-patterns.yaml": 3000,
    "kb/brown-cow-patterns.yaml": 5000,
    "kb/problem-statement-patterns.yaml": 5000,
    "kb/traceability-patterns.yaml": 3000,
    "kb/impact-analysis-patterns.yaml": 5000,
    "kb/conflict-resolution-patterns.yaml": 5000,
    "kb/implementation-neutrality-patterns.yaml": 6000,
    "kb/opportunity-assessment-patterns.yaml": 4000,
    "kb/acceptance-specs-patterns.yaml": 5000,
    "validators/ears_regex.yaml": 5000,
    "validators/ambiguous_words.yaml": 5000,
    "validators/implementation_leak_terms.yaml": 4000,
    "validators/schemas/business_goal_artifact.json": 2000,
    "validators/schemas/raw_requirement_artifact.json": 2000,
    "validators/schemas/specification_artifact.json": 5000,
    "validators/schemas/validation_report_artifact.json": 2500,
    "validators/schemas/re_baseline_artifact.json": 2500,
    "validators/schemas/review_report.json": 2500,
    "pact/re_fragment.pact": 3000,
}

def main():
    problems = []
    for rel_path, min_bytes in EXPECTED.items():
        full = os.path.join(BASE_DIR, rel_path.replace("/", os.sep))
        if not os.path.exists(full):
            problems.append("MISSING  " + rel_path)
            continue
        size = os.path.getsize(full)
        if size < min_bytes:
            problems.append("SUSPECT  %s (%d bytes < expected %d; placeholder?)" % (rel_path, size, min_bytes))
        else:
            print("OK       %s (%d bytes)" % (rel_path, size))

    print()
    if problems:
        for p in problems:
            print(p)
        print("\n%d problem(s) found." % len(problems))
        return 1
    print("All %d expected files present and non-trivial." % len(EXPECTED))
    return 0

if __name__ == "__main__":
    sys.exit(main())
