# IC-Eldorado
Welcome to our microelectronics research repo! Join us in developing &amp; testing a custom SPI (Serial Peripheral Interface) chip. Dive into the world of digital systems, innovation, and efficient communication. Get involved, explore our progress, and be a part of this thrilling journey in microelectronics! This undergraduate research project is being developed by a student from UFMG under the guidance of a professor from the same institution.

## Introdução
A Serial Peripheral Interface (SPI) é um protocolo de comunicação síncrono utilizado para a transferência de dados entre dispositivos em um circuito integrado. Ele envolve um Main (Principal) e um ou mais dispositivos Secundários, sendo comumente usado para conectar microcontroladores, sensores, displays e outros periféricos.

O funcionamento da SPI ocorre da seguinte forma: o mestre gera um sinal de clock contínuo, sincronizando a comunicação. Ele também seleciona o dispositivo secundário com o qual deseja se comunicar, ativando sua linha de seleção (chip select). Os dados são transmitidos em ambos os sentidos simultaneamente, utilizando duas linhas de dados (MOSI - Main para Secundário e MISO - Secundário para Main).

Cada dispositivo secundário possui um registrador de deslocamento de dados (shift register) no qual os bits são armazenados temporariamente. No lado do Main, ele envia bits para o registrador de deslocamento do dispositivo secundário e recebe os bits do dispositivo secundário em seu próprio registrador de deslocamento.

A comunicação ocorre por meio de trocas de bits entre os registradores de deslocamento. À medida que os bits são transmitidos, os dispositivos secundários podem responder com dados relevantes. Uma vez que a transferência é concluída, o Main desativa a linha de seleção do dispositivo secundário.

A SPI oferece alta velocidade de comunicação e permite ajustar parâmetros como polaridade e fase do sinal de clock. Embora seja mais complexa que outras interfaces, como I2C, a SPI é amplamente utilizada em aplicações que requerem alta taxa de transferência de dados e baixa latência.

## Escolha de um IP Core
Um IP Core (Intellectual Property Core) é um bloco de circuito digital predefinido e reutilizável que contém funcionalidades específicas, como processadores, controladores de interface, módulos de comunicação ou lógica customizada. Ele é projetado para ser incorporado em projetos maiores de sistemas digitais, permitindo economia de tempo e recursos, além de fornecer uma maneira eficiente de integrar funcionalidades complexas em um chip ou sistema. IPs cores são criados, licenciados e compartilhados entre designers, acelerando o desenvolvimento de produtos eletrônicos e sistemas embarcados.
Assim sendo, após realizar uma busca na internet por cores confiáveis e de código aberto, o Core Neorv32 foi escolhido para o projeto devido ao seu desenvolvimento recente, sua versatilidade e sua adequação aos objetivos propostos.

## Referências
Serial Peripheral Interface (SPI) em Verilog. Disponível em: https://alchitry.com/serial-peripheral-interface-spi-verilog. Acesso em: [06 de agosto de 2023].

HARRIS, David Money; HARRIS, Sarah L. Projeto Digital e Arquitetura de Computadores. 2. ed. Publicado por Imagination Technologies, 2013.
