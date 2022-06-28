# App Presença

## Ao rodar na Web acessamos a interface do professor

### Tela de Welcome do Professor

![Tela prof](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/welcome_teacher.png)

### Nova chamada

- Pede o nome da matéria
- Data e hora de início da chamada
- Data e hora de fim da chamada

Ao clicar em "Salvar" a chamada é criada na Firestore. O ID é o hash SHA256 do nome da matéria, id do professor, data e hora de início e fim da chamada.
Assim evitamos que duas chamadas sejam criadas com as mesmas informações.

![Nova chamada](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/new_list.png)

### Chamadas existentes

Puxa as chamadas existentes da Firestore, filtrando pelo ID do professor.

![](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/lists.png)

### Lista de chamada

Mostra um QR code com o ID da chamada, e a lista de alunos que responderam.

Alunos fazem parte de uma coleção "nested" dentro da chamada.

Os alunos vão sendo exibidos em tempo real para que o professor possa verificar se respondeu ou não na hora.

![](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/list.png)

## Interface do Aluno

### Tela de Welcome do Aluno

![](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/aluno_home.PNG)

### Tela de responder chamada

Caso a chamada não exista, é mostrado um modal com erro. Caso contrário, é mostrado uma mensagem de sucesso e o aluno volta para a tela de welcome.

![](https://raw.githubusercontent.com/leochaddad/presenca/master/demo_images/aluno_qr.PNG)
