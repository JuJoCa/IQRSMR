# IQRSMR

IQRSMR basado en el enfoque MARL, el cual ofrece una mejora considerable en la eficiencia del aprendizaje, al abordar de manera efectiva el desafío
de la no estacionariedad, proporcionando a las entidades de la red (agentes) la capacidad de superar esta problemática. En comparación con enfoques
de RL y DRL de un solo agente que no consideran la información proveniente de otras entidades en la red, MARL permite que estas desarrollen una
política más estable y robusta. Este enfoque, junto con la aplicación del algoritmo Q-learning, se emplea para determinar la política óptima de
selección de acciones mediante la utilización de una función Q. La combinación de estos elementos promete potenciar tanto el rendimiento como la 
eficiencia de la red. Esto es posible debido a que el algoritmo Q-learning es simple de entender e implementar, además de que converge hacia la 
solución óptima en contextos Markovianos. Este algoritmo es apropiado para aprender funciones de valor en problemas discretos y se basa en un 
enfoque libre de modelo, eliminando la necesidad de un conocimiento completo del entorno para tomar decisiones.

La arquitectura usada es la siguiente:

![Topologia](https://github.com/JuJoCa/IQRSMR/blob/main/img/topologia.PNG)
