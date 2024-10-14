

# Winid

Esta biblioteca fornece funções para gerar UUIDs (Universally Unique Identifiers) em C. O objetivo é facilitar a criação e manipulação de UUIDs em suas aplicações.

## Exemplo de Uso

- **Geração de UUIDs**: Cria UUIDs usando a função `create_uuid()`.
- **Parsing de UUIDs**: Copia o UUIDs para uma outra variavel usando a função `parse()`.

### 1. Utilizando o `parse` para copiar o ID gerado para outra variável

O exemplo abaixo mostra como criar um UUID, usar a função `parse` para copiá-lo para a variável `userid`, e, em seguida, exibi-lo.

```c
#include <stdio.h>
#include <stdlib.h>
#include "winid.h"  

int main() {
    char userid[37]; 

    Uuid *id = create_uuid(); 

    parse(userid, id); 
    
    printf("UUID gerado: %s\n", userid); 
  
    free(id); 
    return 0;
}
```

### 2. Neste exemplo, geramos um UUID e exibimos diretamente a string sem usar a função `parse()`.

```c
#include <stdio.h>
#include "winid.h" 

int main() {
    Uuid *id = create_uuid(); 
    printf("UUID gerado: %s\n", id->uuid); 
  
    free(id); 
    return 0;
}

```
## Versões 

```bash
https://github.com/kovarike/win-uuid-for-c-/releases/tag/v1.0.4
```

## Instalação

Para instalar a biblioteca `winid`, você pode usar o Chocolatey. Execute os seguintes comandos no terminal:

```bash
# Instalar a versão 1.0.4
choco install winid --version 1.0.4 -y

# Atualizar para a versão 1.0.4
choco upgrade winid --version=1.0.4

# Desinstalar a versão 1.0.4
choco uninstall winid --version=1.0.4
```

## Clonar o Repositório ou Baixar o Arquivo zip

Se preferir, você pode clonar o repositório ou baixar o arquivo zip contendo as biblioteca e cabeçalho para ser utilizado.

```bash
git clone https://github.com/kovarike/win-uuid-for-c.git
```
```bash
https://github.com/kovarike/win-uuid-for-c-/releases/tag/v1.0.4
```

### Licença

Este projeto é licenciado sob a [**MIT License**](./LICENSE). Você pode usar, copiar, modificar e distribuir este software, desde que mantenha os avisos de copyright e de permissão nas cópias ou partes substanciais do software. O software é fornecido "como está", sem garantia de qualquer tipo, expressa ou implícita.

<!-- git tag -a v1.0.0 -m "Release version 1.0.0"   -->

<!-- # Certifique-se de que você está no branch correto
git checkout main

# Faça suas alterações e adicione-as ao commit
git add .
git commit -m "Descrição das alterações"

# Crie uma nova tag
git tag v1.0.0

# Empurre a tag para o repositório remoto
git push origin v1.0.0 -->
