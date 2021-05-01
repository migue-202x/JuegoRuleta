# JuegoRuleta

  Ruleta-Trucha es un sistema en red multiusuario, donde existe un administrador que controla el juego y hace de croupier y están también los demás usuarios: los jugadores.
  
  En el juego también se encuentran los jugadores ficticios. Estos ficticios pueden ser creados por el administrado/croupier y se diferencian de los jugadores reales por su       Nick, ya que su Nick de 6 caracteres es el resultado de la combinación: "X_" + UltimoFicticio de la cabecera de control aumentado en uno..., completado con ceros la parte no  significativa. Es decir, el primer ficticio será X_0001, el segundo X_0002, etc. 
  
  Por lo mismo, un jugador real no puede registrarse con un Nick que comience que ‘X_’…, ya que esto está reservado para los jugadores ficticios.
  
  Cuando los usuarios se registran en el sistema se le abre una cuenta corriente donde podrán comprar fichas (crédito) todas las veces que deseen
  Al crearse la cuenta de un jugador real se carga 15 veces la apuesta mínima y de un jugador ficticio 10 veces la apuesta mínima., y se reflejado en su saldo
  Es decir, que si la apuesta Mínima que se podrá efectuar es de $50
  * un jugador real tendrá como saldo inicial $750 y 
  * un jugador ficticio tendrá como saldo inicial $500
  
  También hay que tener en cuenta que: la apuesta máxima que se podrá efectuar es de $1000
  
  El Juego consta de 5 estados: 
  * Juego creado (0) 
  * Hagan sus apuestas (1) 
  * No va más (2)
  * Bolilla tirada (3) 
  * Premios repartidos y fin del juego (4)
  
  Un usuario podrá ingresar a la partida, si el estado de la misma es igual a 0 (Juego creado).                                                              
  
  Tanto el Croupier como los demás usuarios no podrá salir de la partida si la misma está en curso, es decir, si el estado de esa partida no es igual a 4 (‘Fin del juego y    premios repartidos’)
  
  El Croupier es quien puede bloquear o desbloquear jugadores, tanto reales como ficticios. Si un jugador está jugando una partida y se lo bloquea se lo saca de la partida con    un mensaje diciendo que ha sido bloqueado. Solo podrá volver a ingresar a una partida cuando este sea desbloqueado.
  
  Por ultimo para agregar, los jugadores ficticios se desactivan cuando el estado del juego sea igual a 4 (fin del juego y premios repartidos)

# Screenshots:

## Login

