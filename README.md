# IC-Eldorado
Welcome to our microelectronics research repo! Join us in developing &amp; testing a custom SPI (Serial Peripheral Interface) chip. Dive into the world of digital systems, innovation, and efficient communication. Get involved, explore our progress, and be a part of this thrilling journey in microelectronics! This undergraduate research project is being developed by a student from UFMG under the guidance of a professor from the same institution.

## Introdução
A Serial Peripheral Interface (SPI) é um protocolo de comunicação síncrono utilizado para a transferência de dados entre dispositivos em um circuito integrado. Ele envolve um mestre e um ou mais dispositivos escravos, sendo comumente usado para conectar microcontroladores, sensores, displays e outros periféricos.

O funcionamento da SPI ocorre da seguinte forma: o mestre gera um sinal de clock contínuo, sincronizando a comunicação. Ele também seleciona o dispositivo escravo com o qual deseja se comunicar, ativando sua linha de seleção (chip select). Os dados são transmitidos em ambos os sentidos simultaneamente, utilizando duas linhas de dados (MOSI - Mestre para Escravo e MISO - Escravo para Mestre).

Cada dispositivo escravo possui um registrador de deslocamento de dados (shift register) no qual os bits são armazenados temporariamente. No lado do mestre, ele envia bits para o registro de deslocamento do dispositivo escravo e recebe os bits do dispositivo escravo em seu próprio registro de deslocamento.

A comunicação ocorre por meio de trocas de bits entre os registros de deslocamento. À medida que os bits são transmitidos, os dispositivos escravos podem responder com dados relevantes. Uma vez que a transferência é concluída, o mestre desativa a linha de seleção do dispositivo escravo.

A SPI oferece alta velocidade de comunicação e é altamente configurável, permitindo ajustar parâmetros como polaridade e fase do sinal de clock. Embora seja mais complexa que outras interfaces, como I2C, a SPI é amplamente utilizada em aplicações que requerem alta taxa de transferência de dados e baixa latência.

## Referências
Serial Peripheral Interface (SPI) em Verilog. Disponível em: https://alchitry.com/serial-peripheral-interface-spi-verilog. Acesso em: [06 de agosto de 2023].
HARRIS, David Money; HARRIS, Sarah L. Projeto Digital e Arquitetura de Computadores. 2. ed. Publicado por Imagination Technologies, 2013.
