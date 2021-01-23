# ShoppingList

**Aplicação de lista de compras**

### Instalação
https://elixir-lang.org/install.html


Depois de instalado execute o comando a seguir no terminal:
```
elixir --version
```

A saída no terminal:
```
Erlang/OTP 23 [erts-11.1.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
Elixir 1.11.3 (compiled with Erlang/OTP 21)
```
#### Como rodar a aplicação

No terminal digite o seguinte comando na pasta raíz do projeto:

```
iex -S mix
```

##### caso esteja no Windows digite o seguinte comando:

```
iex.bat -S mix 
```

Crie uma lista de items:

```
iex(1) items = [%ShoppingList.Item{name: "Omo", price: 500, quantity: 1}, %ShoppingList.Item{name: "Ariel", price: 500, quantity: 1}]
```

Crie uma lista de emails:

```
iex(2) emails = ["naruto@mail.com", "luffy@mail.com", "eren@mail.com"]
```

Enfim use a função build/2 para obter o resultado:

```
iex(3) ShoppingList.build(items, emails)
```

A saída no terminal deve ser a seguinte:

```
 iex(4) [%ShoppingList.Result{email: "naruto@mail.com", total: 333},
  %ShoppingList.Result{email: "luffy@mail.com", total: 333},
  %ShoppingList.Result{email: "eren@mail.com", total: 334}
  ]
```
