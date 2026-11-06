/**
 * Лабораторна 4 з АПЗ - статичний сайт на AWS S3.
 * Невеликий скрипт для демонстраційної сторінки.
 */

(function () {
  const status = document.getElementById("status");
  const deployBtn = document.getElementById("deployBtn");

  deployBtn.addEventListener("click", () => {
    deployBtn.disabled = true;
    deployBtn.textContent = "Завантаження у S3...";
    status.textContent = "Імітація завантаження index.html у бакет S3...";

    setTimeout(() => {
      status.textContent = "Файл index.html завантажено у бакет S3 і відкрито для публічного читання.";
      status.style.color = "#15803d";
      deployBtn.textContent = "Готово - публічний доступ увімкнено";
    }, 1200);
  });
})();
