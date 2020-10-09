Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C95C28B0D2
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-S_cK0jYVNPKc-M4r1NoV3A-1; Mon, 12 Oct 2020 04:53:24 -0400
X-MC-Unique: S_cK0jYVNPKc-M4r1NoV3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEC091084D84;
	Mon, 12 Oct 2020 08:53:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCCC65578D;
	Mon, 12 Oct 2020 08:53:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8D2A9231D;
	Mon, 12 Oct 2020 08:53:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099M40hq002987 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 18:04:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42F322166BA0; Fri,  9 Oct 2020 22:04:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DAC02166B28
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 22:03:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA31102F1E1
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 22:03:58 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-251-XVD6eXNnNlGpXoEKAhGaqQ-1; Fri, 09 Oct 2020 18:03:55 -0400
X-MC-Unique: XVD6eXNnNlGpXoEKAhGaqQ-1
Received: by mail-wm1-f68.google.com with SMTP id p15so11196200wmi.4
	for <cluster-devel@redhat.com>; Fri, 09 Oct 2020 15:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to;
	bh=6AdF7ImouyBo1v+UVVHbR2jrgxlTgfY49UnpKuJl2vo=;
	b=EXD0RW39fwwJQBPjnb5Snog0pdTYg+T03ptSkEA+DzNGKk8s5gKftP0j+b1JK0V+za
	tvbAQNeSJCzSm2aL/EnfugUFAsDA0C9KXj8PmcrXbmmGBkN5x3dgi8jr8DktplLRUMEd
	+iNNzZ+dEHK2qe8yh0mbgqjLiHbQFz79bmf0ON1geRS9VUhT0/OjlnqqJcXLjxz8JUcx
	bZsKfOsrxout0AO2symhosrLRFTNun+AwbaS+3C+QltJCkB/hILoPAHWw5oBNJQsipc9
	NRZ+WljraXnFUOzBIEh5Kr/zo4JzWnim7jM4ZaJSMDMjVUKIF87+/X/1tN6Fbsx9/RY2
	CxcA==
X-Gm-Message-State: AOAM532NgFe+d+0qDJuQ62m58CA7cZViQUOHa+Vqcx32shrENCxrihZa
	AzK1wPaB3P0ModHjKezWXt48tA==
X-Google-Smtp-Source: ABdhPJzLUGH0qXD9MRJ9uaTqaSHXSKqVIytWPhW+Fv8l3CnjdOFUZRdjqAS25NTJ59jhdr8rs7Tm+A==
X-Received: by 2002:a1c:a9d1:: with SMTP id s200mr4476wme.107.1602281034146;
	Fri, 09 Oct 2020 15:03:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
	by smtp.gmail.com with ESMTPSA id
	c18sm14231894wrq.5.2020.10.09.15.03.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Oct 2020 15:03:52 -0700 (PDT)
Date: Sat, 10 Oct 2020 00:03:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: ira.weiny@intel.com
Message-ID: <20201009220349.GQ438822@phenom.ffwll.local>
Mail-Followup-To: ira.weiny@intel.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Airlie <airlied@linux.ie>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org,
	linux-efi@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-aio@kvack.org,
	io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-10-ira.weiny@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201009195033.3208459-10-ira.weiny@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org, ceph-devel@vger.kernel.org,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
	intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 09/58] drivers/gpu: Utilize
	new kmap_thread()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 09, 2020 at 12:49:44PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> These kmap() calls in the gpu stack are localized to a single thread.
> To avoid the over head of global PKRS updates use the new kmap_thread()
> call.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

I'm guessing the entire pile goes in through some other tree. If so:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

If you want this to land through maintainer trees, then we need a
per-driver split (since aside from amdgpu and radeon they're all different
subtrees).

