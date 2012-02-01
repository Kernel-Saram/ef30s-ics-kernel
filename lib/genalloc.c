/*
 * Basic general purpose allocator for managing special purpose memory
 * not managed by the regular kmalloc/kfree interface.
 * Uses for this includes on-device special memory, uncached memory
 * etc.
 *
 * Copyright 2005 (C) Jes Sorensen <jes@trained-monkey.org>
 *
 * This source code is licensed under the GNU General Public License,
 * Version 2.  See the file COPYING for more details.
 */

#include <linux/slab.h>
#include <linux/module.h>
#include <linux/bitmap.h>
#include <linux/genalloc.h>


/* General purpose special memory pool descriptor. */
struct gen_pool {
<<<<<<< HEAD
rwlock_t lock;	/* protects chunks list */
struct list_head chunks;	/* list of chunks in this pool */
unsigned order;	/* minimum allocation order */
=======
	rwlock_t lock;			/* protects chunks list */
	struct list_head chunks;	/* list of chunks in this pool */
	unsigned order;			/* minimum allocation order */
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
};

/* General purpose special memory pool chunk descriptor. */
struct gen_pool_chunk {
<<<<<<< HEAD
	spinlock_t lock;	/* protects bits */
	struct list_head next_chunk;	/* next chunk in pool */
	phys_addr_t phys_addr;	/* physical starting address of memory chunk */
	unsigned long start;	/* start of memory chunk */
	unsigned long size;	/* number of bits */
	unsigned long bits[0];	/* bitmap for allocating memory chunk */
=======
	spinlock_t lock;		/* protects bits */
	struct list_head next_chunk;	/* next chunk in pool */
	phys_addr_t phys_addr;		/* physical starting address of memory chunk */
	unsigned long start;		/* start of memory chunk */
	unsigned long size;		/* number of bits */
	unsigned long bits[0];		/* bitmap for allocating memory chunk */
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
};

/**
 * gen_pool_create() - create a new special memory pool
<<<<<<< HEAD
 * @order: Log base 2 of number of bytes each bitmap bit
 * represents.
 * @nid: Node id of the node the pool structure should be allocated
 * on, or -1. This will be also used for other allocations.
=======
 * @order:	Log base 2 of number of bytes each bitmap bit
 *		represents.
 * @nid:	Node id of the node the pool structure should be allocated
 *		on, or -1.  This will be also used for other allocations.
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
 *
 * Create a new special memory pool that can be used to manage special purpose
 * memory not managed by the regular kmalloc/kfree interface.
 */
struct gen_pool *__must_check gen_pool_create(unsigned order, int nid)
{
	struct gen_pool *pool;

	if (WARN_ON(order >= BITS_PER_LONG))
		return NULL;

	pool = kmalloc_node(sizeof *pool, GFP_KERNEL, nid);
	if (pool) {
		rwlock_init(&pool->lock);
		INIT_LIST_HEAD(&pool->chunks);
		pool->order = order;
	}
	return pool;
}
EXPORT_SYMBOL(gen_pool_create);

/**
 * gen_pool_add_virt - add a new chunk of special memory to the pool
 * @pool: pool to add new memory chunk to
 * @virt: virtual starting address of memory chunk to add to pool
 * @phys: physical starting address of memory chunk to add to pool
 * @size: size in bytes of the memory chunk to add to pool
 * @nid: node id of the node the chunk structure and bitmap should be
 *       allocated on, or -1
 *
 * Add a new chunk of special memory to the specified pool.
 *
 * Returns 0 on success or a -ve errno on failure.
 */
int __must_check gen_pool_add_virt(struct gen_pool *pool, unsigned long virt, phys_addr_t phys,
<<<<<<< HEAD
	size_t size, int nid)
{
	struct gen_pool_chunk *chunk;
	size_t nbytes;

	if (WARN_ON(!virt || virt + size < virt ||
		(virt & ((1 << pool->order) - 1))))
			return -EINVAL;

	size = size >> pool->order;
	if (WARN_ON(!size))
		return -EINVAL;

=======
		 size_t size, int nid)
{
	struct gen_pool_chunk *chunk;
	size_t nbytes;

	if (WARN_ON(!virt || virt + size < virt ||
	    (virt & ((1 << pool->order) - 1))))
		return -EINVAL;

	size = size >> pool->order;
	if (WARN_ON(!size))
		return -EINVAL;

>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
	nbytes = sizeof *chunk + BITS_TO_LONGS(size) * sizeof *chunk->bits;
	chunk = kzalloc_node(nbytes, GFP_KERNEL, nid);
	if (!chunk)
		return -ENOMEM;

	spin_lock_init(&chunk->lock);
	chunk->phys_addr = phys;
	chunk->start = virt >> pool->order;
<<<<<<< HEAD
	chunk->size = size;
=======
	chunk->size  = size;
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0

	write_lock(&pool->lock);
	list_add(&chunk->next_chunk, &pool->chunks);
	write_unlock(&pool->lock);

	return 0;
}
EXPORT_SYMBOL(gen_pool_add_virt);

/**
 * gen_pool_virt_to_phys - return the physical address of memory
 * @pool: pool to allocate from
 * @addr: starting address of memory
 *
 * Returns the physical address on success, or -1 on error.
 */
