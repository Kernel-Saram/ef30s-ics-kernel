/* Copyright (c) 2011, Code Aurora Forum. All rights reserved.
<<<<<<< HEAD
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License version 2 and
* only version 2 as published by the Free Software Foundation.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*/

#ifndef _LINUX_MEMALLOC_H
#define _LINUX_MEMALLOC_H
=======
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef _LINUX_MEMALLOC_H
#define	_LINUX_MEMALLOC_H
>>>>>>> 89ca98f... lib: backport memory_alloc from cafs 3.0

#include <linux/mutex.h>
#include <linux/genalloc.h>
#include <linux/rbtree.h>

struct mem_pool {
<<<<<<< HEAD
struct mutex pool_mutex;
struct gen_pool *gpool;
unsigned long paddr;
unsigned long size;
unsigned long free;
unsigned int id;
};

struct alloc {
struct rb_node rb_node;
void *vaddr;
unsigned long paddr;
struct mem_pool *mpool;
unsigned long len;
void *caller;
};

struct mem_pool *initialize_memory_pool(unsigned long start,
unsigned long size, int mem_type);

void *allocate_contiguous_memory(unsigned long size,
int mem_type, unsigned long align, int cached);

unsigned long _allocate_contiguous_memory_nomap(unsigned long size,
int mem_type, unsigned long align, void *caller);

unsigned long allocate_contiguous_memory_nomap(unsigned long size,
int mem_type, unsigned long align);
=======
	struct mutex pool_mutex;
	struct gen_pool *gpool;
	unsigned long paddr;
	unsigned long size;
	unsigned long free;
	unsigned int id;
};

struct alloc {
	struct rb_node rb_node;
	void *vaddr;
	unsigned long paddr;
	struct mem_pool *mpool;
	unsigned long len;
	void *caller;
};

struct mem_pool *initialize_memory_pool(unsigned long start,
	unsigned long size, int mem_type);

void *allocate_contiguous_memory(unsigned long size,
	int mem_type, unsigned long align, int cached);

unsigned long _allocate_contiguous_memory_nomap(unsigned long size,
	int mem_type, unsigned long align, void *caller);

unsigned long allocate_contiguous_memory_nomap(unsigned long size,
	int mem_type, unsigned long align);
>>>>>>> 89ca98f... lib: backport memory_alloc from cafs 3.0

void free_contiguous_memory(void *addr);
void free_contiguous_memory_by_paddr(unsigned long paddr);

unsigned long memory_pool_node_paddr(void *vaddr);

unsigned long memory_pool_node_len(void *vaddr);

int memory_pool_init(void);
<<<<<<< HEAD
#endif /* _LINUX_MEMALLOC_H */
=======
#endif	/* _LINUX_MEMALLOC_H */
>>>>>>> 89ca98f... lib: backport memory_alloc from cafs 3.0
