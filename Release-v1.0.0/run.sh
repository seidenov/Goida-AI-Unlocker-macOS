#!/bin/bash

# Скрипт для быстрого запуска Goida AI Unlocker на macOS

# Проверка установки Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 не найден. Пожалуйста, установите Python 3.8 или новее."
    exit 1
fi

# Проверка версии Python
PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
REQUIRED_VERSION="3.8"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "❌ Требуется Python $REQUIRED_VERSION или новее. Текущая версия: $PYTHON_VERSION"
    exit 1
fi

# Переход в директорию скрипта
cd "$(dirname "$0")"

# Проверка наличия виртуального окружения
if [ ! -d "venv" ]; then
    echo "📦 Создание виртуального окружения..."
    python3 -m venv venv
fi

# Активация виртуального окружения
source venv/bin/activate

# Проверка и установка зависимостей
echo "📚 Проверка зависимостей..."
pip install -q -r requirements.txt

# Запуск приложения
echo "🚀 Запуск Goida AI Unlocker..."
python main.py

# Деактивация виртуального окружения при выходе
deactivate