btw the two kmap calls in drm you highlight in the cover letter should
also be convertible to kmap_thread. We only hold vmalloc mappings for a
longer time (or it'd be quite a driver bug). So if you want maybe throw
those two as two additional patches on top, and we can do some careful
review & testing for them.
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c              | 12 ++++++------
>  drivers/gpu/drm/gma500/gma_display.c                 |  4 ++--
>  drivers/gpu/drm/gma500/mmu.c                         | 10 +++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  4 ++--
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  4 ++--
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c   |  8 ++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c         |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gtt.c                  |  4 ++--
>  drivers/gpu/drm/i915/gt/shmem_utils.c                |  4 ++--
>  drivers/gpu/drm/i915/i915_gem.c                      |  8 ++++----
>  drivers/gpu/drm/i915/i915_gpu_error.c                |  4 ++--
>  drivers/gpu/drm/i915/selftests/i915_perf.c           |  4 ++--
>  drivers/gpu/drm/radeon/radeon_ttm.c                  |  4 ++--
>  13 files changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 978bae731398..bd564bccb7a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2437,11 +2437,11 @@ static ssize_t amdgpu_ttm_gtt_read(struct file *f, char __user *buf,
>  
>  		page = adev->gart.pages[p];
>  		if (page) {
> -			ptr = kmap(page);
> +			ptr = kmap_thread(page);
>  			ptr += off;
>  
>  			r = copy_to_user(buf, ptr, cur_size);
> -			kunmap(adev->gart.pages[p]);
> +			kunmap_thread(adev->gart.pages[p]);
>  		} else
>  			r = clear_user(buf, cur_size);
>  
> @@ -2507,9 +2507,9 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
>  		if (p->mapping != adev->mman.bdev.dev_mapping)
>  			return -EPERM;
>  
> -		ptr = kmap(p);
> +		ptr = kmap_thread(p);
>  		r = copy_to_user(buf, ptr + off, bytes);
> -		kunmap(p);
> +		kunmap_thread(p);
>  		if (r)
>  			return -EFAULT;
>  
> @@ -2558,9 +2558,9 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
>  		if (p->mapping != adev->mman.bdev.dev_mapping)
>  			return -EPERM;
>  
> -		ptr = kmap(p);
> +		ptr = kmap_thread(p);
>  		r = copy_from_user(ptr + off, buf, bytes);
> -		kunmap(p);
> +		kunmap_thread(p);
>  		if (r)
>  			return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index 3df6d6e850f5..35f4e55c941f 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -400,9 +400,9 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>  		/* Copy the cursor to cursor mem */
>  		tmp_dst = dev_priv->vram_addr + cursor_gt->offset;
>  		for (i = 0; i < cursor_pages; i++) {
> -			tmp_src = kmap(gt->pages[i]);
> +			tmp_src = kmap_thread(gt->pages[i]);
>  			memcpy(tmp_dst, tmp_src, PAGE_SIZE);
> -			kunmap(gt->pages[i]);
> +			kunmap_thread(gt->pages[i]);
>  			tmp_dst += PAGE_SIZE;
>  		}
>  
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index 505044c9a673..fba7a3a461fd 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -192,20 +192,20 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
>  		pd->invalid_pte = 0;
>  	}
>  
> -	v = kmap(pd->dummy_pt);
> +	v = kmap_thread(pd->dummy_pt);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pte;
>  
> -	kunmap(pd->dummy_pt);
> +	kunmap_thread(pd->dummy_pt);
>  
> -	v = kmap(pd->p);
> +	v = kmap_thread(pd->p);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pde;
>  
> -	kunmap(pd->p);
> +	kunmap_thread(pd->p);
>  
>  	clear_page(kmap(pd->dummy_page));
> -	kunmap(pd->dummy_page);
> +	kunmap_thread(pd->dummy_page);
>  
>  	pd->tables = vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
>  	if (!pd->tables)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 38113d3c0138..274424795fb7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -566,9 +566,9 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
>  		if (err < 0)
>  			goto fail;
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_thread(page);
>  		memcpy(vaddr, data, len);
> -		kunmap(page);
> +		kunmap_thread(page);
>  
>  		err = pagecache_write_end(file, file->f_mapping,
>  					  offset, len, len,
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 7ffc3c751432..b466c677d007 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -1754,7 +1754,7 @@ static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
>  		return -EINVAL;
>  	}
>  
> -	vaddr = kmap(page);
> +	vaddr = kmap_thread(page);
>  	if (!vaddr) {
>  		pr_err("No (mappable) scratch page!\n");
>  		return -EINVAL;
> @@ -1765,7 +1765,7 @@ static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
>  		pr_err("Inconsistent initial state of scratch page!\n");
>  		err = -EINVAL;
>  	}
> -	kunmap(page);
> +	kunmap_thread(page);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 9c7402ce5bf9..447df22e2e06 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -143,7 +143,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>  	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
>  
>  	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
> -	cpu = kmap(p) + offset_in_page(offset);
> +	cpu = kmap_thread(p) + offset_in_page(offset);
>  	drm_clflush_virt_range(cpu, sizeof(*cpu));
>  	if (*cpu != (u32)page) {
>  		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
> @@ -161,7 +161,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>  	}
>  	*cpu = 0;
>  	drm_clflush_virt_range(cpu, sizeof(*cpu));
> -	kunmap(p);
> +	kunmap_thread(p);
>  
>  out:
>  	__i915_vma_put(vma);
> @@ -236,7 +236,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
>  		intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
>  
>  		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
> -		cpu = kmap(p) + offset_in_page(offset);
> +		cpu = kmap_thread(p) + offset_in_page(offset);
>  		drm_clflush_virt_range(cpu, sizeof(*cpu));
>  		if (*cpu != (u32)page) {
>  			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
> @@ -254,7 +254,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
>  		}
>  		*cpu = 0;
>  		drm_clflush_virt_range(cpu, sizeof(*cpu));
> -		kunmap(p);
> +		kunmap_thread(p);
>  		if (err)
>  			return err;
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index 7fb36b12fe7a..38da348282f1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -731,7 +731,7 @@ static void swizzle_page(struct page *page)
>  	char *vaddr;
>  	int i;
>  
> -	vaddr = kmap(page);
> +	vaddr = kmap_thread(page);
>  
>  	for (i = 0; i < PAGE_SIZE; i += 128) {
>  		memcpy(temp, &vaddr[i], 64);
> @@ -739,7 +739,7 @@ static void swizzle_page(struct page *page)
>  		memcpy(&vaddr[i + 64], temp, 64);
>  	}
>  
> -	kunmap(page);
> +	kunmap_thread(page);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 2a72cce63fd9..4cfb24e9ed62 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -312,9 +312,9 @@ static void poison_scratch_page(struct page *page, unsigned long size)
>  	do {
>  		void *vaddr;
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_thread(page);
>  		memset(vaddr, POISON_FREE, PAGE_SIZE);
> -		kunmap(page);
> +		kunmap_thread(page);
>  
>  		page = pfn_to_page(page_to_pfn(page) + 1);
>  		size -= PAGE_SIZE;
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index 43c7acbdc79d..a40d3130cebf 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -142,12 +142,12 @@ static int __shmem_rw(struct file *file, loff_t off,
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_thread(page);
>  		if (write)
>  			memcpy(vaddr + offset_in_page(off), ptr, this);
>  		else
>  			memcpy(ptr, vaddr + offset_in_page(off), this);
> -		kunmap(page);
> +		kunmap_thread(page);
>  		put_page(page);
>  
>  		len -= this;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9aa3066cb75d..cae8300fd224 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -312,14 +312,14 @@ shmem_pread(struct page *page, int offset, int len, char __user *user_data,
>  	char *vaddr;
>  	int ret;
>  
> -	vaddr = kmap(page);
> +	vaddr = kmap_thread(page);
>  
>  	if (needs_clflush)
>  		drm_clflush_virt_range(vaddr + offset, len);
>  
>  	ret = __copy_to_user(user_data, vaddr + offset, len);
>  
> -	kunmap(page);
> +	kunmap_thread(page);
>  
>  	return ret ? -EFAULT : 0;
>  }
> @@ -708,7 +708,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
>  	char *vaddr;
>  	int ret;
>  
> -	vaddr = kmap(page);
> +	vaddr = kmap_thread(page);
>  
>  	if (needs_clflush_before)
>  		drm_clflush_virt_range(vaddr + offset, len);
> @@ -717,7 +717,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
>  	if (!ret && needs_clflush_after)
>  		drm_clflush_virt_range(vaddr + offset, len);
>  
> -	kunmap(page);
> +	kunmap_thread(page);
>  
>  	return ret ? -EFAULT : 0;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 3e6cbb0d1150..aecd469b6b6e 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1058,9 +1058,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  
>  			drm_clflush_pages(&page, 1);
>  
> -			s = kmap(page);
> +			s = kmap_thread(page);
>  			ret = compress_page(compress, s, dst, false);
> -			kunmap(page);
> +			kunmap_thread(page);
>  
>  			drm_clflush_pages(&page, 1);
>  
> diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> index c2d001d9c0ec..7f7ef2d056f4 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> @@ -307,7 +307,7 @@ static int live_noa_gpr(void *arg)
>  	}
>  
>  	/* Poison the ce->vm so we detect writes not to the GGTT gt->scratch */
> -	scratch = kmap(ce->vm->scratch[0].base.page);
> +	scratch = kmap_thread(ce->vm->scratch[0].base.page);
>  	memset(scratch, POISON_FREE, PAGE_SIZE);
>  
>  	rq = intel_context_create_request(ce);
> @@ -405,7 +405,7 @@ static int live_noa_gpr(void *arg)
>  out_rq:
>  	i915_request_put(rq);
>  out_ce:
> -	kunmap(ce->vm->scratch[0].base.page);
> +	kunmap_thread(ce->vm->scratch[0].base.page);
>  	intel_context_put(ce);
>  out:
>  	stream_destroy(stream);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 004344dce140..0aba0cac51e1 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -1013,11 +1013,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f, char __user *buf,
>  
>  		page = rdev->gart.pages[p];
>  		if (page) {
> -			ptr = kmap(page);
> +			ptr = kmap_thread(page);
>  			ptr += off;
>  
>  			r = copy_to_user(buf, ptr, cur_size);
> -			kunmap(rdev->gart.pages[p]);
> +			kunmap_thread(rdev->gart.pages[p]);
>  		} else
>  			r = clear_user(buf, cur_size);
>  
> -- 
> 2.28.0.rc0.12.gb6a658bd00c9
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