![1](https://user-images.githubusercontent.com/79773876/116770646-a4c2c980-aa1b-11eb-9a44-f0572d3ce053.png)
                   ![2](https://user-images.githubusercontent.com/79773876/116770647-a4c2c980-aa1b-11eb-96e9-30be8e739021.png)

## Panel de juego: ***Admin-Croupier***

![3](https://user-images.githubusercontent.com/79773876/116770649-a55b6000-aa1b-11eb-8b47-301d7a9e1554.png)

## Panel de juego: ***Jugadores***

![21](https://user-images.githubusercontent.com/79773876/116770602-983e7100-aa1b-11eb-8706-9e5bc75d8d7a.png)

## *** iMÁGENES VARIAS ***

![48](https://user-images.githubusercontent.com/79773876/116770636-a1c7d900-aa1b-11eb-8da8-33aa140f6efb.png)
![4](https://user-images.githubusercontent.com/79773876/116770650-a5f3f680-aa1b-11eb-964d-a13c8e35c37f.png)
![5](https://user-images.githubusercontent.com/79773876/116770652-a5f3f680-aa1b-11eb-94f8-c5fbbd6a5064.png)
![6](https://user-images.githubusercontent.com/79773876/116770654-a68c8d00-aa1b-11eb-84a8-009b26069405.png)
![7](https://user-images.githubusercontent.com/79773876/116770655-a68c8d00-aa1b-11eb-8dbb-59d095eb64f9.png)
![8](https://user-images.githubusercontent.com/79773876/116770656-a7252380-aa1b-11eb-8278-c8a9c28c078a.png)
![9](https://user-images.githubusercontent.com/79773876/116770657-a7bdba00-aa1b-11eb-8e60-d49a2a8b2502.png)
![10](https://user-images.githubusercontent.com/79773876/116770658-a8565080-aa1b-11eb-8d3b-385f65cd4708.png)
![11](https://user-images.githubusercontent.com/79773876/116770660-a8eee700-aa1b-11eb-9859-007853f50350.png)
![12](https://user-images.githubusercontent.com/79773876/116770661-a8eee700-aa1b-11eb-9aee-9c6ba9abda2b.png)
![13](https://user-images.githubusercontent.com/79773876/116770662-a9877d80-aa1b-11eb-9d76-a85151618e69.png)
![14](https://user-images.githubusercontent.com/79773876/116770595-9379bd00-aa1b-11eb-8b51-989135187e70.png)
![15](https://user-images.githubusercontent.com/79773876/116770596-95438080-aa1b-11eb-9cae-25b3c755aed0.png)
![16](https://user-images.githubusercontent.com/79773876/116770597-95438080-aa1b-11eb-8934-4c7762a83b32.png)
![17](https://user-images.githubusercontent.com/79773876/116770598-95dc1700-aa1b-11eb-959a-cb5d32f21d01.png)
![18](https://user-images.githubusercontent.com/79773876/116770599-9674ad80-aa1b-11eb-838e-0c46b79435bc.png)
![19](https://user-images.githubusercontent.com/79773876/116770600-970d4400-aa1b-11eb-91cc-205b9957b40b.png)
![20](https://user-images.githubusercontent.com/79773876/116770601-97a5da80-aa1b-11eb-97be-3cd1f262a80a.png)
![26](https://user-images.githubusercontent.com/79773876/116770611-9a083480-aa1b-11eb-8c99-072afd7014a3.png)
![22](https://user-images.githubusercontent.com/79773876/116770604-98d70780-aa1b-11eb-9bf2-ce74cffc891e.png)
![23](https://user-images.githubusercontent.com/79773876/116770606-996f9e00-aa1b-11eb-806b-267e735550aa.png)
![24](https://user-images.githubusercontent.com/79773876/116770607-996f9e00-aa1b-11eb-9d5d-0ec3d3cdefa1.png)
![25](https://user-images.githubusercontent.com/79773876/116770610-9a083480-aa1b-11eb-84ac-c77d1687796b.png)
![27](https://user-images.githubusercontent.com/79773876/116770612-9aa0cb00-aa1b-11eb-9d39-55146200f37d.png)
![28](https://user-images.githubusercontent.com/79773876/116770613-9b396180-aa1b-11eb-8c68-53c3b2a1c616.png)
![29](https://user-images.githubusercontent.com/79773876/116770614-9b396180-aa1b-11eb-9746-16534e6a9293.png)
![30](https://user-images.githubusercontent.com/79773876/116770615-9bd1f800-aa1b-11eb-85a2-91c536aaca3d.png)
![31](https://user-images.githubusercontent.com/79773876/116770616-9bd1f800-aa1b-11eb-990e-e9ca0fc49b5a.png)
![32](https://user-images.githubusercontent.com/79773876/116770617-9c6a8e80-aa1b-11eb-94da-5a23cb505298.png)
![33](https://user-images.githubusercontent.com/79773876/116770618-9c6a8e80-aa1b-11eb-974d-dfb76770f7fa.png)
![34](https://user-images.githubusercontent.com/79773876/116770619-9d032500-aa1b-11eb-8ca3-8760b44a3de4.png)
![35](https://user-images.githubusercontent.com/79773876/116770620-9d032500-aa1b-11eb-85cd-5fa49472c160.png)
![36](https://user-images.githubusercontent.com/79773876/116770621-9d9bbb80-aa1b-11eb-9b46-3278d6015721.png)
![37](https://user-images.githubusercontent.com/79773876/116770622-9d9bbb80-aa1b-11eb-96bb-e451958cb2d5.png)
![38](https://user-images.githubusercontent.com/79773876/116770623-9e345200-aa1b-11eb-81b1-491f7d20105a.png)
![39](https://user-images.githubusercontent.com/79773876/116770624-9e345200-aa1b-11eb-9787-11c9d43a5ef4.png)
![40](https://user-images.githubusercontent.com/79773876/116770626-9ecce880-aa1b-11eb-8899-23651d2e9317.png)
![41](https://user-images.githubusercontent.com/79773876/116770628-9ecce880-aa1b-11eb-98ab-625fbda7c45a.png)
![42](https://user-images.githubusercontent.com/79773876/116770629-9f657f00-aa1b-11eb-8384-7fc60edb182f.png)
![43](https://user-images.githubusercontent.com/79773876/116770630-9ffe1580-aa1b-11eb-94bf-0af9c6080a12.png)
![44](https://user-images.githubusercontent.com/79773876/116770631-9ffe1580-aa1b-11eb-9fc3-d93c82e1a7a2.png)
![45](https://user-images.githubusercontent.com/79773876/116770632-a096ac00-aa1b-11eb-9e9d-1e42dba1937b.png)
![46](https://user-images.githubusercontent.com/79773876/116770633-a12f4280-aa1b-11eb-8fea-68c54afa680b.png)
![47](https://user-images.githubusercontent.com/79773876/116770635-a12f4280-aa1b-11eb-8926-ffab0b07ca90.png)
![49](https://user-images.githubusercontent.com/79773876/116770637-a1c7d900-aa1b-11eb-93f3-01998a389097.png)
![50](https://user-images.githubusercontent.com/79773876/116770639-a2606f80-aa1b-11eb-9ecf-c82d2b91ffc8.png)
![51](https://user-images.githubusercontent.com/79773876/116770640-a2606f80-aa1b-11eb-8889-be43762f987a.png)
![52](https://user-images.githubusercontent.com/79773876/116770641-a2f90600-aa1b-11eb-8954-37df32182371.png)
![53](https://user-images.githubusercontent.com/79773876/116770642-a2f90600-aa1b-11eb-98f1-3105893b3f65.png)
![54](https://user-images.githubusercontent.com/79773876/116770643-a3919c80-aa1b-11eb-8cb7-688ecd4c3a5e.png)
![55](https://user-images.githubusercontent.com/79773876/116770644-a3919c80-aa1b-11eb-8564-e1c8967d2afd.png)
![56](https://user-images.githubusercontent.com/79773876/116770645-a42a3300-aa1b-11eb-8b43-0327cdd09ec1.png)


