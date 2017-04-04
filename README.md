# YAPLC

YAPLC - это свободная система программирования [ПЛК](https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D0%B9_%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_%D0%BA%D0%BE%D0%BD%D1%82%D1%80%D0%BE%D0%BB%D0%BB%D0%B5%D1%80).

YAPLC представляет собой набор программ и бибилиотек со свободными лицензиями, 
которые позволяют создавать программное обеспечение ПЛК на базе микроконтроллеров.

По состоянию на 4 апреля 2017 г. YAPLC включает следующие компоненты:
* [Beremiz](https://bitbucket.org/skvorl/beremiz) - интегрированная среда разработки программных ПЛК на языках IEC-61131-3;
* [matiec](https://bitbucket.org/mjsousa/matiec) - транслятор языков програмрования IEC-61131-3, генерирует программный ПЛК на Си;
* [CanFestival](https://github.com/nucleron/CanFestival-3) - свободный стек CanOpen;
* [FreeModbus](https://github.com/nucleron/freemodbus-v1.5.0) - свободный стек ModBus;
* [libopencm3](https://github.com/libopencm3/libopencm3) - свободная библиотека драйверов периферии для микроконтроллеров с ядрами Cortex-Mх;
* [stm32flash](https://github.com/nucleron/stm32flash) - загрузчик для микрконтроллеров STM32;
* [YAPLC/RTE](https://github.com/nucleron/RTE) - минималистичная среда выполнения программмных ПЛК;
* [YAPLC/IDE](https://github.com/nucleron/IDE) - расширения для Beremiz, позволяющие создавать приложения YAPLC/RTE:
* [YaPySerial](https://github.com/nucleron/YaPySerial) - динамическая ибилиотека для замены PySerial (замечено, что PySerial не всегда корректно определяет платформу).
