# IC-Eldorado
Welcome to our microelectronics research repo! Join us in developing &amp; testing a custom SPI (Serial Peripheral Interface) chip. Dive into the world of digital systems, innovation, and efficient communication. Get involved, explore our progress, and be a part of this thrilling journey in microelectronics! This undergraduate research project is being developed by a student from UFMG under the guidance of a professor from the same institution.

## Introdução
A Serial Peripheral Interface (SPI) funciona conforme um protocolo de comunicação síncrono utilizado para a transferência de dados entre dispositivos em um circuito integrado. Ele envolve um Main (Principal) e um ou mais dispositivos Secundários, sendo comumente usado para conectar microcontroladores, sensores, displays e outros periféricos.

O funcionamento da SPI ocorre da seguinte forma: o Main gera um sinal de clock contínuo, sincronizando a comunicação. Ele também seleciona o dispositivo secundário com o qual deseja se comunicar, ativando sua linha de seleção (chip select). Os dados são transmitidos em ambos os sentidos simultaneamente, utilizando duas linhas de dados (MOSI - Main para Secundário e MISO - Secundário para Main).

Cada dispositivo secundário possui um registrador de deslocamento de dados (shift register) no qual os bits são armazenados temporariamente. No lado do Main, ele envia bits para o registrador de deslocamento do dispositivo secundário e recebe os bits do dispositivo secundário em seu próprio registrador de deslocamento.

A comunicação ocorre por meio de trocas de bits entre os registradores de deslocamento. À medida que os bits são transmitidos, os dispositivos secundários podem responder com dados relevantes. Uma vez que a transferência é concluída, o Main desativa a linha de seleção do dispositivo secundário.

A SPI oferece alta velocidade de comunicação e permite ajustar parâmetros como polaridade e fase do sinal de clock. Embora seja mais complexa que outras interfaces, como I2C, a SPI é amplamente utilizada em aplicações que requerem alta taxa de transferência de dados e baixa latência.

## Escolha de um IP Core
Um IP Core (Intellectual Property Core) é um bloco de circuito digital predefinido e reutilizável que contém funcionalidades específicas, como processadores, controladores de interface, módulos de comunicação ou lógica customizada. Ele é projetado para ser incorporado em projetos maiores de sistemas digitais, permitindo economia de tempo e recursos, além de fornecer uma maneira eficiente de integrar funcionalidades complexas em um chip ou sistema. IPs cores são criados, licenciados e compartilhados entre designers, acelerando o desenvolvimento de produtos eletrônicos e sistemas embarcados.
Assim sendo, após realizar uma busca na internet por cores confiáveis e de código aberto, o Core Neorv32 foi escolhido para o projeto devido ao seu desenvolvimento recente, sua versatilidade e sua adequação aos objetivos propostos.
## Testes
Através da utilização das ferramentas do software Quartus e de um FPGA da Altera (Cyclone V), foi conduzido um teste para a avaliação da interface Serial Peripheral Interface (SPI).
Montagem na placa de desenvolvimento:

![WhatsApp Image 2023-08-31 at 18 27 27](https://github.com/stephanie-cavelar/IC-Eldorado/assets/80367957/284966eb-851e-46b0-96d2-1f819499d3cf)

Os sinais MOSI, MISO, Clock e Chip Select foram associados aos pinos da GPIO e foram devidamente conectados por fios. O teste de loopback tem a intenção de testar a comunicação entre os blocos Main e Secundário. O arquivo loopback.vhd descreve a integração entre esses dois blocos, permitindo sua implementação simultânea no FPGA.
### Modificação do módulo
Os cores Main e Secundário foram descritos em VHDL, no arquivo loopback.vhd, de forma que, no FPGA, fosse possível ter uma interface contendo tanto Main quanto Secundário. Assim, com o auxílio de chaves e do display de 7 segmentos, foi testada a comunicação entre esses dois módulos. 
Na figura a seguir pode-se observar que os dados advindos do Secundário (S-din) chegam corretamente ao Main (M-dout). Da mesma forma, os dados advindos do Main (m-din) chegam corretamente ao Secundário (s-dout), sendo que os sinais S-din e m-din, como mostrado na figura, são definidos manualmente pelo usuário, por meio das chaves disponíveis na placa de Desenvolvimento utilizada. 

![WhatsApp Image 2023-08-31 at 17 31 59](https://github.com/stephanie-cavelar/IC-Eldorado/assets/80367957/bd514fd4-02bb-4f31-a13f-75454e178348)


https://github.com/stephanie-cavelar/IC-Eldorado/assets/80367957/f0dab6ca-d5bd-4aa6-aab3-596d796bba9d

## Síntese
A etapa de síntese consiste na conversão do RTL em registradores e portas genéricas, otimização do design em área e performance, bem como o mapeamento das portas genéricas para uma biblioteca de células padrão de acordo com a tecnologia empregada. No projeto, será utilizada como ferramenta de síntese o software Genus da Cadence, e a tecnologia adotada será  a de 180nm da TMSC. 

## Referências
Serial Peripheral Interface (SPI) em Verilog. Disponível em: https://alchitry.com/serial-peripheral-interface-spi-verilog. Acesso em: [06 de agosto de 2023].

HARRIS, David Money; HARRIS, Sarah L. Projeto Digital e Arquitetura de Computadores. 2. ed. Publicado por Imagination Technologies, 2013.