phys_addr_t gen_pool_virt_to_phys(struct gen_pool *pool, unsigned long addr)
{
	struct list_head *_chunk;
	struct gen_pool_chunk *chunk;

	read_lock(&pool->lock);
	list_for_each(_chunk, &pool->chunks) {
		chunk = list_entry(_chunk, struct gen_pool_chunk, next_chunk);

		if (addr >= chunk->start &&
<<<<<<< HEAD
			addr < (chunk->start + chunk->size))
				return chunk->phys_addr + addr - chunk->start;
=======
		    addr < (chunk->start + chunk->size))
			return chunk->phys_addr + addr - chunk->start;
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
	}
	read_unlock(&pool->lock);

	return -1;
}
EXPORT_SYMBOL(gen_pool_virt_to_phys);

/**
 * gen_pool_destroy() - destroy a special memory pool
<<<<<<< HEAD
 * @pool: Pool to destroy.
=======
 * @pool:	Pool to destroy.
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
 *
 * Destroy the specified special memory pool. Verifies that there are no
 * outstanding allocations.
 */
void gen_pool_destroy(struct gen_pool *pool)
{
	struct gen_pool_chunk *chunk;
	int bit;

	while (!list_empty(&pool->chunks)) {
		chunk = list_entry(pool->chunks.next, struct gen_pool_chunk,
<<<<<<< HEAD
			next_chunk);
=======
				   next_chunk);
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
		list_del(&chunk->next_chunk);

		bit = find_next_bit(chunk->bits, chunk->size, 0);
		BUG_ON(bit < chunk->size);

		kfree(chunk);
	}
	kfree(pool);
}
EXPORT_SYMBOL(gen_pool_destroy);

/**
 * gen_pool_alloc_aligned() - allocate special memory from the pool
<<<<<<< HEAD
 * @pool: Pool to allocate from.
 * @size: Number of bytes to allocate from the pool.
 * @alignment_order: Order the allocated space should be
 * aligned to (eg. 20 means allocated space
 * must be aligned to 1MiB).
=======
 * @pool:	Pool to allocate from.
 * @size:	Number of bytes to allocate from the pool.
 * @alignment_order:	Order the allocated space should be
 *			aligned to (eg. 20 means allocated space
 *			must be aligned to 1MiB).
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
 *
 * Allocate the requested number of bytes from the specified pool.
 * Uses a first-fit algorithm.
 */
unsigned long __must_check
gen_pool_alloc_aligned(struct gen_pool *pool, size_t size,
<<<<<<< HEAD
			unsigned alignment_order)
=======
		       unsigned alignment_order)
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
{
	unsigned long addr, align_mask = 0, flags, start;
	struct gen_pool_chunk *chunk;

	if (size == 0)
		return 0;

	if (alignment_order > pool->order)
		align_mask = (1 << (alignment_order - pool->order)) - 1;

	size = (size + (1UL << pool->order) - 1) >> pool->order;
<<<<<<< HEAD
=======

>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
	read_lock(&pool->lock);
	list_for_each_entry(chunk, &pool->chunks, next_chunk) {
		if (chunk->size < size)
			continue;

		spin_lock_irqsave(&chunk->lock, flags);
		start = bitmap_find_next_zero_area_off(chunk->bits, chunk->size,
<<<<<<< HEAD
			0, size, align_mask,
			chunk->start);
=======
						       0, size, align_mask,
						       chunk->start);
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
		if (start >= chunk->size) {
			spin_unlock_irqrestore(&chunk->lock, flags);
			continue;
		}

		bitmap_set(chunk->bits, start, size);
		spin_unlock_irqrestore(&chunk->lock, flags);
		addr = (chunk->start + start) << pool->order;
		goto done;
	}

	addr = 0;
done:
	read_unlock(&pool->lock);
	return addr;
}
EXPORT_SYMBOL(gen_pool_alloc_aligned);

/**
 * gen_pool_free() - free allocated special memory back to the pool
<<<<<<< HEAD
 * @pool: Pool to free to
 * @addr: Starting address of memory to free back to pool
 * @size: Size in bytes of memory to free
=======
 * @pool:	Pool to free to.
 * @addr:	Starting address of memory to free back to pool.
 * @size:	Size in bytes of memory to free.
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
 *
 * Free previously allocated special memory back to the specified pool.
 */
void gen_pool_free(struct gen_pool *pool, unsigned long addr, size_t size)
{
	struct gen_pool_chunk *chunk;
	unsigned long flags;

	if (!size)
		return;

	addr = addr >> pool->order;
	size = (size + (1UL << pool->order) - 1) >> pool->order;
<<<<<<< HEAD

	BUG_ON(addr + size < addr);
	read_lock(&pool->lock);
	list_for_each_entry(chunk, &pool->chunks, next_chunk)
		if (addr >= chunk->start &&
			addr + size <= chunk->start + chunk->size) {
=======

	BUG_ON(addr + size < addr);

	read_lock(&pool->lock);
	list_for_each_entry(chunk, &pool->chunks, next_chunk)
		if (addr >= chunk->start &&
		    addr + size <= chunk->start + chunk->size) {
>>>>>>> f3747d8... lib: bitmap/genalloc: backport from cafs 3.0
			spin_lock_irqsave(&chunk->lock, flags);
			bitmap_clear(chunk->bits, addr - chunk->start, size);
			spin_unlock_irqrestore(&chunk->lock, flags);
			goto done;
		}
	BUG_ON(1);
done:
	read_unlock(&pool->lock);
}
EXPORT_SYMBOL(gen_pool_free);
