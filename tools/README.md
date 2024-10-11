
# Winid

Esta biblioteca fornece funções para gerar UUIDs (Universally Unique Identifiers) em C. O objetivo é facilitar a criação e manipulação de UUIDs em suas aplicações.

## Exemplo de Uso

- **Geração de UUIDs**: Cria UUIDs usando a função `create_uuid()`.
- **Parsing de UUIDs**: Converte UUIDs para uma string formatada usando a função `parse()`.

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


## Instalação

Para instalar a biblioteca `winid`, você pode usar o Chocolatey. Execute os seguintes comandos no terminal:

```bash
# Instalar a versão 1.0.0
choco install winid --version 1.0.0 -y

# Atualizar para a versão 1.0.0
choco upgrade winid --version=1.0.0

# Desinstalar a versão 1.0.0
choco uninstall winid --version=1.0.0
```

## Clonar o Repositório

Se preferir, você pode clonar o repositório diretamente

```bash
git clone https://github.com/kovarike/win-uuid-for-c.git
```

### Licença

Este projeto é licenciado sob a [**MIT License**](./LICENSE). Você pode usar, copiar, modificar e distribuir este software, desde que mantenha os avisos de copyright e de permissão nas cópias ou partes substanciais do software. O software é fornecido "como está", sem garantia de qualquer tipo, expressa ou implícita.