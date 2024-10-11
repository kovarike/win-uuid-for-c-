/*
 * MIT License
 * 
 * Copyright (c) 2024 Danilo Silva
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */




#ifndef UUID_H
#define UUID_H



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <fcntl.h>
#include <errno.h>
#include <wincrypt.h>




#define SIZE_ID 37
#define INITIAL_SIZE 17  // Tamanho inicial da tabela de hash
#define LOAD_FACTOR 0.75  // Fator de carga
#define LOG_FILE "uuid_log.txt"

// Estrutura para armazenar UUIDs em nós da lista encadeada
typedef struct UuidNode {
    char uuid[SIZE_ID];
    struct UuidNode *next;
} UuidNode;

// Estrutura para a tabela de hash
typedef struct {
    UuidNode **buckets;  // Vetor de ponteiros para os buckets
    int size;            // Tamanho atual da tabela
    int count;           // Número de elementos na tabela
} UuidHashTable;

extern UuidHashTable *uuid_table; 


typedef struct {
    char uuid[SIZE_ID];
} Uuid;


extern Uuid* id;  


// Função de logging
void log_message(const char *message);

// Função de hash simples baseada na soma dos caracteres
unsigned int hash(const char *uuid, int table_size);

// Inicializa a tabela de hash
UuidHashTable *init_uuid_table(int size);

// Função para liberar memória da lista encadeada
void free_uuid_nodes(UuidNode *node);

// Função para destruir a tabela de hash
void destroy_uuid_table(UuidHashTable *table);

// Função para redimensionar a tabela de hash
void resize_table(UuidHashTable *table);

// Função para adicionar UUID à tabela de hash
void add_uuid(UuidHashTable *table, const char *uuid);
// Função para verificar se um UUID é único
int is_unique_uuid(UuidHashTable *table, const char *uuid);

void parse(char *out, Uuid *id);

void generate_random_bytes(unsigned char *buffer, size_t size);

void guuid(Uuid *uuid);

Uuid* create_uuid(); 




#endif // UUID_H