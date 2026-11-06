#!/usr/bin/env python3
"""
Лабораторна 3 з АПЗ - перевірка тест-кейсів.
Читає test_cases.json і перевіряє, що в кожному кейсі заповнені потрібні поля.
Запуск: python validate_tests.py
"""

import json
import sys
from pathlib import Path

REQUIRED_FIELDS = [
    "id", "title", "priority", "type", "component",
    "preconditions", "steps", "expectedResult", "postconditions",
]

VALID_PRIORITIES = {"високий", "середній", "низький"}
VALID_TYPES = {"позитивний", "негативний"}

DATA_FILE = Path(__file__).with_name("test_cases.json")


def load_data(path: Path):
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def validate(data):
    errors = []
    test_cases = data.get("testCases", [])
    seen_ids = set()

    for i, tc in enumerate(test_cases):
        prefix = f"[{tc.get('id', f'індекс {i}')}]"
        for field in REQUIRED_FIELDS:
            if field not in tc or not str(tc[field]).strip():
                errors.append(f"{prefix} немає або порожнє поле: {field}")
        steps = tc.get("steps")
        if not isinstance(steps, list) or len(steps) == 0:
            errors.append(f"{prefix} поле «кроки» має бути непорожнім списком")
        if tc.get("priority") not in VALID_PRIORITIES:
            errors.append(f"{prefix} некоректний пріоритет: {tc.get('priority')}")
        if tc.get("type") not in VALID_TYPES:
            errors.append(f"{prefix} некоректний тип: {tc.get('type')}")
        tid = tc.get("id")
        if tid in seen_ids:
            errors.append(f"{prefix} повторюваний ідентифікатор: {tid}")
        seen_ids.add(tid)

    return errors


def main():
    if not DATA_FILE.exists():
        print(f"ПОМИЛКА: файл {DATA_FILE.name} не знайдено")
        sys.exit(1)

    data = load_data(DATA_FILE)
    errors = validate(data)

    print(f"Об'єкт тестування: {data.get('testObject')}")
    print(f"Тест-кейси: {len(data.get('testCases', []))}")
    print(f"Компоненти: {len(data.get('components', []))}")
    print("-" * 50)

    if errors:
        print("ПЕРЕВІРКУ НЕ ПРОЙДЕНО:")
        for e in errors:
            print(" -", e)
        sys.exit(1)
    else:
        print("ПЕРЕВІРКУ ПРОЙДЕНО - усі тест-кейси заповнені правильно.")
        sys.exit(0)


if __name__ == "__main__":
    main()
